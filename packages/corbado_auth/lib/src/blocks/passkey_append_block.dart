import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/email_verify_block.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart' as Api;

class PasskeyAppendBlockData {
  List<PasskeyFallback> availableFallbacks;
  bool canBeSkipped;
  final String identifierValue;
  final Api.LoginIdentifierType identifierType;
  final CorbadoError? error;
  PasskeyFallback? preferredFallback;
  final bool autoSubmit;
  bool passkeyOperationInProcess = false;

  factory PasskeyAppendBlockData.fromProcessResponse(Api.GeneralBlockPasskeyAppend typed) {
    return PasskeyAppendBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
      identifierType: typed.identifierType,
      autoSubmit: true,
    );
  }

  PasskeyAppendBlockData({
    this.availableFallbacks = const [],
    this.canBeSkipped = false,
    required this.identifierValue,
    required this.identifierType,
    this.error,
    this.preferredFallback,
    required this.autoSubmit,
  });
}

class PasskeyAppendBlock extends Block<PasskeyAppendBlockData> {
  PasskeyAppendBlock({required ProcessHandler processHandler, required PasskeyAppendBlockData data})
      : super(
          processHandler: processHandler,
          initialScreen: ScreenNames.PasskeyAppend,
          type: Api.BlockType.passkeyAppend,
          alternatives: [],
          data: data,
        );

  init() {
    data.availableFallbacks = alternatives.map((alternative) {
      switch (alternative.type) {
        case Api.BlockType.emailVerify:
          final typed = alternative.data as EmailVerifyBlockData;
          if (typed.verificationMethod == VerificationMethod.emailLink) {
            throw Exception('Currently not supported');
          }

          return PasskeyFallback(
            label: 'Email verification',
            onTap: () {
              processHandler.updateBlockFromClient(alternative, []);
            },
          );

        case Api.BlockType.phoneVerify:
          throw Exception('Currently not supported');

        default:
          throw Exception('Currently not supported');
      }
    }).toList();

    switch (data.availableFallbacks.length) {
      case 0:
        data.preferredFallback = null;
      case 1:
        data.preferredFallback = data.availableFallbacks.first;
      default:
        throw Exception('Currently not supported');
    }

    data.canBeSkipped = alternatives.any((a) => a.type == Api.BlockType.completed);

    if (data.autoSubmit) {
      passkeyAppend();
    }
  }

  passkeyAppend() async {
    try {
      data.passkeyOperationInProcess = true;
      final response = await corbadoService.appendPasskey();
      data.passkeyOperationInProcess = false;
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      data.passkeyOperationInProcess = false;
      processHandler.updateBlockFromError(e);
    }
  }

  Future<void> initFallbackEmailOtp() async {
    try {
      final response = await corbadoService.sendEmailOtpCode();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  skipPasskeyAppend() {

  }
}

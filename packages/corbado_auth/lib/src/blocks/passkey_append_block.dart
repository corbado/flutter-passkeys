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
  PasskeyFallback? preferredFallback;
  final bool autoSubmit;
  bool primaryLoading = false;

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
    this.preferredFallback,
    required this.autoSubmit,
  });
}

class PasskeyAppendBlock extends Block<PasskeyAppendBlockData> {
  PasskeyAppendBlock(
      {required ProcessHandler processHandler, required PasskeyAppendBlockData data, required Api.AuthType authType})
      : super(
          processHandler: processHandler,
          initialScreen: ScreenNames.PasskeyAppend,
          type: Api.BlockType.passkeyAppend,
          alternatives: [],
          data: data,
          authProcessType: authType == Api.AuthType.login ? AuthProcessType.Login : AuthProcessType.Signup,
        );

  init() {
    const allowedAlternatives = [
      Api.BlockType.emailVerify,
      Api.BlockType.phoneVerify,
    ];
    data.availableFallbacks =
        alternatives.where((alternative) => allowedAlternatives.contains(alternative.type)).map((alternative) {
      switch (alternative.type) {
        case Api.BlockType.emailVerify:
          final typed = alternative.data as EmailVerifyBlockData;
          if (typed.verificationMethod == VerificationMethod.emailLink) {
            throw Exception('Currently not supported');
          }

          return PasskeyFallback(
            label: 'Email verification',
            onTap: initFallbackEmailOtp,
          );

        case Api.BlockType.completed:
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

    // depending on data.canBeSkipped is only a short term fix
    if (data.autoSubmit && !data.canBeSkipped) {
      passkeyAppend();
    }
  }

  passkeyAppend() async {
    try {
      error = null;
      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final response = await corbadoService.appendPasskey();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
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

  skipPasskeyAppend() async {
    try {
      final response = await corbadoService.completeAuthProcess();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

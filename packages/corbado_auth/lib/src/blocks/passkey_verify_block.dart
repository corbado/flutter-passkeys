import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/email_verify_block.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart' as Api;

class PasskeyVerifyBlockData {
  List<PasskeyFallback> availableFallbacks;
  final String identifierValue;
  PasskeyFallback? preferredFallback;
  bool primaryLoading = false;

  factory PasskeyVerifyBlockData.fromProcessResponse(Api.GeneralBlockPasskeyVerify typed) {
    return PasskeyVerifyBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
    );
  }

  PasskeyVerifyBlockData({
    this.availableFallbacks = const [],
    required this.identifierValue,
    this.preferredFallback,
  });
}

class PasskeyVerifyBlock extends Block<PasskeyVerifyBlockData> {
  PasskeyVerifyBlock({required ProcessHandler processHandler, required PasskeyVerifyBlockData data})
      : super(
          processHandler: processHandler,
          initialScreen: ScreenNames.PasskeyVerify,
          type: Api.BlockType.passkeyVerify,
          alternatives: [],
          data: data,
          authProcessType: AuthProcessType.Login,
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
            onTap: initFallbackEmailOtp,
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

    passkeyVerify();
  }

  passkeyVerify() async {
    try {
      error = null;
      data.primaryLoading = true;
      final response = await corbadoService.verifyPasskey();
      data.primaryLoading = false;
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    } on NoCredentialsAvailableException {
      await initFallbackEmailOtp();
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

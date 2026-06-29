import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    as Api;

class PasskeyVerifyBlockData {
  PasskeyVerifyBlockData({
    required this.identifierValue,
    this.availableFallbacks = const [],
    this.preferredFallback,
  });

  factory PasskeyVerifyBlockData.fromProcessResponse(
    Api.GeneralBlockPasskeyVerify typed,
  ) {
    return PasskeyVerifyBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
    );
  }
  List<PasskeyFallback> availableFallbacks;
  final String identifierValue;
  PasskeyFallback? preferredFallback;
  bool primaryLoading = false;
}

class PasskeyVerifyBlock extends Block<PasskeyVerifyBlockData> {
  PasskeyVerifyBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         initialScreen: ScreenNames.PasskeyVerify,
         type: Api.BlockType.passkeyVerify,
         alternatives: [],
         authProcessType: AuthProcessType.Login,
       );

  @override
  void init() {
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

  Future<void> passkeyVerify() async {
    TelemetryService.instance.logMethodCalled(
      'passkeyVerify',
      'PasskeyVerifyBlock',
    );

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
    TelemetryService.instance.logMethodCalled(
      'initFallbackEmailOtp',
      'PasskeyVerifyBlock',
    );

    try {
      final response = await corbadoService.sendEmailOtpCode();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

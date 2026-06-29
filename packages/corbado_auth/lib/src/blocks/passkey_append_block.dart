import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    as Api;

class PasskeyAppendBlockData {
  PasskeyAppendBlockData({
    required this.identifierValue,
    required this.identifierType,
    required this.autoSubmit,
    this.availableFallbacks = const [],
    this.canBeSkipped = false,
    this.preferredFallback,
  });

  factory PasskeyAppendBlockData.fromProcessResponse(
    Api.GeneralBlockPasskeyAppend typed,
  ) {
    return PasskeyAppendBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
      identifierType: typed.identifierType,
      autoSubmit: true,
    );
  }
  List<PasskeyFallback> availableFallbacks;
  bool canBeSkipped;
  final String identifierValue;
  final Api.LoginIdentifierType identifierType;
  PasskeyFallback? preferredFallback;
  final bool autoSubmit;
  bool primaryLoading = false;
}

class PasskeyAppendBlock extends Block<PasskeyAppendBlockData> {
  PasskeyAppendBlock({
    required super.processHandler,
    required super.data,
    required Api.AuthType authType,
  }) : super(
         initialScreen: ScreenNames.PasskeyAppend,
         type: Api.BlockType.passkeyAppend,
         alternatives: [],
         authProcessType: authType == Api.AuthType.login
             ? AuthProcessType.Login
             : AuthProcessType.Signup,
       );

  @override
  void init() {
    const allowedAlternatives = [
      Api.BlockType.emailVerify,
      Api.BlockType.phoneVerify,
    ];
    data.availableFallbacks = alternatives
        .where((alternative) => allowedAlternatives.contains(alternative.type))
        .map((alternative) {
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
        })
        .toList();

    switch (data.availableFallbacks.length) {
      case 0:
        data.preferredFallback = null;
      case 1:
        data.preferredFallback = data.availableFallbacks.first;
      default:
        throw Exception('Currently not supported');
    }

    data.canBeSkipped = alternatives.any(
      (a) => a.type == Api.BlockType.completed,
    );

    // depending on data.canBeSkipped is only a short term fix
    if (data.autoSubmit && !data.canBeSkipped) {
      passkeyAppend();
    }
  }

  Future<void> passkeyAppend() async {
    TelemetryService.instance.logMethodCalled(
      'passkeyAppend',
      'PasskeyAppendBlock',
    );

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
    TelemetryService.instance.logMethodCalled(
      'initFallbackEmailOtp',
      'PasskeyAppendBlock',
    );

    try {
      final response = await corbadoService.sendEmailOtpCode();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  Future<void> skipPasskeyAppend() async {
    TelemetryService.instance.logMethodCalled(
      'skipPasskeyAppend',
      'PasskeyAppendBlock',
    );

    try {
      final response = await corbadoService.completeAuthProcess();
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

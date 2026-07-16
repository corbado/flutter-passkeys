import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    as api;

/// Data backing the passkey verification step of an authentication process.
class PasskeyVerifyBlockData {
  /// Creates the data describing the identifier and fallback options.
  PasskeyVerifyBlockData({
    required this.identifierValue,
    this.availableFallbacks = const [],
    this.preferredFallback,
  });

  /// Builds the data from a server [api.GeneralBlockPasskeyVerify] response.
  factory PasskeyVerifyBlockData.fromProcessResponse(
    api.GeneralBlockPasskeyVerify typed,
  ) {
    return PasskeyVerifyBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
    );
  }

  /// The fallback verification options available to the user.
  List<PasskeyFallback> availableFallbacks;

  /// The identifier value (e.g. email) being verified.
  final String identifierValue;

  /// The fallback that should be used by default, if any.
  PasskeyFallback? preferredFallback;

  /// Whether the primary action is currently loading.
  bool primaryLoading = false;
}

/// Block that drives the passkey verification step of an authentication
/// process.
class PasskeyVerifyBlock extends Block<PasskeyVerifyBlockData> {
  /// Creates the block with the given process handler and data.
  PasskeyVerifyBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         initialScreen: ScreenNames.PasskeyVerify,
         type: api.BlockType.passkeyVerify,
         alternatives: [],
         authProcessType: AuthProcessType.Login,
       );

  @override
  void init() {
    data.availableFallbacks = alternatives.map((alternative) {
      return switch (alternative.type) {
        api.BlockType.emailVerify
            when (alternative.data as EmailVerifyBlockData)
                    .verificationMethod !=
                VerificationMethod.emailLink =>
          PasskeyFallback(
            label: 'Email verification',
            onTap: initFallbackEmailOtp,
          ),
        _ => throw Exception('Currently not supported'),
      };
    }).toList();

    data.preferredFallback = switch (data.availableFallbacks.length) {
      0 => null,
      1 => data.availableFallbacks.first,
      _ => throw Exception('Currently not supported'),
    };

    passkeyVerify();
  }

  /// Verifies the user with an existing passkey.
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
    } on CorbadoAuthException catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    } on NoCredentialsAvailableException {
      await initFallbackEmailOtp();
    }
  }

  /// Starts the email one-time password fallback verification.
  Future<void> initFallbackEmailOtp() async {
    TelemetryService.instance.logMethodCalled(
      'initFallbackEmailOtp',
      'PasskeyVerifyBlock',
    );

    try {
      final response = await corbadoService.sendEmailOtpCode();
      processHandler.updateBlockFromServer(response);
    } on CorbadoAuthException catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

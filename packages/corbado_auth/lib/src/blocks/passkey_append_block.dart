import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    hide VerificationMethod;

/// Data backing the passkey append step of an authentication process.
class PasskeyAppendBlockData {
  /// Creates the data describing the identifier and fallback options.
  PasskeyAppendBlockData({
    required this.identifierValue,
    required this.identifierType,
    required this.autoSubmit,
    this.availableFallbacks = const [],
    this.canBeSkipped = false,
    this.preferredFallback,
  });

  /// Builds the data from a server [GeneralBlockPasskeyAppend] response.
  factory PasskeyAppendBlockData.fromProcessResponse(
    GeneralBlockPasskeyAppend typed,
  ) {
    return PasskeyAppendBlockData(
      availableFallbacks: [],
      identifierValue: typed.identifierValue,
      identifierType: typed.identifierType,
      autoSubmit: true,
    );
  }

  /// The fallback verification options available to the user.
  List<PasskeyFallback> availableFallbacks;

  /// Whether the passkey append step can be skipped.
  bool canBeSkipped;

  /// The identifier value (e.g. email) the passkey is appended for.
  final String identifierValue;

  /// The type of the identifier value.
  final LoginIdentifierType identifierType;

  /// The fallback that should be used by default, if any.
  PasskeyFallback? preferredFallback;

  /// Whether the passkey append should be triggered automatically.
  final bool autoSubmit;

  /// Whether the primary action is currently loading.
  bool primaryLoading = false;
}

/// Block that drives the passkey append step of an authentication process.
class PasskeyAppendBlock extends Block<PasskeyAppendBlockData> {
  /// Creates the block for the given [authType], process handler and data.
  PasskeyAppendBlock({
    required super.processHandler,
    required super.data,
    required AuthType authType,
  }) : super(
         initialScreen: ScreenNames.PasskeyAppend,
         type: BlockType.passkeyAppend,
         alternatives: [],
         authProcessType: authType == AuthType.login
             ? AuthProcessType.Login
             : AuthProcessType.Signup,
       );

  @override
  void init() {
    const allowedAlternatives = [
      BlockType.emailVerify,
      BlockType.phoneVerify,
    ];
    data.availableFallbacks = alternatives
        .where((alternative) => allowedAlternatives.contains(alternative.type))
        .map((alternative) {
          return switch (alternative.type) {
            BlockType.emailVerify
                when (alternative.data as EmailVerifyBlockData)
                        .verificationMethod !=
                    EmailVerificationMethod.emailLink =>
              PasskeyFallback(
                label: 'Email verification',
                onTap: initFallbackEmailOtp,
              ),
            _ => throw Exception('Currently not supported'),
          };
        })
        .toList();

    data.preferredFallback = switch (data.availableFallbacks.length) {
      0 => null,
      1 => data.availableFallbacks.first,
      _ => throw Exception('Currently not supported'),
    };

    data.canBeSkipped = alternatives.any(
      (a) => a.type == BlockType.completed,
    );

    // depending on data.canBeSkipped is only a short term fix
    if (data.autoSubmit && !data.canBeSkipped) {
      passkeyAppend();
    }
  }

  /// Creates and appends a passkey for the current user.
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
    } on CorbadoAuthException catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }

  /// Starts the email one-time password fallback verification.
  Future<void> initFallbackEmailOtp() async {
    TelemetryService.instance.logMethodCalled(
      'initFallbackEmailOtp',
      'PasskeyAppendBlock',
    );

    try {
      final response = await corbadoService.sendEmailOtpCode();
      processHandler.updateBlockFromServer(response);
    } on CorbadoAuthException catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  /// Skips the passkey append step and completes the auth process.
  Future<void> skipPasskeyAppend() async {
    TelemetryService.instance.logMethodCalled(
      'skipPasskeyAppend',
      'PasskeyAppendBlock',
    );

    try {
      final response = await corbadoService.completeAuthProcess();
      processHandler.updateBlockFromServer(response);
    } on CorbadoAuthException catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

// ignore_for_file: library_prefixes, avoid_positional_boolean_parameters

import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    as Api;

/// The method used to verify an email address.
enum VerificationMethod {
  /// Verification via a one-time password sent by email.
  emailOTP,

  /// Verification via a magic link sent by email.
  emailLink,
}

/// Data backing the email verification step of an authentication process.
class EmailVerifyBlockData {
  /// Creates the data describing the email to verify and how to verify it.
  EmailVerifyBlockData({
    required this.email,
    required this.verificationMethod,
    required this.retryNotBefore,
    required this.isPostLoginVerification,
  });

  /// Builds the data from a server [Api.GeneralBlockVerifyIdentifier] response.
  factory EmailVerifyBlockData.fromProcessResponse(
    Api.GeneralBlockVerifyIdentifier typed,
  ) {
    final verificationMethod =
        typed.verificationMethod == Api.VerificationMethod.emailOtp
        ? VerificationMethod.emailOTP
        : VerificationMethod.emailLink;

    DateTime? retryNotBefore;
    if (typed.retryNotBefore != null) {
      retryNotBefore = DateTime.fromMillisecondsSinceEpoch(
        typed.retryNotBefore! * 1000,
      );
    }

    return EmailVerifyBlockData(
      email: typed.identifier,
      verificationMethod: verificationMethod,
      retryNotBefore: retryNotBefore,
      isPostLoginVerification: typed.isPostLoginVerification,
    );
  }

  /// The email address that needs to be verified.
  final String email;

  /// The verification method to use for this email.
  final VerificationMethod verificationMethod;

  /// The earliest time at which a verification can be retried.
  DateTime? retryNotBefore;

  /// Whether this verification happens after the user has already logged in.
  final bool? isPostLoginVerification;

  /// Whether the primary action is currently loading.
  bool primaryLoading = false;
}

/// Block that drives the email verification step of an authentication process.
class EmailVerifyBlock extends Block<EmailVerifyBlockData> {
  /// Creates the block for the given [authType], process handler and data.
  EmailVerifyBlock({
    required super.processHandler,
    required super.data,
    required Api.AuthType authType,
  }) : super(
         type: Api.BlockType.emailVerify,
         alternatives: [],
         initialScreen: ScreenNames.EmailVerifyOTP,
         authProcessType: authType == Api.AuthType.login
             ? AuthProcessType.Login
             : AuthProcessType.Signup,
       );

  @override
  void init() {
    // navigateToVerifyEmail();
  }

  /// Navigates to the screen for editing the email address.
  void navigateToEditEmail() {
    TelemetryService.instance.logMethodCalled(
      'navigateToEditEmail',
      'EmailVerifyBlock',
    );

    error = null;
    processHandler.updateCurrentScreen(ScreenNames.EmailEdit);
  }

  /// Navigates to the screen for verifying the email address.
  void navigateToVerifyEmail() {
    TelemetryService.instance.logMethodCalled(
      'navigateToVerifyEmail',
      'EmailVerifyBlock',
    );

    error = null;

    if (data.verificationMethod == VerificationMethod.emailOTP) {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    } else {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    }
  }

  /// Submits the entered [otpCode] to verify the email address.
  Future<void> submitOtpCode(String otpCode) async {
    TelemetryService.instance.logMethodCalled(
      'submitOtpCode',
      'EmailVerifyBlock',
    );

    try {
      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final res = await corbadoService.verifyEmailOtpCode(otpCode);
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }

  /// Resends the verification email using the configured method.
  Future<void> resendEmail() async {
    TelemetryService.instance.logMethodCalled(
      'resendEmail',
      'EmailVerifyBlock',
    );

    try {
      if (data.verificationMethod == VerificationMethod.emailOTP) {
        final res = await corbadoService.sendEmailOtpCode();
        processHandler.updateBlockFromServer(res);

        return;
      } else {
        final res = await corbadoService.sendEmailLink();
        processHandler.updateBlockFromServer(res);

        return;
      }
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  /// Updates the email to [newValue] and restarts the verification flow.
  Future<void> updateEmail(String newValue) async {
    TelemetryService.instance.logMethodCalled(
      'updateEmail',
      'EmailVerifyBlock',
    );

    try {
      if (newValue == data.email) {
        // ignore: only_throw_errors
        throw CorbadoError(
          errorCode: 'new_identifier_same_as_old',
          translatedError: Translator.error('new_identifier_same_as_old'),
        );
      }

      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final res = await corbadoService.updateEmail(newValue);

      final error = CorbadoError.fromRequestError(res.blockBody.error);

      if (error != null) {
        data.primaryLoading = false;

        // ignore: only_throw_errors
        throw error;
      }

      await resendEmail();
      navigateToVerifyEmail();
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }
}

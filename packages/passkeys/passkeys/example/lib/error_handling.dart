import 'package:passkeys/exceptions.dart';

/// error_handling.dart

/// Returns a user-friendly error message for the given
/// [AuthenticatorException].
///
/// The switch is exhaustive over the sealed [AuthenticatorException]
/// hierarchy, so adding a new exception type fails to compile until it is
/// handled here.
String getFriendlyErrorMessage(AuthenticatorException exception) {
  return switch (exception) {
    PasskeyAuthCancelledException() =>
      'Authentication was cancelled. Please try again.',
    MissingGoogleSignInException() =>
      'You need to be signed into your Google account to use passkeys.',
    SyncAccountNotAvailableException() =>
      'Your sync account is not available. Please sign in and try again.',
    ExcludeCredentialsCanNotBeRegisteredException() =>
      'Some credentials cannot be registered. Please check and try again.',
    NoCredentialsAvailableException() =>
      'No credentials available. Try another login method, such as email OTP.',
    DomainNotAssociatedException(:final message) =>
      message ??
          'This domain is not correctly associated. '
              'Please check your configuration.',
    DeviceNotSupportedException() =>
      'This device does not support passkeys. Please update your OS.',
    NoCreateOptionException(:final message) =>
      message ??
          'No viable options found to create a credential. '
              'Check device settings.',
    TimeoutException(:final message) =>
      message ?? 'The operation timed out. Please try again.',
    MalformedBase64Url() => exception.toString(),
    UnhandledAuthenticatorException(:final code) =>
      'An unexpected error occurred (Code: $code). Please contact support.',
    PasskeyUnsupportedException() =>
      'This device does not support passkeys '
          '(requires at least Android SDK 28). Please update your OS.',
  };
}

import 'package:flutter/services.dart';
import 'package:passkeys/exceptions.dart';

/// error_handling.dart

/// Returns a user-friendly error message for the given [AuthenticatorException].
String getFriendlyErrorMessage(AuthenticatorException exception) {
  if (exception is PasskeyAuthCancelledException) {
    return 'Authentication was cancelled. Please try again.';
  } else if (exception is MissingGoogleSignInException) {
    return 'You need to be signed into your Google account to use passkeys.';
  } else if (exception is SyncAccountNotAvailableException) {
    return 'Your sync account is not available. Please sign in and try again.';
  } else if (exception is ExcludeCredentialsCanNotBeRegisteredException) {
    return 'Some credentials cannot be registered. Please check and try again.';
  } else if (exception is NoCredentialsAvailableException) {
    return 'No credentials available. Try another login method, such as email OTP.';
  } else if (exception is DomainNotAssociatedException) {
    return exception.message ?? 'This domain is not correctly associated. Please check your configuration.';
  } else if (exception is DeviceNotSupportedException) {
    return 'This device does not support passkeys. Please update your OS.';
  } else if (exception is NoCreateOptionException) {
    return exception.message ?? 'No viable options found to create a credential. Check device settings.';
  } else if (exception is TimeoutException) {
    return exception.message ?? 'The operation timed out. Please try again.';
  } else if (exception is UnhandledAuthenticatorException) {
    return 'An unexpected error occurred (Code: ${exception.code}). Please contact support.';
  } else {
    return 'An unknown error occurred. Please try again later.';
  }
}
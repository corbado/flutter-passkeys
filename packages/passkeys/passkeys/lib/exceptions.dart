/// Used as a base exception for all authenticator exceptions thrown by this
/// package.
class AuthenticatorException implements Exception {}

/// Thrown when the user cancels the passkey flow.
///
/// Platforms: Android, iOS
///
/// Suggestions:
/// - allow the user to start the flow again.
class PasskeyAuthCancelledException implements AuthenticatorException {
  /// Constructor
  PasskeyAuthCancelledException();
}

/// This exception is thrown when the user tries to login but is not logged in
/// to a Google account on his device. Being logged in to a Google account is
/// mandatory for passkeys to work on Android devices.
///
/// Platforms: Android
///
/// Suggestions:
/// - ask the user to sign in to his Google account first.
/// - use a fallback method (e.g. login via email OTP)
class MissingGoogleSignInException implements AuthenticatorException {
  /// Constructor
  MissingGoogleSignInException();
}

/// This exception is thrown when the passkey can not be retrieved from the
/// entity that is used for passkey syncing. Currently this error is observed
/// when testing on Android emulators. In these cases you need to restart the
/// emulator using the 'Cold Boot Now' option.
///
/// Platforms: Android
///
/// Suggestions:
/// - make sure that the user is signed in to his Google account
class SyncAccountNotAvailableException implements AuthenticatorException {
  /// Constructor
  SyncAccountNotAvailableException();
}

/// This exception is thrown when the user tries to login but is not logged in
/// to a Google account on his device. Being logged in to a Google account is
/// mandatory for passkeys to work on Android devices.
///
/// Platforms: Android
///
/// Suggestions:
/// - ask the user to sign in to his Google account first.
/// - use a fallback method (e.g. login via email OTP)
class ExcludeCredentialsCanNotBeRegisteredException implements AuthenticatorException {
  /// Constructor
  ExcludeCredentialsCanNotBeRegisteredException();
}

/// This exception is thrown when the user tries to login but does not have any
/// credentials available for the authenticator.
///
/// Platforms: Android, iOS
///
/// Suggestions:
/// - use a fallback method (e.g. login via email OTP)
class NoCredentialsAvailableException implements AuthenticatorException {
  /// Constructor
  NoCredentialsAvailableException();
}

class DomainNotAssociatedException implements AuthenticatorException {
  final String? message;
  /// Constructor
  DomainNotAssociatedException(this.message);

  String toString() => message ?? '';
}

/// This exception is thrown when the device does not support passkeys.
/// Suggestions:
/// - update the device OS to a newer version
class DeviceNotSupportedException implements AuthenticatorException {
  /// Constructor
  DeviceNotSupportedException();
}

/// During the create credential flow, this is thrown when no viable creation
/// options were found for the given CreateCredentialRequest. (no passkeys
/// providers available or none enabled)
///
/// Platforms: Android
///
/// Suggestions:
/// - use a fallback method (e.g. redirect the user to the device settings)
/// - ask the user to enable passkeys in the device settings
class NoCreateOptionException implements AuthenticatorException {
  final String? message;
  /// Constructor
  NoCreateOptionException(this.message);

  String toString() => message ?? '';
}

/// This exception is thrown when the user tries to login or register but the
/// operation times out.
///
/// Platforms: Android, iOS
///
/// Suggestions:
/// - ask the user to try again
class TimeoutException implements AuthenticatorException {
  final String? message;
  /// Constructor
  TimeoutException(this.message);

  String toString() => message ?? '';
}

/// This exception is thrown when a string is not a valid Base64URL encoded
/// string.
abstract class MalformedBase64Url implements AuthenticatorException {
  String toString();
}

/// This exception is thrown when the user tries to login or register but the
/// challenge is not a valid Base64URL encoded string.
///
/// Platforms: Android, iOS, Web
/// Suggestions:
/// - make sure that the challenge is a valid Base64URL encoded string without padding
class MalformedBase64UrlChallenge implements MalformedBase64Url {
  MalformedBase64UrlChallenge();

  String toString() => "Please make sure that the Challenge is a valid Base64URL encoded string without padding.";
}

/// This exception is thrown when the user tries to login or register but the
/// credential ID is not a valid Base64URL encoded string.
///
/// Platforms: Android, iOS, Web
/// Suggestions:
/// - make sure that the credential ID is a valid Base64URL encoded string without padding
class MalformedBase64UrlCredentialID implements MalformedBase64Url {
  MalformedBase64UrlCredentialID();

  String toString() => "Please make sure that all the CredentialIDs are a valid Base64URL encoded string without padding.";
}

/// This exception is thrown when the user tries to login or register but the
/// user ID is not a valid Base64URL encoded string.
///
/// Platforms: Android, iOS, Web
/// Suggestions:
/// - make sure that the user ID is a valid Base64URL encoded string
class MalformedBase64UrlUserID implements MalformedBase64Url {
  MalformedBase64UrlUserID();

  String toString() => "Please make sure that all the UserID is a valid Base64URL encoded string.";
}

/// This exception is thrown when an exception is thrown by the authenticator
/// that we do not handle so far in this package.
///
/// Platforms: Android, iOS
///
/// Suggestions:
/// - report that case the the package authors
class UnhandledAuthenticatorException implements AuthenticatorException {
  /// Constructor
  UnhandledAuthenticatorException(this.code, this.message, this.details);

  /// The error code of the exception
  final String code;
  /// The error message of the exception
  final String? message;
  /// The details of the exception
  final dynamic details;

  /// Returns a string representation of the exception
  @override
  String toString() {
    return 'Please report this exception to the package authors (code: $code, message: $message, details: $details}';
  }
}

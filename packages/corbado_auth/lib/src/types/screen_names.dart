// ignore_for_file: constant_identifier_names

/// Identifiers for the screens used during an authentication flow.
enum ScreenNames {
  /// Start of the sign up flow.
  SignupInit,

  /// Start of the login flow.
  LoginInit,

  /// Screen for editing the email address.
  EmailEdit,

  /// Screen for verifying the email via an OTP code.
  EmailVerifyOTP,

  /// Screen for verifying the email via a magic link.
  EmailVerifyLink,

  /// Screen for appending a passkey.
  PasskeyAppend,

  /// Screen for verifying with a passkey.
  PasskeyVerify,
}

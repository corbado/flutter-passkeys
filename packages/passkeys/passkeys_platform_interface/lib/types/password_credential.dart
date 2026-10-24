import 'package:passkeys_platform_interface/types/authenticate_response.dart';

/// A saved password returned by the platform credential manager.
class PasswordCredentialType {
  /// Constructs a new instance.
  const PasswordCredentialType({
    required this.username,
    required this.password,
  });

  /// The username (account identifier) the password was saved for.
  final String username;

  /// The password.
  final String password;
}

/// The credential the user picked in the platform credential manager: either
/// a saved [password] or a [passkey] assertion. Exactly one is non-null.
class PasswordOrPasskeyResponseType {
  /// Constructs a response carrying a saved password.
  const PasswordOrPasskeyResponseType.password(
    PasswordCredentialType this.password,
  ) : passkey = null;

  /// Constructs a response carrying a passkey assertion.
  const PasswordOrPasskeyResponseType.passkey(
    AuthenticateResponseType this.passkey,
  ) : password = null;

  /// The saved password, when the user picked one.
  final PasswordCredentialType? password;

  /// The passkey assertion, when the user picked a passkey. Must be sent to
  /// the relying party server exactly like the result of `authenticate`.
  final AuthenticateResponseType? passkey;
}

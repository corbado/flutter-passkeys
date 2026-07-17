import 'package:passkeys_platform_interface/types/types.dart';

/// Interface for authenticators that perform the platform WebAuthn ceremonies.
///
/// The `passkeys` package's `PasskeyAuthenticator` implements this interface.
/// Depending on this interface (instead of the `passkeys` package directly)
/// lets a package accept an authenticator without taking on the full plugin and
/// its platform requirements.
abstract interface class PasskeyAuthenticatorInterface {
  /// Creates a new passkey on the device for the given [request] and returns
  /// the credential that must be sent to the relying party server.
  Future<RegisterResponseType> register(RegisterRequestType request);

  /// Authenticates the user with a passkey for the given [request] and returns
  /// the assertion that must be sent to the relying party server.
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  );

  /// Signals to the platform that the credential in [request] is no longer
  /// recognized by the relying party, so it can be removed from the credential
  /// picker and autofill suggestions.
  Future<void> signalUnknownCredential(
    SignalUnknownCredentialRequestType request,
  );

  /// Signals to the platform the complete set of credentials that the relying
  /// party still accepts for a user, so any others can be pruned from the
  /// credential picker.
  Future<void> signalAllAcceptedCredentials(
    SignalAllAcceptedCredentialsRequestType request,
  );
}

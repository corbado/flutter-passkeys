import 'package:passkeys_platform_interface/method_channel_passkeys.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:passkeys_platform_interface/passkey_authenticator_interface.dart';

/// The interface that implementations of passkeys must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `Passkeys`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [PasskeysPlatform] methods.
abstract class PasskeysPlatform extends PlatformInterface {
  /// Constructs a PasskeysPlatform.
  PasskeysPlatform() : super(token: _token);

  static final Object _token = Object();

  static PasskeysPlatform _instance = MethodChannelPasskeys();

  /// The default instance of [PasskeysPlatform] to use.
  ///
  /// Defaults to [MethodChannelPasskeys].
  static PasskeysPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [PasskeysPlatform] when they register themselves.
  static set instance(PasskeysPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Returns true if passkeys are supported by the device
  /// We have deprecated this function (it will now always return true).
  @Deprecated('This function will now always return true.')
  Future<bool> canAuthenticate() async {
    return true;
  }

  /// Handles the platform-specific steps for the registration flow
  /// (see https://webauthn.guide/#registration)
  /// Namely it creates a public/private key pair
  /// (only the public key will be returned)
  Future<RegisterResponseType> register(RegisterRequestType request);

  /// Handles the platform-specific steps for the authentication flow
  /// (see https://webauthn.guide/#authentication)
  /// Namely it creates a signature for the challenge issued by the relying
  /// party
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  );

  /// Cancels the ongoing authenticator operation (if there is one).
  /// This is important for the case when conditional UI has been started but
  /// the user decides ignore that and login by typing his username instead.
  Future<void> cancelCurrentAuthenticatorOperation();

  /// Retrieves the availability information for passkeys, user-verifying
  /// platform authenticators, and conditional mediation whenever possible
  Future<AvailabilityType> getAvailability();

  /// Signals to the platform that the credential in [request] is no longer
  /// recognized by the relying party. Platforms that support the WebAuthn
  /// Signal API can use this hint to remove the credential from the credential
  /// picker and autofill suggestions.
  ///
  /// This is a best-effort hint; platforms without support treat it as a
  /// no-op.
  Future<void> signalUnknownCredential(
    SignalUnknownCredentialRequestType request,
  ) async {}

  /// Signals to the platform the complete set of credentials that the relying
  /// party still accepts for a user. Platforms that support the WebAuthn Signal
  /// API can use this to prune any other credentials from the credential
  /// picker.
  ///
  /// This is a best-effort hint; platforms without support treat it as a
  /// no-op.
  Future<void> signalAllAcceptedCredentials(
    SignalAllAcceptedCredentialsRequestType request,
  ) async {}
}

import 'package:passkeys_platform_interface/method_channel_passkeys.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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
  Future<bool> canAuthenticate();

  /// Handles the platform-specific steps for the registration flow
  /// (see https://webauthn.guide/#registration)
  /// Namely it creates a public/private key pair (only the public key will be returned)
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    AuthenticatorSelectionType authenticatorSelection,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  );

  /// Handles the platform-specific steps for the authentication flow
  /// (see https://webauthn.guide/#authentication)
  /// Namely it creates a signature for the challenge issued by the relying party
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials,
  );

  /// Returns the FACET ID of the app.
  /// (see https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences)
  @Deprecated(
      'The facetID should no longer be needed as this value is not used for the origin header anymore')
  Future<String> getFacetID();
}

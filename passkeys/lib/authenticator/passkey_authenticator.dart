import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

///
class PasskeyAuthenticator {
  ///
  PasskeyAuthenticator() : _platform = PasskeysPlatform.instance;

  final PasskeysPlatform _platform;

  Future<String> getFacetID() async => _platform.getFacetID();

  ///
  Future<bool> canAuthenticate() {
    return _platform.canAuthenticate();
  }

  ///
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    AuthenticatorSelectionType authSelectionType,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  ) {
    return _platform.register(
      challenge,
      relyingParty,
      user,
      authSelectionType,
      pubKeyCredParams,
      timeout,
      attestation,
    );
  }

  ///
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials,
  ) {
    return _platform.authenticate(
      relyingPartyId,
      challenge,
      timeout,
      userVerification,
      allowCredentials,
    );
  }
}

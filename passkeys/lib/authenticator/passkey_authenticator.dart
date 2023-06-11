import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

///
class PasskeyAuthenticator {
  ///
  PasskeyAuthenticator() : _platform = PasskeysPlatform.instance;

  final PasskeysPlatform _platform;

  ///
  Future<bool> canAuthenticate() {
    return _platform.canAuthenticate();
  }

  ///
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
  ) {
    return _platform.register(challenge, relyingParty, user);
  }

  ///
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
  ) {
    return _platform.authenticate(relyingPartyId, challenge);
  }
}

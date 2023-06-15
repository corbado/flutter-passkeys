import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// An implementation of [PasskeysPlatform] that uses method channels.
class MethodChannelPasskeys extends PasskeysPlatform {
  @override
  Future<bool> canAuthenticate() async => throw UnimplementedError();

  @override
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    String rawOptions,
  ) async =>
      throw UnimplementedError();

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    String rawOptions,
  ) =>
      throw UnimplementedError();
}

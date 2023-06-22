import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
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
    AuthenticatorSelectionType authenticatorSelection,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  ) async =>
      throw UnimplementedError();

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials,
  ) =>
      throw UnimplementedError();

  @override
  Future<String> getFacetID() {
    throw UnimplementedError();
  }
}

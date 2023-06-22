import 'package:flutter/foundation.dart';
import 'package:passkeys_ios/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// The iOS implementation of [PasskeysPlatform].
class PasskeysIOS extends PasskeysPlatform {
  /// Creates a new plugin implementation instance.
  PasskeysIOS({
    @visibleForTesting PasskeysApi? api,
  }) : _api = api ?? PasskeysApi();

  /// Registers this class as the default instance of [PasskeysIOS].
  static void registerWith() {
    PasskeysPlatform.instance = PasskeysIOS();
  }

  final PasskeysApi _api;

  @override
  Future<bool> canAuthenticate() async => _api.canAuthenticate();

  @override
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    AuthenticatorSelectionType authenticatorSelection,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  ) async {
    final userArg = User(name: user.name, id: user.id);
    final relyingPartyArg = RelyingParty(
      name: relyingParty.name,
      id: relyingParty.id,
    );

    final r = await _api.register(challenge, relyingPartyArg, userArg);
    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials,
  ) async {
    final r = await _api.authenticate(relyingPartyId, challenge);
    return AuthenticateResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      authenticatorData: r.authenticatorData,
      signature: r.signature,
    );
  }

  @override
  Future<String> getFacetID() async => _api.getFacetID();
}

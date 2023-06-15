import 'package:flutter/foundation.dart';
import 'package:passkeys_android/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/authenticate_response.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/register_response.dart';
import 'package:passkeys_platform_interface/types/relying_party.dart';
import 'package:passkeys_platform_interface/types/user.dart';

/// The Android implementation of [PasskeysPlatform].
class PasskeysAndroid extends PasskeysPlatform {
  /// The method channel used to interact with the native platform.
  PasskeysAndroid({
    @visibleForTesting PasskeysApi? api,
  }) : _api = api ?? PasskeysApi();

  /// Registers this class as the default instance of [PasskeysPlatform]
  static void registerWith() => PasskeysPlatform.instance = PasskeysAndroid();

  final PasskeysApi _api;

  @override
  Future<String> getSignatureFingerprint() async =>
      _api.getSignatureFingerprint();

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
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
  Future<bool> canAuthenticate() {
    return _api.canAuthenticate();
  }

  @override
  Future<RegisterResponseType> register(
      String challenge,
      RelyingPartyType relyingParty,
      UserType user,
      AuthenticatorSelectionType authSelectionType) async {
    final userArg =
        User(displayName: user.displayName, name: user.name, id: user.id);
    final relyingPartyArg = RelyingParty(
      name: relyingParty.name,
      id: relyingParty.id,
    );

    final authenticatorSelection = AuthenticatorSelection(
      authenticatorAttachment: authSelectionType.authenticatorAttachment,
      requireResidentKey: authSelectionType.requireResidentKey,
      residentKey: authSelectionType.residentKey,
      userVerification: authSelectionType.userVerification,
    );

    final r = await _api.register(
      challenge,
      relyingPartyArg,
      userArg,
      authenticatorSelection,
    );

    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }
}

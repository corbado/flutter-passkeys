import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:passkeys_android/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticate_response.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/register_response.dart';
import 'package:passkeys_platform_interface/types/relying_party.dart';
import 'package:passkeys_platform_interface/types/types.dart';
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
  Future<String> getFacetID() async => _api.getFacetID();

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials, {
    MediationType? mediation = MediationType.Optional,
  }) async {
    final r = await _api.authenticate(
      relyingPartyId,
      challenge,
      timeout,
      userVerification,
      allowCredentials?.map((e) {
        return AllowCredential(
          id: e.id,
          type: e.type,
          transports: e.transports,
        );
      }).toList(),
    );

    return AuthenticateResponseType(
        id: r.id,
        rawId: r.rawId,
        clientDataJSON: r.clientDataJSON,
        authenticatorData: r.authenticatorData,
        signature: r.signature,
        userHandle: r.userHandle);
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
    AuthenticatorSelectionType authenticatorSelection,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  ) async {
    final userArg =
        User(displayName: user.displayName, name: user.name, id: user.id);
    final relyingPartyArg = RelyingParty(
      name: relyingParty.name,
      id: relyingParty.id,
    );

    final authSelection = AuthenticatorSelection(
      authenticatorAttachment: authenticatorSelection.authenticatorAttachment,
      requireResidentKey: authenticatorSelection.requireResidentKey,
      residentKey: authenticatorSelection.residentKey,
      userVerification: authenticatorSelection.userVerification,
    );

    final r = await _api.register(
      challenge,
      relyingPartyArg,
      userArg,
      authSelection,
      pubKeyCredParams
          ?.map(
            (e) => PubKeyCredParam(
              alg: e.alg,
              type: e.type,
            ),
          )
          .toList(),
      timeout,
      attestation,
    );

    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }

  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    return;
  }
}

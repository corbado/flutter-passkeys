import 'package:flutter/foundation.dart';
import 'package:passkeys_android/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

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
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) async {
    final r = await _api.authenticate(
      request.relyingPartyId,
      request.challenge,
      request.timeout,
      request.userVerification,
      request.allowCredentials?.map((e) {
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
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    final userArg = User(
      displayName: request.user.displayName,
      name: request.user.name,
      id: request.user.id,
    );
    final relyingPartyArg = RelyingParty(
      name: request.relyingParty.name,
      id: request.relyingParty.id,
    );

    final a = request.authSelectionType;
    final authSelection = AuthenticatorSelection(
      authenticatorAttachment: a.authenticatorAttachment,
      requireResidentKey: a.requireResidentKey,
      residentKey: a.residentKey,
      userVerification: a.userVerification,
    );

    final r = await _api.register(
      request.challenge,
      relyingPartyArg,
      userArg,
      authSelection,
      request.pubKeyCredParams
          ?.map(
            (e) => PubKeyCredParam(
              alg: e.alg,
              type: e.type,
            ),
          )
          .toList(),
      request.timeout,
      request.attestation,
    );

    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }

  //
  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    return;
  }
}

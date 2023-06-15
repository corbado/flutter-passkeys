import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:passkeys_android/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/authenticate_response.dart';
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
    String rawOptions,
  ) async {
    var options = {
      'challenge': challenge,
      'timeout': 300000,
      'rpId': relyingPartyId,
      'userVerification': 'preferred',
    };

    final r = await _api.authenticate(jsonEncode(options));

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
  Future<RegisterResponseType> register(String challenge,
      RelyingPartyType relyingParty, UserType user, String rawOptions) async {
    final r = await _api.register(rawOptions);

    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }
}

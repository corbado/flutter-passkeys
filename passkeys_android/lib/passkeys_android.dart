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
  static void registerWith() {
    PasskeysPlatform.instance = PasskeysAndroid();
  }

  final PasskeysApi _api;

  @override
  Future<AuthenticateResponseType> authenticate(
      String relyingPartyId, String challenge) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<bool> canAuthenticate() {
    // TODO: implement canAuthenticate
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseType> register(
      String challenge, RelyingPartyType relyingParty, UserType user) async {
    final options = {
      "challenge": challenge,
      "rp": {"name": relyingParty.name, "id": relyingParty.id},
      "user": {"name": user.name, "displayName": user.name, "id": user.id},
      "pubKeyCredParams": [
        {"type": "public-key", "alg": -7},
        {"type": "public-key", "alg": -257}
      ],
      "authenticatorSelection": {
        "authenticatorAttachment": "platform",
        "requireResidentKey": false,
        "residentKey": "required",
        "userVerification": "required"
      },
      "timeout": 60000,
      "attestation": "none"
    };

    final r = await _api.register(jsonEncode(options));
    final resp = jsonDecode(r.responseJSON);

    return RegisterResponseType(
      id: resp['id'] as String,
      rawId: resp['rawId'] as String,
      clientDataJSON: resp['response']['clientDataJSON'] as String,
      attestationObject: resp['response']['attestationObject'] as String,
    );
  }
}

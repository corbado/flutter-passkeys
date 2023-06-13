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
  }) : _api = api ?? PasskeysApi() {
    debugPrint("PasskeysAndroid.constructor");
  }

  /// Registers this class as the default instance of [PasskeysPlatform]
  static void registerWith() {
    debugPrint("PasskeysAndroid.registerWith");
    PasskeysPlatform.instance = PasskeysAndroid();
  }

  final PasskeysApi _api;

  @override
  Future<String> getSignatureFingerprint() async {
    debugPrint("PasskeysAndroid.getSignatureFingerprint");
    return _api.getSignatureFingerprint();
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
  ) async {
    final options = {
      'publicKey': {
        'challenge': challenge,
        'timeout': 300000,
        'rpId': relyingPartyId,
        'userVerification': 'preferred'
      }
    };

    final r = await _api.authenticate(jsonEncode(options));
    final resp = jsonDecode(r.responseJSON);

    var test = {
      'type': 'public-key',
      'id': 'YzkU42pFzm9zp_dIdFtGSNqlwHZnYJYSx-56ghalXgg',
      'rawId': 'YzkU42pFzm9zp_dIdFtGSNqlwHZnYJYSx-56ghalXgg',
      'authenticatorAttachment': 'platform',
      'response': {
        'clientDataJSON':
            'eyJ0eXBlIjoid2ViYXV0aG4uZ2V0IiwiY2hhbGxlbmdlIjoiRl9ILWthYXB6UExKSkNNV2xQV2Vqem1EWEd1VWc1MDdtdXp0Qm1wam5tcyIsIm9yaWdpbiI6Imh0dHBzOi8vYXBwLmNvcmJhZG8uY29tIiwiY3Jvc3NPcmlnaW4iOmZhbHNlfQ',
        'authenticatorData':
            'Kl6q_MLSSgKrOavol8QFRDm8KpVFtLK_cF4F6oCpzOQFAAAAAA',
        'signature':
            'MEQCIAtFij0IqB6u1CDTrMs5iH4ElQIuxuEXhHFwxrPX_WCiAiA3e8XHcVSHldoJuryJ8hxcH9rfkFASkyPiLzHNQEFI5w',
        'userHandle': 'dXNyLTM2NzE0MzM5NjkzMzYwMTIyMQ'
      },
      'clientExtensionResults': {}
    };

    return AuthenticateResponseType(
      id: resp['id'] as String,
      rawId: resp['rawId'] as String,
      clientDataJSON: resp['response']['clientDataJSON'] as String,
      authenticatorData: resp['response']['authenticatorData'] as String,
      signature: resp['response']['signature'] as String,
    );
  }

  @override
  Future<bool> canAuthenticate() {
    return _api.canAuthenticate();
  }

  @override
  Future<RegisterResponseType> register(
      String challenge, RelyingPartyType relyingParty, UserType user) async {
    final options = {
      'challenge': challenge,
      'rp': {'name': relyingParty.name, 'id': relyingParty.id},
      'user': {'name': user.name, 'displayName': user.name, 'id': user.id},
      'pubKeyCredParams': [
        {'type': 'public-key', 'alg': -7},
        {'type': 'public-key', 'alg': -257}
      ],
      'authenticatorSelection': {
        'authenticatorAttachment': 'platform',
        'requireResidentKey': false,
        'residentKey': 'required',
        'userVerification': 'required'
      },
      'timeout': 60000,
      'attestation': 'none'
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

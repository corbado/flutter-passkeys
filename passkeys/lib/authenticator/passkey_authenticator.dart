import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

///
class PasskeyAuthenticator {
  ///
  PasskeyAuthenticator() : _platform = PasskeysPlatform.instance;

  final PasskeysPlatform _platform;

  Future<String> getSignatureFingerprint() async {
    debugPrint('getSignatureFingerprint');
    final res = await _platform.getSignatureFingerprint();
    if (res.isEmpty) return '';

    final h = res.replaceAll(':', '');
    final b = base64Url.encode(hex.decode(h));
    final c = b.replaceAll('=', '');
    debugPrint(
        '########################### Fingerprint ###########################');
    debugPrint('SHA256: $res');
    debugPrint('Base64URL encoded: $c');
    debugPrint(
        '###################################################################');
    return c;
  }

  ///
  Future<bool> canAuthenticate() {
    return _platform.canAuthenticate();
  }

  ///
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    String rawOptions,
  ) {
    return _platform.register(challenge, relyingParty, user, rawOptions);
  }

  ///
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    String rawOptions,
  ) {
    return _platform.authenticate(relyingPartyId, challenge, rawOptions);
  }
}

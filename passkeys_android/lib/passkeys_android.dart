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
    return _api.getSignatureFingerprint();
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    String rawOptions,
  ) async {
    final r = await _api.authenticate(rawOptions);
    final resp = jsonDecode(r.responseJSON);

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
  Future<RegisterResponseType> register(String challenge,
      RelyingPartyType relyingParty, UserType user, String rawOptions) async {
    debugPrint("Using rawOptions: $rawOptions");

    final r = await _api.register(rawOptions);
    final resp = jsonDecode(r.responseJSON);

    debugPrint("ClientDataJSON: ${resp['response']['clientDataJSON']}");

    return RegisterResponseType(
      id: resp['id'] as String,
      rawId: resp['rawId'] as String,
      clientDataJSON: resp['response']['clientDataJSON'] as String,
      attestationObject: resp['response']['attestationObject'] as String,
    );
  }
}

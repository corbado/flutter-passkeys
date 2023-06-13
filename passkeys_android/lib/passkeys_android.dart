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
      String challenge, RelyingPartyType relyingParty, UserType user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}

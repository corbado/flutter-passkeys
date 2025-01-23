import 'package:flutter/foundation.dart';
import 'package:passkeys_ios/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
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
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    final userArg = User(name: request.user.name, id: request.user.id);
    final relyingPartyArg = RelyingParty(
      name: request.relyingParty.name,
      id: request.relyingParty.id,
    );

    final r = await _api.register(
      request.challenge,
      relyingPartyArg,
      userArg,
      request.excludeCredentials.map((e) => e.id).toList(),
    );

    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) async {
    var conditionalUI = false;
    if (request.mediation == MediationType.Conditional) {
      conditionalUI = true;
    }

    final r = await _api.authenticate(
      request.relyingPartyId,
      request.challenge,
      conditionalUI,
      request.allowCredentials?.map((e) => e.id).toList() ?? [],
      request.preferImmediatelyAvailableCredentials,
    );

    return AuthenticateResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      authenticatorData: r.authenticatorData,
      signature: r.signature,
      userHandle: r.userHandle,
    );
  }

  @override
  Future<void> cancelCurrentAuthenticatorOperation() =>
      _api.cancelCurrentAuthenticatorOperation();

  @override
  Future<AvailabilityType> getAvailability() async {
    final availability = await _api.canAuthenticate();
    return AvailabilityType(
      hasPasskeySupport: availability,
      isUserVerifyingPlatformAuthenticatorAvailable: null,
      isConditionalMediationAvailable: null,
      isNative: true,
    );
  }
}

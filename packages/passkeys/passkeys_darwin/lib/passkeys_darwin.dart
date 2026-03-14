import 'package:flutter/foundation.dart';
import 'package:passkeys_darwin/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// The iOS/macOS implementation of [PasskeysPlatform].
class PasskeysDarwin extends PasskeysPlatform {
  /// Creates a new plugin implementation instance.
  PasskeysDarwin({
    @visibleForTesting PasskeysApi? api,
  }) : _api = api ?? PasskeysApi();

  /// Registers this class as the default instance of [PasskeysDarwin].
  static void registerWith() {
    PasskeysPlatform.instance = PasskeysDarwin();
  }

  final PasskeysApi _api;

  @override
  Future<bool> canAuthenticate() async => _api.canAuthenticate();

  @override
  Future<RegisterResponseType> register(RegisterRequestType request, String? salt) async {
    final userArg = User(name: request.user.name, id: request.user.id);
    final relyingPartyArg = RelyingParty(
      name: request.relyingParty.name,
      id: request.relyingParty.id,
    );

    final r = await _api.register(
      request.challenge,
      relyingPartyArg,
      userArg,
      request.excludeCredentials.map((e) => CredentialType(type: e.type, id: e.id, transports: e.transports ?? [])).toList(),
      request.pubKeyCredParams?.map((e) => e.alg).toList() ?? [],
      request.authSelectionType == null || request.authSelectionType!.authenticatorAttachment != 'cross-platform',
      request.authSelectionType == null || request.authSelectionType!.authenticatorAttachment != 'platform',
      request.authSelectionType?.residentKey,
      request.attestation,
      salt,
    );

    return RegisterResponseType(
      clientExtensionResults: r.clientExtensionResults,
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
      transports: r.transports.whereType<String>().toList(),
    );
  }

  @override
  Future<AuthenticateResponseType> authenticate(AuthenticateRequestType request, String? salt) async {
    var conditionalUI = false;
    if (request.mediation == MediationType.Conditional) {
      conditionalUI = true;
    }

    final r = await _api.authenticate(
      request.relyingPartyId,
      request.challenge,
      conditionalUI,
      request.allowCredentials?.map((e) => CredentialType(type: e.type, id: e.id, transports: e.transports ?? [])).toList() ?? [],
      request.preferImmediatelyAvailableCredentials,
      salt,
    );

    return AuthenticateResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      authenticatorData: r.authenticatorData,
      signature: r.signature,
      userHandle: r.userHandle ?? '',
      clientExtensionResults: r.clientExtensionResults,
    );
  }

  @override
  Future<void> cancelCurrentAuthenticatorOperation() => _api.cancelCurrentAuthenticatorOperation();

  @override
  Future<AvailabilityTypeIOS> getAvailability() async {
    final availability = await _api.canAuthenticate();
    final hasBiometrics = await _api.hasBiometrics();

    return AvailabilityTypeIOS(
      hasPasskeySupport: availability,
      hasBiometrics: hasBiometrics,
      isNative: true,
    );
  }
}

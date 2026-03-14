import 'package:flutter/foundation.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:passkeys_windows/messages.g.dart';

/// The Windows implementation of [PasskeysPlatform].
class PasskeysWindows extends PasskeysPlatform {
  /// The method channel used to interact with the native platform.
  PasskeysWindows({
    @visibleForTesting PasskeysApi? api,
  }) : _api = api ?? PasskeysApi();

  /// Registers this class as the default instance of [PasskeysPlatform]
  static void registerWith() => PasskeysPlatform.instance = PasskeysWindows();

  final PasskeysApi _api;

  @override
  Future<AuthenticateResponseType> authenticate(AuthenticateRequestType request, String? salt) async {
    final authenticateResponse = await _api.authenticate(
      request.relyingPartyId,
      request.challenge,
      request.timeout,
      request.userVerification,
      request.allowCredentials
          ?.map(
            (e) => AllowCredential(
              type: e.type,
              id: e.id,
              transports: e.transports ?? [],
            ),
          )
          .toList(),
      request.preferImmediatelyAvailableCredentials,
    );

    return AuthenticateResponseType(
      id: authenticateResponse.id,
      rawId: authenticateResponse.rawId,
      clientDataJSON: authenticateResponse.clientDataJSON,
      authenticatorData: authenticateResponse.authenticatorData,
      signature: authenticateResponse.signature,
      userHandle: authenticateResponse.userHandle,
    );
  }

  @override
  Future<bool> canAuthenticate() async {
    try {
      final r = await _api.canAuthenticate();
      return r;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<RegisterResponseType> register(RegisterRequestType request, String? salt) async {
    final userArg = User(
      displayName: request.user.displayName,
      name: request.user.name,
      id: request.user.id,
    );
    final relyingPartyArg = RelyingParty(
      name: request.relyingParty.name,
      id: request.relyingParty.id,
    );

    final requestAuthSelectionType = request.authSelectionType;

    AuthenticatorSelection? authSelection;

    if (requestAuthSelectionType != null) {
      authSelection = AuthenticatorSelection(
        authenticatorAttachment: requestAuthSelectionType.authenticatorAttachment,
        requireResidentKey: requestAuthSelectionType.requireResidentKey,
        residentKey: requestAuthSelectionType.residentKey,
        userVerification: requestAuthSelectionType.userVerification,
      );
    }

    final registerResponse = await _api.register(
      request.challenge,
      relyingPartyArg,
      userArg,
      authSelection,
      request.pubKeyCredParams?.map((e) => PubKeyCredParam(type: e.type, alg: e.alg)).toList(),
      request.timeout,
      request.attestation,
      request.excludeCredentials.map((e) => ExcludeCredential(type: e.type, id: e.id)).toList(),
    );

    return RegisterResponseType(
      id: registerResponse.id,
      rawId: registerResponse.rawId,
      clientDataJSON: registerResponse.clientDataJSON,
      attestationObject: registerResponse.attestationObject,
      transports: registerResponse.transports.whereType<String>().toList(),
    );
  }

  @override
  Future<void> cancelCurrentAuthenticatorOperation() => _api.cancelCurrentAuthenticatorOperation();

  @override
  Future<AvailabilityTypeWindows> getAvailability() async {
    final isUserVerifyingPlatformAuthenticatorAvailable = await canAuthenticate();

    final hasPasskeySupport = await _api.hasPasskeySupport();

    return AvailabilityTypeWindows(
      hasPasskeySupport: hasPasskeySupport,
      isUserVerifyingPlatformAuthenticatorAvailable: isUserVerifyingPlatformAuthenticatorAvailable,
      isNative: true,
    );
  }
}

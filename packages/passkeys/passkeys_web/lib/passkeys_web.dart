import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:web/web.dart';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:passkeys_web/interop.dart';
import 'package:passkeys_web/models/passkeyLoginRequest.dart';
import 'package:passkeys_web/models/passkeyLoginResponse.dart';
import 'package:passkeys_web/models/passkeySignUpRequest.dart';
import 'package:passkeys_web/models/passkeySignUpResponse.dart';

/// The Web implementation of [PasskeysPlatform].
class PasskeysWeb extends PasskeysPlatform {
  /// Registers this class as the default instance of [PasskeysPlatform]
  static void registerWith([Object? registrar]) {
    PasskeysPlatform.instance = PasskeysWeb();

    /// Check if the Passkeys Web JS script is loaded
    try {
      final _ = window['PasskeyAuthenticator'];
    } catch (_) {
      debugPrint(
          'Error: Passkeys Web SDK not loaded. Please include the Passkeys Web SDK (bundle.js) in your HTML file. You can find it on https://github.com/corbado/flutter-passkeys/releases/download/2.4.0/bundle.js');
      // We need to close the window to prevent the app from running afterwards thus causing runtime errors
      // This is a workaround for the fact that we cannot throw an exception in the web platform
      // because it will not be caught by the Flutter framework
      window.close();
    }

    init();
  }

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    final r = PasskeySignUpRequest(
      PublicKey(
        request.relyingParty,
        request.user,
        request.challenge,
        request.pubKeyCredParams!,
        request.authSelectionType,
        request.excludeCredentials,
        request.timeout,
        request.attestation,
      ),
    );

    try {
      final serializedRequest = jsonEncode(r.toJson());
      final response =
          await authenticatorRegister(serializedRequest.toJS).toDart;
      final decodedResponse =
          jsonDecode(response.toDart) as Map<String, dynamic>;
      final typedResponse = PasskeySignUpResponse.fromJson(decodedResponse);

      return RegisterResponseType(
        id: typedResponse.id,
        rawId: typedResponse.rawId,
        clientDataJSON: typedResponse.response.clientDataJSON,
        attestationObject: typedResponse.response.attestationObject,
        transports: typedResponse.response.transports,
      );
    } catch (e) {
      final exception = _parseException(e.toString());
      throw exception;
    }
  }

  @override
  Future<AuthenticateResponseType> authenticate(
      AuthenticateRequestType request) async {
    final r = PasskeyLoginRequest.fromPlatformType(
      request.relyingPartyId,
      request.challenge,
      request.timeout,
      request.userVerification,
      request.allowCredentials,
      request.mediation,
    );

    try {
      final serializedRequest = jsonEncode(r.toJson());
      final response = await authenticatorLogin(serializedRequest.toJS).toDart;
      final decodedResponse =
          jsonDecode(response.toDart) as Map<String, dynamic>;
      final typedResponse = PasskeyLoginResponse.fromJson(decodedResponse);

      return typedResponse.toAuthenticateResponseType();
    } catch (e) {
      final exception = _parseException(e.toString());
      throw exception;
    }
  }

  PlatformException _parseException(String exception) {
    try {
      final decoded = jsonDecode(exception) as Map<String, dynamic>;
      final code = decoded['code'] as String;
      final message = decoded['message'] as String;
      final details = decoded['details'] as String;
      return PlatformException(code: code, message: message, details: details);
    } catch (e) {
      return PlatformException(
        code: 'parse-error',
        message: 'Could not parse exception: $e',
        details: exception,
      );
    }
  }

  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    authenticatorCancel();
  }

  @override
  Future<AvailabilityTypeWeb> getAvailability() async {
    final passkeySupport = hasPasskeySupport().toDart;
    final v1 = await isUserVerifyingPlatformAuthenticatorAvailable().toDart;
    final v2 = await isConditionalMediationAvailable().toDart;

    return AvailabilityTypeWeb(
      hasPasskeySupport: passkeySupport,
      isUserVerifyingPlatformAuthenticatorAvailable:
          v1.isUndefinedOrNull ? null : v1!.toDart,
      isConditionalMediationAvailable: v2.isUndefinedOrNull ? null : v2!.toDart,
      isNative: false,
    );
  }
}

import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:js/js_util.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticate_response.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/register_response.dart';
import 'package:passkeys_platform_interface/types/relying_party.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:passkeys_platform_interface/types/user.dart';
import 'package:passkeys_web/interop.dart';
import 'package:passkeys_web/models/passkeyLoginRequest.dart';
import 'package:passkeys_web/models/passkeyLoginResponse.dart';
import 'package:passkeys_web/models/passkeySignUpRequest.dart';
import 'package:passkeys_web/models/passkeySignUpResponse.dart';

/// The Web implementation of [TestPluginPlatform].
class PasskeysWeb extends PasskeysPlatform {
  /// Registers this class as the default instance of [TestPluginPlatform]
  static void registerWith([Object? registrar]) {
    PasskeysPlatform.instance = PasskeysWeb();
    init();
  }

  @override
  Future<bool> canAuthenticate() {
    return Future.value(true);
  }

  @override
  Future<String> getFacetID() {
    return Future.value('');
  }

  @override
  Future<RegisterResponseType> register(
      String challenge,
      RelyingPartyType relyingParty,
      UserType user,
      AuthenticatorSelectionType authenticatorSelection,
      List<PubKeyCredParamType>? pubKeyCredParams,
      int? timeout,
      String? attestation) async {
    final request = PasskeySignUpRequest(
      PublicKey(
        relyingParty,
        user,
        challenge,
        pubKeyCredParams!,
        authenticatorSelection,
        timeout,
      ),
    );

    try {
      final serializedRequest = jsonEncode(request.toJson());
      final response =
          (await promiseToFuture(authenticatorRegister(serializedRequest)))
              as String;

      final decodedResponse = jsonDecode(response) as Map<String, dynamic>;
      final typedResponse = PasskeySignUpResponse.fromJson(decodedResponse);

      return RegisterResponseType(
        id: typedResponse.id,
        rawId: typedResponse.rawId,
        clientDataJSON: typedResponse.response.clientDataJSON,
        attestationObject: typedResponse.response.attestationObject,
      );
    } catch (e) {
      final exception = _parseException(e as String);
      throw exception;
    }
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials, {
    MediationType mediation = MediationType.Optional,
  }) async {
    final request = PasskeyLoginRequest.fromPlatformType(
      relyingPartyId,
      challenge,
      timeout,
      userVerification,
      allowCredentials,
      mediation,
    );

    try {
      final serializedRequest = jsonEncode(request.toJson());
      final response =
          (await promiseToFuture(authenticatorLogin(serializedRequest)))
              as String;

      final decodedResponse = jsonDecode(response) as Map<String, dynamic>;
      final typedResponse = PasskeyLoginResponse.fromJson(decodedResponse);

      return typedResponse.toAuthenticateResponseType();
    } catch (e) {
      final exception = _parseException(e as String);
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
    await authenticatorCancel();
  }
}

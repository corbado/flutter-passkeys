import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/backend/corbado/generated/lib/api.dart';
import 'package:passkeys/backend/corbado/types/authentication.dart';
import 'package:passkeys/backend/corbado/types/registration.dart';
import 'package:passkeys/backend/passkey_backend.dart';
import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/registration.dart';

///
class CorbadoPasskeyBackend extends PasskeyBackend {
  final PasskeyAuthenticator _authenticator;

  ///
  CorbadoPasskeyBackend(this._projectID)
      : _client = ApiClient(basePath: 'https://$_projectID.auth.corbado.com'),
        _authenticator = PasskeyAuthenticator() {
    _client.addDefaultHeader('X-Corbado-Project-ID', _projectID);
    debugPrint('CorbadoPasskeyBackend: $_projectID');
    _authenticator.getSignatureFingerprint().then(
          (value) => _client.addDefaultHeader('Origin', value),
        );
    // Set origin header to allow CORS requests
  }

  final String _projectID;
  final ApiClient _client;

  @override
  Future<RegistrationInitResponse> initRegister(String email) async {
    final result = await UsersApi(_client).passKeyRegisterStart(
      PassKeyRegisterStartReq(username: email, fullName: 'test'),
    );

    if (result == null) {
      throw Exception('An unknown error occured during the Corbado API call');
    }

    final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
    final typed = CorbadoRegisterChallenge.fromJson(json);
    return typed.toRegisterInitResponse();
  }

  @override
  Future<void> completeRegister(RegistrationCompleteRequest r) async {
    final signedChallenge = jsonEncode(
      CorbadoRegisterSignedChallengeRequest.fromRegisterCompleteRequest(r)
          .toJson(),
    );

    final result = await UsersApi(_client).passKeyRegisterFinish(
      PassKeyFinishReq(signedChallenge: signedChallenge),
    );

    if (result == null) {
      throw Exception('An unknown error occurred during the Corbado API call');
    }

    return;
  }

  @override
  Future<AuthenticationInitResponse> initAuthenticate(String email) async {
    final result = await UsersApi(_client)
        .passKeyLoginStart(PassKeyLoginStartReq(username: email));

    if (result == null) {
      throw Exception('An unknown error occured during the Corbado API call');
    }

    final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
    final typed = CorbadoAuthenticationInitResponse.fromJson(json);
    return typed.toAuthenticationInitResponse();
  }

  @override
  Future<void> completeAuthenticate(AuthenticationCompleteRequest r) async {
    final signedChallenge = jsonEncode(
      CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(r)
          .toJson(),
    );

    final result = await UsersApi(_client).passKeyLoginFinish(
      PassKeyFinishReq(signedChallenge: signedChallenge),
    );

    if (result == null) {
      throw Exception('An unknown error occured during the Corbado API call');
    }

    return;
  }
}

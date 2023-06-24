import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/backend/corbado/generated/lib/api.dart';
import 'package:passkeys/backend/corbado/types/authentication.dart';
import 'package:passkeys/backend/corbado/types/registration.dart';
import 'package:passkeys/backend/passkey_backend.dart';
import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/registration.dart';

///
class CorbadoPasskeyBackend
    extends PasskeyBackend<CorbadoAuthenticationCompleteResponse> {
  final PasskeyAuthenticator _authenticator;

  ///
  CorbadoPasskeyBackend(this._projectID)
      : _client = ApiClient(basePath: 'https://$_projectID.auth.corbado.com'),
        _authenticator = PasskeyAuthenticator() {
    _client.addDefaultHeader('X-Corbado-Project-ID', _projectID);
    debugPrint('CorbadoPasskeyBackend: $_projectID');
    _authenticator.getFacetID().then(
          (value) => {
            debugPrint('setting Origin of API requests to $value'),
            // _client.addDefaultHeader('Origin', value),
          },
        );
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
  Future<CorbadoAuthenticationCompleteResponse> completeAuthenticate(
      AuthenticationCompleteRequest r) async {
    final signedChallenge = jsonEncode(
      CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(r)
          .toJson(),
    );

    final response = await UsersApi(_client).passKeyLoginFinishWithHttpInfo(
      PassKeyFinishReq(signedChallenge: signedChallenge),
    );

    return CorbadoAuthenticationCompleteResponse.fromHttpResponse(response);
  }
}

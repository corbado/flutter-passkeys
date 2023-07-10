import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/backend/corbado/generated/lib/api.dart';
import 'package:passkeys/backend/corbado/types/authentication.dart';
import 'package:passkeys/backend/corbado/types/registration.dart';
import 'package:passkeys/backend/passkey_backend.dart';
import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/exceptions.dart';
import 'package:passkeys/backend/types/registration.dart';

///
class CorbadoPasskeyBackend extends PasskeyBackend<CorbadoTokens> {
  final PasskeyAuthenticator _authenticator;

  ///
  CorbadoPasskeyBackend(this._projectID)
      : _client =
            ApiClient(basePath: 'https://$_projectID.frontendapi.corbado.io'),
        _authenticator = PasskeyAuthenticator() {
    _client.addDefaultHeader('X-Corbado-Project-ID', _projectID);
    debugPrint('CorbadoPasskeyBackend: $_projectID');

    if (Platform.isAndroid) {
      _authenticator.getFacetID().then(
            (value) => {
              debugPrint('setting Origin of API requests to $value'),
              _client.addDefaultHeader('Origin', value),
            },
          );
    } else if (Platform.isIOS) {
      _client.addDefaultHeader(
        'Origin',
        'https://$_projectID.frontendapi.corbado.io',
      );
    }
  }

  final String _projectID;
  final ApiClient _client;

  @override
  Future<RegistrationInitResponse> initRegister(String email) async {
    try {
      final result = await UsersApi(_client).passKeyRegisterStart(
        PassKeyRegisterStartReq(username: email, fullName: 'test'),
      );

      if (result == null) {
        throw UnexpectedBackendException(
            'passKeyRegisterStart', 'result was null');
      }

      final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
      final typed = CorbadoRegisterChallenge.fromJson(json);
      return typed.toRegisterInitResponse();
    } on ApiException catch (e) {
      // TODO: better typed errors from backend
      throw UnexpectedBackendException('passKeyRegisterStart', e.message ?? '');
    }
  }

  @override
  Future<CorbadoTokens> completeRegister(RegistrationCompleteRequest r) async {
    try {
      final signedChallenge = jsonEncode(
        CorbadoRegisterSignedChallengeRequest.fromRegisterCompleteRequest(r)
            .toJson(),
      );

      final result = await UsersApi(_client).passKeyRegisterFinish(
        PassKeyFinishReq(signedChallenge: signedChallenge),
      );

      if (result == null) {
        throw UnexpectedBackendException(
            'passKeyRegisterFinish', 'result was null');
      }

      return CorbadoTokens.fromPassKeyRegisterFinishRsp(result);
    } on ApiException catch (e) {
      throw UnexpectedBackendException(
          'passKeyRegisterFinish', e.message ?? '');
    }
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
  Future<CorbadoTokens> completeAuthenticate(
      AuthenticationCompleteRequest r) async {
    final signedChallenge = jsonEncode(
      CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(r)
          .toJson(),
    );

    final response = await UsersApi(_client).passKeyLoginFinish(
      PassKeyFinishReq(signedChallenge: signedChallenge),
    );

    return CorbadoTokens.fromPassKeyLoginFinishRsp(response!);
  }
}

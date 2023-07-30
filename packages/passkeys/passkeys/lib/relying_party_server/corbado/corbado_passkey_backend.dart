import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;

import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/relying_party_server/corbado/types/authentication.dart';
import 'package:passkeys/relying_party_server/corbado/types/exceptions.dart';
import 'package:passkeys/relying_party_server/corbado/types/registration.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';


/// Implementation of [RelyingPartyServer] that allows to use Corbado as a
/// relying party.
class CorbadoPasskeyBackend
    extends RelyingPartyServer<AuthRequest, AuthResponse> {
  /// Sets up the client for the Corbado API.
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

  final PasskeyAuthenticator _authenticator;
  final String _projectID;
  final ApiClient _client;

  @override
  Future<RegistrationInitResponse> initRegister(AuthRequest request) async {
    try {
      final result = await UsersApi(_client).passKeyRegisterStart(
        PassKeyRegisterStartReq(
          username: request.email,
          fullName: 'test',
        ),
      );

      if (result == null) {
        throw UnexpectedBackendException(
          'passKeyRegisterStart',
          'result was null',
        );
      }

      final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
      final typed = CorbadoRegisterChallenge.fromJson(json);
      return typed.toRegisterInitResponse();
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyRegisterStart',
        e.message ?? '',
      );
    }
  }

  @override
  Future<AuthResponse> completeRegister(
    RegistrationCompleteRequest request,
  ) async {
    try {
      final signedChallenge = jsonEncode(
        CorbadoRegisterSignedChallengeRequest.fromRegisterCompleteRequest(
          request,
        ).toJson(),
      );

      final result = await UsersApi(_client).passKeyRegisterFinish(
        PassKeyFinishReq(signedChallenge: signedChallenge),
      );

      if (result == null) {
        throw UnexpectedBackendException(
          'passKeyRegisterFinish',
          'result was null',
        );
      }

      return AuthResponse.fromPassKeyRegisterFinishRsp(result);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyRegisterFinish',
        e.message ?? '',
      );
    }
  }

  @override
  Future<AuthenticationInitResponse> initAuthenticate(
    AuthRequest request,
  ) async {
    try {
      final result = await UsersApi(_client)
          .passKeyLoginStart(PassKeyLoginStartReq(username: request.email));

      if (result == null) {
        throw Exception('An unknown error occurred during the Corbado API call');
      }

      if (result.data.challenge.isEmpty) {
        throw NoPasskeyForDeviceException();
      }

      final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
      final typed = CorbadoAuthenticationInitResponse.fromJson(json);
      return typed.toAuthenticationInitResponse();
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAuthenticateStart',
        e.message ?? '',
      );
    }
  }

  @override
  Future<AuthResponse> completeAuthenticate(
    AuthenticationCompleteRequest request,
  ) async {
    try {
      final signedChallenge = jsonEncode(
        CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(
          request,
        ).toJson(),
      );

      final response = await UsersApi(_client).passKeyLoginFinish(
        PassKeyFinishReq(signedChallenge: signedChallenge),
      );

      return AuthResponse.fromPassKeyLoginFinishRsp(response!);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAuthenticateFinish',
        e.message ?? '',
      );
    }
  }
}

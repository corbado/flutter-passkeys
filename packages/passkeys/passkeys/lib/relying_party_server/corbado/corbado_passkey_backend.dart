import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/relying_party_server/corbado/generated/lib/api.dart';
import 'package:passkeys/relying_party_server/corbado/types/authentication.dart';
import 'package:passkeys/relying_party_server/corbado/types/registration.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/exceptions.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';

/// Implementation of [RelyingPartyServer] that allows to use Corbado as a
/// relying party.
class CorbadoPasskeyBackend
    extends RelyingPartyServer<CorbadoRequest, CorbadoTokens> {
  /// Sets up the client for the Corbado API.
  CorbadoPasskeyBackend(this._projectID)
      : _client = ApiClient(basePath: 'https://$_projectID.auth.corbado.com'),
        _authenticator = PasskeyAuthenticator() {
    _client.addDefaultHeader('X-Corbado-Project-ID', _projectID);
    debugPrint('CorbadoPasskeyBackend: $_projectID');
    _authenticator.getFacetID().then(
          (value) => {
            debugPrint('setting Origin of API requests to $value'),
            // TODO: so far we have to uncomment this on iOS devices (we could of course add a platform condition around it)
            // question is though, if we should also include this header in iOS requests (probably yes) and what we have to do to fix it
            _client.addDefaultHeader('Origin', value),
          },
        );
  }

  final PasskeyAuthenticator _authenticator;
  final String _projectID;
  final ApiClient _client;

  @override
  Future<RegistrationInitResponse> initRegister(CorbadoRequest request) async {
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
  Future<CorbadoTokens> completeRegister(
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

      return CorbadoTokens.fromPassKeyRegisterFinishRsp(result);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyRegisterFinish',
        e.message ?? '',
      );
    }
  }

  @override
  Future<AuthenticationInitResponse> initAuthenticate(
    CorbadoRequest request,
  ) async {
    final result = await UsersApi(_client)
        .passKeyLoginStart(PassKeyLoginStartReq(username: request.email));

    if (result == null) {
      throw Exception('An unknown error occured during the Corbado API call');
    }

    final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
    final typed = CorbadoAuthenticationInitResponse.fromJson(json);
    return typed.toAuthenticationInitResponse();
  }

  @override
  Future<CorbadoTokens> completeAuthenticate(
    AuthenticationCompleteRequest request,
  ) async {
    final signedChallenge = jsonEncode(
      CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(
        request,
      ).toJson(),
    );

    final response = await UsersApi(_client).passKeyLoginFinish(
      PassKeyFinishReq(signedChallenge: signedChallenge),
    );

    return CorbadoTokens.fromPassKeyLoginFinishRsp(response!);
  }
}

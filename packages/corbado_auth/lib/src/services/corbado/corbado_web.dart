import 'dart:convert';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/exceptions/exceptions.dart';
import 'package:corbado_auth/src/types/webauthn/registration.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:http/browser_client.dart';

Future<CorbadoService> createClient(
    String projectId, {
      String? customDomain,
    }) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final client = BrowserClient()..withCredentials = true;

  final apiClient = ApiClient(basePath: basePath)
    ..addDefaultHeader('X-Corbado-ProjectID', projectId)
    ..client = client;

  return WebCorbadoService(apiClient);
}

class WebCorbadoService extends CorbadoService {
  ///
  WebCorbadoService(ApiClient frontendAPIClient) : super(frontendAPIClient);

  @override
  Future<void> deletePasskey(String credentialID, {String? token}) async {
    try {
      final frontendAPIClient = getClientWithHeaders(token);
      await UsersApi(frontendAPIClient).currentUserPassKeyDelete(credentialID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'currentUserPassKeyDelete',
        e.message ?? '',
      );
    }
  }

  @override
  Future<List<PasskeyInfo>> getPasskeys({String? token}) async {
    final frontendAPIClient = getClientWithHeaders(token);
    final response = await UsersApi(frontendAPIClient).currentUserPassKeyGet();
    if (response == null) {
      return [];
    }

    return response.data.passkeys.map(PasskeyInfo.fromResponse).toList();
  }

  @override
  Future<StartRegisterResponse> startAppendPasskey({String? token}) async {
    final frontendAPIClient = getClientWithHeaders(token);
    try {
      final result =
          await UsersApi(frontendAPIClient).passKeyAppendStart(EmptyReq());

      if (result == null) {
        throw UnexpectedBackendException(
          'passKeyRegisterStart',
          'result was null',
        );
      }

      final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
      return StartRegisterResponse.fromJson(json);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendStart',
        e.message ?? '',
      );
    }
  }

  @override
  Future<void> finishAppendPasskey(
    FinishRegisterRequest request, {
    String? token,
  }) async {
    final frontendAPIClient = getClientWithHeaders(token);
    try {
      final reqFinish =
          PassKeyFinishReq(signedChallenge: jsonEncode(request.toJson()));
      await UsersApi(frontendAPIClient).passKeyAppendFinish(reqFinish);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendFinish',
        e.message ?? '',
      );
    }
  }

  ApiClient getClientWithHeaders(String? refreshToken) {
    if (refreshToken != null) {
      frontendAPIClient.addDefaultHeader(
        'Authorization',
        'Bearer $refreshToken',
      );
    }

    return frontendAPIClient;
  }
}

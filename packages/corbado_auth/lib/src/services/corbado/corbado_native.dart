import 'dart:convert';

import 'package:corbado_auth/src/types/exceptions/exceptions.dart';
import 'package:corbado_auth/src/types/webauthn/registration.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/passkey_info.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

Future<CorbadoService> createClient(
  String projectId, {
  String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final ua = await userAgent();

  final apiClient = ApiClient(basePath: basePath)
    ..addDefaultHeader('X-Corbado-ProjectID', projectId)
    ..addDefaultHeader('User-Agent', ua);

  return NativeCorbadoService(apiClient);
}

class NativeCorbadoService extends CorbadoService {
  ///
  NativeCorbadoService(ApiClient frontendAPIClient) : super(frontendAPIClient);

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
    try {
      final frontendAPIClient = getClientWithHeaders(token);
      final result =
          await UsersApi(frontendAPIClient).passKeyAppendStart(EmptyReq());

      final json = jsonDecode(result!.data.challenge) as Map<String, dynamic>;
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
    if (refreshToken == null) {
      throw Exception('missing refreshToken');
    }

    frontendAPIClient.addDefaultHeader(
      'cookie',
      'cbo_long_session=$refreshToken',
    );

    return frontendAPIClient;
  }
}

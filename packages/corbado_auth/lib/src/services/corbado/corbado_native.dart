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

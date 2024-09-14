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

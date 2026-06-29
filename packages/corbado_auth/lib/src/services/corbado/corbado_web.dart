import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:passkeys/authenticator.dart';

/// Creates a [CorbadoService] for the web platform.
Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  @Deprecated('Use the default Corbado frontend API domain instead.')
  String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final apiClient = CorbadoFrontendApiClient(
    basePathOverride: basePath,
    sdkVersion: '3.2.0',
    languageVersion: 'Flutter Web',
  );
  apiClient.dio.options.headers.addAll({
    'X-Corbado-ProjectID': projectId,
  });
  apiClient.dio.options.extra['withCredentials'] = true;

  return WebCorbadoService(
    apiClient,
    passkeyAuthenticator,
    WebStorageService(projectId),
  );
}

/// A [CorbadoService] implementation for the web platform.
class WebCorbadoService extends CorbadoService {
  /// Creates a [WebCorbadoService].
  WebCorbadoService(
    super.frontendAPIClient,
    super.passkeyAuthenticator,
    super.storageService,
  );
}

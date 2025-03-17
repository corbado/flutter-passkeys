import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:http/browser_client.dart';
import 'package:passkeys/authenticator.dart';

Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  @deprecated String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final apiClient = CorbadoFrontendApiClient(
      basePathOverride: basePath,
      sdkVersion: '3.2.0',
      languageVersion: "Flutter Web");
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

class WebCorbadoService extends CorbadoService {
  ///
  WebCorbadoService(
    CorbadoFrontendApiClient frontendAPIClient,
    PasskeyAuthenticator passkeyAuthenticator,
    StorageService storageService,
  ) : super(frontendAPIClient, passkeyAuthenticator, storageService);
}

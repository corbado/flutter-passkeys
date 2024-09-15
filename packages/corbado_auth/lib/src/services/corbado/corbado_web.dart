import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:http/browser_client.dart';
import 'package:passkeys/authenticator.dart';

Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final client = BrowserClient()..withCredentials = true;

  final apiClient = CorbadoFrontendApiClient();

  return WebCorbadoService(apiClient, passkeyAuthenticator);
}

class WebCorbadoService extends CorbadoService {
  ///
  WebCorbadoService(CorbadoFrontendApiClient frontendAPIClient, PasskeyAuthenticator passkeyAuthenticator)
      : super(frontendAPIClient, passkeyAuthenticator);
}

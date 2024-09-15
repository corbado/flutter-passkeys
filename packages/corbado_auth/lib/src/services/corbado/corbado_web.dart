import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
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

  final apiClient = CorbadoFrontendApiClient();

  return WebCorbadoService(apiClient);
}

class WebCorbadoService extends CorbadoService {
  ///
  WebCorbadoService(CorbadoFrontendApiClient frontendAPIClient) : super(frontendAPIClient);

}

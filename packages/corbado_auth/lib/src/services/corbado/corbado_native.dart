import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
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

  final apiClient = CorbadoFrontendApiClient(basePathOverride: basePath);
  apiClient.dio.options.headers.addAll({
    'X-Corbado-ProjectID': projectId,
    'User-Agent': ua,
  });

  return NativeCorbadoService(apiClient);
}

class NativeCorbadoService extends CorbadoService {
  ///
  NativeCorbadoService(CorbadoFrontendApiClient frontendAPIClient) : super(frontendAPIClient);
}

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:passkeys/authenticator.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final uaData = await userAgentData();

  final apiClient = CorbadoFrontendApiClient(basePathOverride: basePath);
  apiClient.dio.options.headers.addAll({
    'X-Corbado-ProjectID': projectId,
    'User-Agent': _buildUserAgent(uaData),
  });

  return NativeCorbadoService(apiClient, passkeyAuthenticator);
}

String _buildUserAgent(UserAgentData uaData) {
  return 'NativeApp/${uaData.package.appVersion} (${uaData.platform} ${uaData.platformVersion}; ${uaData.model}; ${uaData.device}; ${uaData.architecture})';
}

class NativeCorbadoService extends CorbadoService {
  ///
  NativeCorbadoService(CorbadoFrontendApiClient frontendAPIClient, PasskeyAuthenticator passkeyAuthenticator)
      : super(frontendAPIClient, passkeyAuthenticator);
}

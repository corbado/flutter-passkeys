import 'dart:io';

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:passkeys/authenticator.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  @deprecated String? customDomain,
}) async {
  final basePath = CorbadoService.getFrontendAPIDomain(
    projectId,
    customDomain: customDomain,
  );

  final uaData = await userAgentData();

  final apiClient = CorbadoFrontendApiClient(
      basePathOverride: basePath,
      sdkVersion: '3.2.0',
      languageVersion: Platform.version);
  apiClient.dio.options.headers.addAll({
    'X-Corbado-ProjectID': projectId,
    'User-Agent': _buildUserAgent(uaData),
  });

  return NativeCorbadoService(
    apiClient,
    passkeyAuthenticator,
    NativeStorageService(),
  );
}

String _buildUserAgent(UserAgentData uaData) {
  return 'NativeApp/${uaData.package.appVersion} (${uaData.platform} ${uaData.platformVersion}; ${uaData.model}; ${uaData.device}; ${uaData.architecture})';
}

class NativeCorbadoService extends CorbadoService {
  ///
  NativeCorbadoService(
    CorbadoFrontendApiClient frontendAPIClient,
    PasskeyAuthenticator passkeyAuthenticator,
    StorageService storageService,
  ) : super(frontendAPIClient, passkeyAuthenticator, storageService);
}

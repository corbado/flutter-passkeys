import 'dart:io';

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

const isAppleDevMode =
    String.fromEnvironment('APPLE_DEV_MODE', defaultValue: 'false') == 'true';

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

  if (!kDebugMode && isAppleDevMode && Platform.isIOS) {
    print(
      '⚠️ WARNING: You should not use the APPLE_DEV_MODE flag in production.',
    );
  }

  final apiClient = CorbadoFrontendApiClient(
    basePathOverride: basePath,
    sdkVersion: '3.2.0',
    languageVersion: Platform.version,
  );
  apiClient.dio.options.headers.addAll({
    'X-Corbado-ProjectID': projectId,
    'X-Corbado-Flags': isAppleDevMode && Platform.isIOS ? 'apple_dev_mode' : '',
    'User-Agent': _buildUserAgent(uaData),
  });

  return NativeCorbadoService(
    apiClient,
    passkeyAuthenticator,
    NativeStorageService(projectId),
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

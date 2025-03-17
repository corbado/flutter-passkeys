//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:corbado_frontend_api_client/src/serializers.dart';
import 'package:corbado_frontend_api_client/src/auth/api_key_auth.dart';
import 'package:corbado_frontend_api_client/src/auth/basic_auth.dart';
import 'package:corbado_frontend_api_client/src/auth/bearer_auth.dart';
import 'package:corbado_frontend_api_client/src/auth/oauth.dart';
import 'package:corbado_frontend_api_client/src/api/auth_api.dart';
import 'package:corbado_frontend_api_client/src/api/configs_api.dart';
import 'package:corbado_frontend_api_client/src/api/corbado_connect_api.dart';
import 'package:corbado_frontend_api_client/src/api/users_api.dart';

class CorbadoFrontendApiClient {
  static const String basePath = r'https://<project ID>.frontendapi.corbado.io';

  final Dio dio;
  final Serializers serializers;

  CorbadoFrontendApiClient({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
    String? sdkVersion,
    String? languageVersion,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
              headers: {
                "X-Corbado-SDK": jsonEncode({
                  "name": "Flutter SDK",
                  "sdkVersion": sdkVersion ?? "1.0.0",
                  "languageVersion": languageVersion ?? "1.0.0",
                })
              },
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get ConfigsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ConfigsApi getConfigsApi() {
    return ConfigsApi(dio, serializers);
  }

  /// Get CorbadoConnectApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CorbadoConnectApi getCorbadoConnectApi() {
    return CorbadoConnectApi(dio, serializers);
  }

  /// Get UsersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UsersApi getUsersApi() {
    return UsersApi(dio, serializers);
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:http/http.dart';

///
class AuthResponse {
  ///
  AuthResponse({
    required this.token,
    required this.refreshToken,
  });

  static Future<AuthResponse> fromHttpResponse(Response response) async {
    if (response.statusCode >= HttpStatus.badRequest || response.body.isEmpty) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }

    final result =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final token = result['data']['shortSession']['value'] as String;
    final setCookieString = response.headers['set-cookie'] as String;
    final cookieRegex = RegExp(r'cbo_long_session=(\w+);.*');
    final refreshToken = cookieRegex.firstMatch(setCookieString);

    if (refreshToken == null) {
      throw Exception('RefreshToken could not be parsed.');
    }

    return AuthResponse(
      token: token,
      refreshToken: refreshToken.group(1)!,
    );
  }

  factory AuthResponse.fromPassKeyLoginFinishRsp(
      PassKeyLoginFinishRsp response) {
    return AuthResponse(
      token: response.data.shortSession!.value,
      refreshToken: response.data.longSession!,
    );
  }

  factory AuthResponse.fromPassKeyRegisterFinishRsp(
      PassKeyRegisterFinishRsp response) {
    return AuthResponse(
      token: response.data.shortSession!.value,
      refreshToken: response.data.longSession!,
    );
  }

  final String token;
  final String refreshToken;

  static Future<String> _decodeBodyBytes(Response response) async {
    final contentType = response.headers['content-type'];
    return contentType != null &&
            contentType.toLowerCase().startsWith('application/json')
        ? response.bodyBytes.isEmpty
            ? ''
            : utf8.decode(response.bodyBytes)
        : response.body;
  }
}

class AuthRequest {
  const AuthRequest(this.email, {this.username});

  final String email;
  final String? username;
}

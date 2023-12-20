import 'dart:convert';
import 'dart:io';

import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:http/http.dart';

///
class AuthResponse {
  ///
  AuthResponse({
    required this.token,
    this.refreshToken,
  });

  static Future<AuthResponse> fromHttpResponse(Response response) async {
    if (response.statusCode >= HttpStatus.badRequest || response.body.isEmpty) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }

    final result =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final token = result['data']['shortSession']['value'] as String;
    final refreshToken = _getLongSession(result, response);

    return AuthResponse(
      token: token,
      refreshToken: refreshToken,
    );
  }

  final String token;
  final String? refreshToken;

  static Future<String> _decodeBodyBytes(Response response) async {
    final contentType = response.headers['content-type'];
    return contentType != null &&
            contentType.toLowerCase().startsWith('application/json')
        ? response.bodyBytes.isEmpty
            ? ''
            : utf8.decode(response.bodyBytes)
        : response.body;
  }

  // first we try to get the longSession from the payload
  // (this is the case for DEV projects)
  // if that fails we try to get it from cookies
  static String? _getLongSession(
    Map<String, dynamic> payload,
    Response response,
  ) {
    final maybeToken = _getLongSessionFromPayload(payload);
    if (maybeToken != null) {
      return maybeToken;
    }

    if (!response.headers.containsKey('set-cookie')) {
      return null;
    }
    final setCookieString = response.headers['set-cookie'];
    if (setCookieString == null) {
      return null;
    }

    final cookieRegex = RegExp(r'cbo_long_session=(\w+);.*');
    final match = cookieRegex.firstMatch(setCookieString);
    if (match == null) {
      return null;
    }

    return match.group(1);
  }

  static String? _getLongSessionFromPayload(Map<String, dynamic> payload) {
    if (!payload.containsKey('data')) {
      return null;
    }

    final data = payload['data'] as Map<String, dynamic>;
    if (!data.containsKey('longSession')) {
      return null;
    }

    return data['longSession'] as String;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:passkeys/relying_party_server/corbado/generated/lib/api.dart';

///
class CorbadoTokens {
  ///
  CorbadoTokens({
    required this.token,
    required this.refreshToken,
  });

  factory CorbadoTokens.fromHttpResponse(Response response) {
    if (response.statusCode >= HttpStatus.badRequest || response.body.isEmpty) {
      throw Exception('An unknown error occured during the Corbado API call');
    }

    final result =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final token = result['data']['sessionToken'] as String;
    final setCookieString = response.headers['set-cookie'] as String;
    final cookieRegex = RegExp(r'cbo_long_session=(\w+);.*');
    final refreshToken = cookieRegex.firstMatch(setCookieString);

    if (refreshToken == null) {
      throw Exception('RefreshToken could not be parsed.');
    }

    return CorbadoTokens(
      token: token,
      refreshToken: refreshToken.group(1)!,
    );
  }

  factory CorbadoTokens.fromPassKeyLoginFinishRsp(
      PassKeyLoginFinishRsp response) {
    return CorbadoTokens(
      token: response.data.shortSession!.value,
      refreshToken: response.data.longSession!,
    );
  }

  factory CorbadoTokens.fromPassKeyRegisterFinishRsp(
      PassKeyRegisterFinishRsp response) {
    return CorbadoTokens(
      token: response.data.shortSession!.value,
      refreshToken: response.data.longSession!,
    );
  }

  final String token;
  final String refreshToken;
}

class CorbadoRequest {
  const CorbadoRequest(this.email, {this.username});

  final String email;
  final String? username;
}

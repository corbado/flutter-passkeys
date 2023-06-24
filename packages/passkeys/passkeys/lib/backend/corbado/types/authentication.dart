// TODO: this whole file can be removed as we better type open api spec
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/backend/corbado/generated/lib/api.dart';
import 'package:passkeys/backend/types/authentication.dart';

part 'authentication.g.dart';

@JsonSerializable()
class CorbadoAuthenticationInitResponse {
  CorbadoAuthenticationInitResponse(this.publicKey);

  factory CorbadoAuthenticationInitResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationInitResponseFromJson(json);

  final CorbadoAuthenticationResponsePublicKey publicKey;

  AuthenticationInitResponse toAuthenticationInitResponse() {
    return AuthenticationInitResponse(
      rpId: publicKey.rpId,
      challenge: publicKey.challenge,
      timeout: publicKey.timeout,
      userVerification: publicKey.userVerification,
      allowCredentials: publicKey.allowCredentials
          ?.map(
            (e) => AllowCredential(
              type: e.type,
              id: e.id,
              transports: e.transports,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationInitResponseToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticationResponsePublicKey {
  CorbadoAuthenticationResponsePublicKey({
    required this.rpId,
    required this.challenge,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });

  factory CorbadoAuthenticationResponsePublicKey.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationResponsePublicKeyFromJson(json);
  final String rpId;
  final String challenge;
  final int? timeout;
  final String? userVerification;
  final List<CorbadoAllowCredential>? allowCredentials;

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationResponsePublicKeyToJson(this);
}

@JsonSerializable()
class CorbadoAllowCredential {
  CorbadoAllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });

  factory CorbadoAllowCredential.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAllowCredentialFromJson(json);
  final String type;
  final String id;
  final List<String> transports;

  Map<String, dynamic> toJson() => _$CorbadoAllowCredentialToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CorbadoAuthenticationCompleteRequest {
  CorbadoAuthenticationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

  factory CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(
    AuthenticationCompleteRequest r,
  ) {
    return CorbadoAuthenticationCompleteRequest(
      id: r.id,
      rawId: r.rawId,
      response: CorbadoAuthenticationComplete(
        clientDataJSON: r.clientDataJSON,
        authenticatorData: r.authenticatorData,
        signature: r.signature,
      ),
    );
  }

  factory CorbadoAuthenticationCompleteRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationCompleteRequestFromJson(json);
  final String id;
  final String rawId;
  final CorbadoAuthenticationComplete response;
  final String type;

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationCompleteRequestToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticationComplete {
  CorbadoAuthenticationComplete({
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
  });

  final String clientDataJSON;
  final String authenticatorData;
  final String signature;

  factory CorbadoAuthenticationComplete.fromJson(Map<String, dynamic> json) =>
      _$CorbadoAuthenticationCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoAuthenticationCompleteToJson(this);
}

class CorbadoAuthenticationCompleteResponse {
  CorbadoAuthenticationCompleteResponse({
    required this.token,
    required this.refreshToken,
  });

  factory CorbadoAuthenticationCompleteResponse.fromHttpResponse(
      Response response) {
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

    return CorbadoAuthenticationCompleteResponse(
      token: token,
      refreshToken: refreshToken.group(1)!,
    );
  }

  final String token;
  final String refreshToken;
}

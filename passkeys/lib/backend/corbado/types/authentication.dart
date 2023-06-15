// TODO: this whole file can be removed as we better type open api spec
import 'package:json_annotation/json_annotation.dart';
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
        rpId: publicKey.rpId, challenge: publicKey.challenge);
  }

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationInitResponseToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticationResponsePublicKey {
  CorbadoAuthenticationResponsePublicKey({
    required this.rpId,
    required this.challenge,
  });

  factory CorbadoAuthenticationResponsePublicKey.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationResponsePublicKeyFromJson(json);
  final String rpId;
  final String challenge;

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationResponsePublicKeyToJson(this);
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

  factory CorbadoAuthenticationComplete.fromJson(Map<String, dynamic> json) =>
      _$CorbadoAuthenticationCompleteFromJson(json);
  final String clientDataJSON;
  final String authenticatorData;
  final String signature;

  Map<String, dynamic> toJson() => _$CorbadoAuthenticationCompleteToJson(this);
}

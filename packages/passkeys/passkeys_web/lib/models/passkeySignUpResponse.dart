import 'package:json_annotation/json_annotation.dart';

part 'passkeySignUpResponse.g.dart';

@JsonSerializable()
class PasskeySignUpResponse {
  factory PasskeySignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeySignUpResponseFromJson(json);

  PasskeySignUpResponse(this.id, this.rawId, this.response);

  final String id;
  final String rawId;
  final AttestationResponse response;

  Map<String, dynamic> toJson() => _$PasskeySignUpResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AttestationResponse {
  factory AttestationResponse.fromJson(Map<String, dynamic> json) =>
      _$AttestationResponseFromJson(json);

  AttestationResponse(
      this.clientDataJSON,
      this.attestationObject,
      this.transports,
      );

  final String clientDataJSON;
  final String attestationObject;
  final List<String> transports;

  Map<String, dynamic> toJson() => _$AttestationResponseToJson(this);
}

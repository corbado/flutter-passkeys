import 'package:json_annotation/json_annotation.dart';

part 'passkeySignUpResponse.g.dart';

@JsonSerializable()
class PasskeySignUpResponse {
  PasskeySignUpResponse(this.id, this.rawId, this.response);
  factory PasskeySignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeySignUpResponseFromJson(json);

  final String id;
  final String rawId;
  final AttestationResponse response;

  Map<String, dynamic> toJson() => _$PasskeySignUpResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AttestationResponse {
  AttestationResponse(
    this.clientDataJSON,
    this.attestationObject,
    this.transports,
  );
  factory AttestationResponse.fromJson(Map<String, dynamic> json) =>
      _$AttestationResponseFromJson(json);

  final String clientDataJSON;
  final String attestationObject;
  final List<String> transports;

  Map<String, dynamic> toJson() => _$AttestationResponseToJson(this);
}

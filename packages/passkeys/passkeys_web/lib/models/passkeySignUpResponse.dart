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
  factory AttestationResponse.fromJson(dynamic response) {
    // 'response' might be a JSObject, so we convert or cast to Dart.
    final map = Map<String, dynamic>.from(response as Map);

    // 'transports' might be a JSArray<dynamic>,
    final dynamicTransports = map['transports'] as List<dynamic>;
    final List<String> transports =
    dynamicTransports.map((e) => e as String).toList();

    return AttestationResponse(
      map['clientDataJSON'] as String,
      map['attestationObject'] as String,
      transports,
    );
  }

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

// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

part 'passkeySignUpResponse.g.dart';

/// Response returned by the Web SDK after a successful passkey registration.
@JsonSerializable()
class PasskeySignUpResponse {
  /// Creates a response from its [id], [rawId] and attestation [response].
  PasskeySignUpResponse(this.id, this.rawId, this.response);

  /// Creates a response from a decoded JSON map.
  factory PasskeySignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeySignUpResponseFromJson(json);

  /// The base64url encoded credential identifier.
  final String id;

  /// The raw credential identifier.
  final String rawId;

  /// The authenticator attestation response.
  final AttestationResponse response;

  /// Serializes this response to a JSON map.
  Map<String, dynamic> toJson() => _$PasskeySignUpResponseToJson(this);
}

/// The authenticator attestation data returned during a passkey registration.
@JsonSerializable(explicitToJson: true)
class AttestationResponse {
  /// Creates an attestation response from its fields.
  AttestationResponse(
    this.clientDataJSON,
    this.attestationObject,
    this.transports,
  );

  /// Creates an attestation response from a decoded JSON map.
  factory AttestationResponse.fromJson(Map<String, dynamic> json) =>
      _$AttestationResponseFromJson(json);

  /// The base64url encoded client data JSON.
  final String clientDataJSON;

  /// The base64url encoded attestation object.
  final String attestationObject;

  /// The transports the created credential supports.
  final List<String> transports;

  /// Serializes this attestation response to a JSON map.
  Map<String, dynamic> toJson() => _$AttestationResponseToJson(this);
}

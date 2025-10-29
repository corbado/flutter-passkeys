import 'package:json_annotation/json_annotation.dart';

part 'authenticate_response.g.dart';

@JsonSerializable()
class AuthenticateResponseType {
  /// Constructs a new instance.
  const AuthenticateResponseType(
      {required this.id,
      required this.rawId,
      required this.clientDataJSON,
      required this.authenticatorData,
      required this.signature,
      required this.userHandle});

  /// Constructs a new instance from a JSON map.
  factory AuthenticateResponseType.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseTypeFromJson(json);

  /// The ID of the credential.
  final String id;

  /// The raw ID of the credential.
  final String rawId;

  /// The client data JSON.
  final String clientDataJSON;

  /// The authenticator data.
  final String authenticatorData;

  /// The signature.
  final String signature;

  /// The user handle. Can be empty if the user handle is not available.
  final String userHandle;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$AuthenticateResponseTypeToJson(this);
}

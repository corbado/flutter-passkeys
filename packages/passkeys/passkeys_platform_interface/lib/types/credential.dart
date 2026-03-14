import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

/// The [CredentialType] class wraps the data of a credential it can be used to
/// explicitly exclude or allow credentials.
@JsonSerializable()
class CredentialType {
  /// Constructs a new instance.
  CredentialType({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// Constructs a new instance from a JSON map.
  factory CredentialType.fromJson(Map<String, dynamic> json) => _$CredentialTypeFromJson(json);

  /// The type of the credential.
  final String type;

  /// The Base64URL encoded credential ID _without_ padding.
  final String id;

  /// The transports of the credential.
  final List<String>? transports;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$CredentialTypeToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'allow_credential.g.dart';

/// The [AllowCredentialType] class wraps the data of a credential.
@JsonSerializable()
class AllowCredentialType {
  /// Constructs a new instance.
  AllowCredentialType({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// Constructs a new instance from a JSON map.
  factory AllowCredentialType.fromJson(Map<String, dynamic> json) =>
      _$AllowCredentialTypeFromJson(json);

  /// The type of the credential.
  final String type;

  /// The ID of the credential.
  final String id;

  /// The transports of the credential.
  final List<String> transports;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$AllowCredentialTypeToJson(this);
}

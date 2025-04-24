import 'package:json_annotation/json_annotation.dart';

part 'relying_party.g.dart';

/// The [RelyingPartyType] class wraps the data of a relying party.
/// It is used to identify the party that is requesting authentication.
@JsonSerializable()
class RelyingPartyType {
  /// Constructs a new instance.
  RelyingPartyType({
    required this.name,
    required this.id,
  });

  /// Constructs a new instance from a JSON map.
  factory RelyingPartyType.fromJson(Map<String, dynamic> json) =>
      _$RelyingPartyTypeFromJson(json);

  /// The display name of the relying party.
  final String name;

  /// The identifier of the relying party.
  /// This is typically the domain of the website that is requesting authentication.
  final String id;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$RelyingPartyTypeToJson(this);
}

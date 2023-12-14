import 'package:json_annotation/json_annotation.dart';

part 'relying_party.g.dart';

@JsonSerializable()
class RelyingPartyType {
  /// Constructs a new instance.
  RelyingPartyType({
    required this.name,
    required this.id,
  });

  factory RelyingPartyType.fromJson(Map<String, dynamic> json) =>
      _$RelyingPartyTypeFromJson(json);

  ///
  final String name;

  ///
  final String id;

  Map<String, dynamic> toJson() => _$RelyingPartyTypeToJson(this);
}

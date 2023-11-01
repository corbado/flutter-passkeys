import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserType {
  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  UserType({
    required this.displayName,
    required this.name,
    required this.id,
  });

  final String displayName;
  final String name;
  final String id;

  Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}

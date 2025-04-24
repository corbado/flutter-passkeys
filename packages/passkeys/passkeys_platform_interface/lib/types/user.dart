import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// The [UserType] class wraps the data of a user..
@JsonSerializable()
class UserType {
  /// Constructs a new instance.
  const UserType({
    required this.displayName,
    required this.name,
    required this.id,
  });

  /// Constructs a new instance from a JSON map.
  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  /// The display name of the user.
  final String displayName;

  /// The name of the user.
  final String name;

  /// The Base64URL encoded identifier _with_ padding.
  final String id;

  Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}

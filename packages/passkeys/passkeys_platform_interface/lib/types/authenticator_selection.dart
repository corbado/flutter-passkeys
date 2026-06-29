import 'package:json_annotation/json_annotation.dart';

part 'authenticator_selection.g.dart';

@JsonSerializable()
class AuthenticatorSelectionType {
  /// Constructs a new instance.
  AuthenticatorSelectionType({
    required this.requireResidentKey,
    required this.residentKey,
    required this.userVerification,
    this.authenticatorAttachment,
  });
  factory AuthenticatorSelectionType.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorSelectionTypeFromJson(json);

  @JsonKey(includeIfNull: false)
  final String? authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;

  Map<String, dynamic> toJson() => _$AuthenticatorSelectionTypeToJson(this);
}

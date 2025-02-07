import 'package:json_annotation/json_annotation.dart';

part 'authenticator_selection.g.dart';

@JsonSerializable()
class AuthenticatorSelectionType {
  factory AuthenticatorSelectionType.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorSelectionTypeFromJson(json);

  /// Constructs a new instance.
  AuthenticatorSelectionType({
    this.authenticatorAttachment,
    required this.requireResidentKey,
    required this.residentKey,
    required this.userVerification,
  });

  @JsonKey(includeIfNull: false)
  final String? authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;

  Map<String, dynamic> toJson() => _$AuthenticatorSelectionTypeToJson(this);
}

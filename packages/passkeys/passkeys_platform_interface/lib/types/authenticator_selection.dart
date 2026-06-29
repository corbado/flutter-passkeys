import 'package:json_annotation/json_annotation.dart';

part 'authenticator_selection.g.dart';

/// Describes the relying party's requirements for the authenticator that
/// should be used during a credential operation.
@JsonSerializable()
class AuthenticatorSelectionType {
  /// Constructs a new instance.
  AuthenticatorSelectionType({
    required this.requireResidentKey,
    required this.residentKey,
    required this.userVerification,
    this.authenticatorAttachment,
  });

  /// Constructs a new instance from a JSON map.
  factory AuthenticatorSelectionType.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorSelectionTypeFromJson(json);

  /// The preferred attachment modality of the authenticator
  /// (e.g. `platform` or `cross-platform`).
  @JsonKey(includeIfNull: false)
  final String? authenticatorAttachment;

  /// Whether a resident (discoverable) credential is required.
  final bool requireResidentKey;

  /// The relying party's requirement for a resident (discoverable) credential.
  final String residentKey;

  /// The relying party's user verification requirement.
  final String userVerification;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$AuthenticatorSelectionTypeToJson(this);
}

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

  /// Optional in the WebAuthn spec; defaults to `false` when omitted or null.
  @JsonKey(defaultValue: false)
  final bool requireResidentKey;

  /// Optional in the WebAuthn spec with no static default; when omitted or null
  /// its effective value is derived from [requireResidentKey] (`'required'`
  /// when true, otherwise `'discouraged'`) per WebAuthn Level 3 §5.4.4.
  @JsonKey(readValue: _readResidentKey)
  final String residentKey;

  /// Optional in the WebAuthn spec; defaults to `'preferred'` when omitted or
  /// null.
  @JsonKey(defaultValue: 'preferred')
  final String userVerification;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$AuthenticatorSelectionTypeToJson(this);
}

Object? _readResidentKey(Map<dynamic, dynamic> json, String key) {
  final value = json[key];
  if (value != null) return value;
  final requireResidentKey = json['requireResidentKey'] as bool? ?? false;
  return requireResidentKey ? 'required' : 'discouraged';
}

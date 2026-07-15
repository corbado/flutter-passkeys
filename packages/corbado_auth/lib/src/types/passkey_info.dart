import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: avoid_positional_boolean_parameters

part 'passkey_info.g.dart';

/// Metadata describing a passkey registered for a user.
@JsonSerializable(explicitToJson: true)
class PasskeyInfo {
  /// Constructor
  PasskeyInfo(
    this.id,
    this.aaguid,
    this.sourceOS,
    this.sourceBrowser,
    this.attestationType,
    this.transport,
    this.backupEligible,
    this.backupState,
    this.created,
  );

  /// Creates a [PasskeyInfo] from a backend [Passkey] response.
  factory PasskeyInfo.fromResponse(Passkey p) {
    return PasskeyInfo(
      p.id,
      p.authenticatorAAGUID,
      p.sourceOS,
      p.sourceBrowser,
      p.attestationType,
      p.transport.map((i) => i.name).toList(),
      p.backupEligible,
      p.backupState,
      p.created,
    );
  }

  /// Creates a [PasskeyInfo] from json.
  factory PasskeyInfo.fromJson(Map<String, dynamic> json) =>
      _$PasskeyInfoFromJson(json);

  /// Unique identifier of the passkey.
  final String id;

  /// Authenticator attestation GUID.
  final String aaguid;

  /// Operating system the passkey was created on.
  final String sourceOS;

  /// Browser the passkey was created in.
  final String sourceBrowser;

  /// Attestation type of the passkey.
  final String attestationType;

  /// Transports supported by the authenticator.
  final List<String> transport;

  /// Whether the passkey is eligible for backup.
  final bool backupEligible;

  /// Whether the passkey is currently backed up.
  final bool backupState;

  /// Timestamp at which the passkey was created.
  final String created;
}

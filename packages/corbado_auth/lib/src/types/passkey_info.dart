import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passkey_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PasskeyInfo {
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

  factory PasskeyInfo.fromJson(Map<String, dynamic> json) => _$PasskeyInfoFromJson(json);

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

  final String id;
  final String aaguid;
  final String sourceOS;
  final String sourceBrowser;
  final String attestationType;
  final List<String> transport;
  final bool backupEligible;
  final bool backupState;
  final String created;
}

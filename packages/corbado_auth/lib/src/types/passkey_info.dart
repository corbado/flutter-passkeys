import 'package:json_annotation/json_annotation.dart';

part 'passkey_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PasskeyInfo {
  factory PasskeyInfo.fromResponse(dynamic p) {
    return PasskeyInfo(
      p.id,
      p.aaguid,
      p.userAgent,
      p.attestationType,
      p.transport,
      p.backupEligible,
      p.backupState,
      p.created,
    );
  }

  factory PasskeyInfo.fromJson(Map<String, dynamic> json) => _$PasskeyInfoFromJson(json);

  PasskeyInfo(
    this.id,
    this.aaguid,
    this.userAgent,
    this.attestationType,
    this.transport,
    this.backupEligible,
    this.backupState,
    this.created,
  );

  final String id;
  final String aaguid;
  final String userAgent;
  final String attestationType;
  final List<String> transport;
  final bool backupEligible;
  final bool backupState;
  final String created;
}

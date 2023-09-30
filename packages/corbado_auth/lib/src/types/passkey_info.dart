import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

class PasskeyInfo {
  factory PasskeyInfo.fromResponse(PassKeyItem p) {
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

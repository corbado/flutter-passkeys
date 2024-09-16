import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/mediation.dart';

class AuthenticateRequestType {
  /// Constructs a new instance.
  const AuthenticateRequestType({
    required this.relyingPartyId,
    required this.challenge,
    required this.timeout,
    required this.userVerification,
    required this.allowCredentials,
    required this.mediation,
    required this.preferImmediatelyAvailableCredentials,
  });

  final String relyingPartyId;
  final String challenge;
  final int? timeout;
  final String? userVerification;
  final List<CredentialType>? allowCredentials;
  final MediationType mediation;
  final bool preferImmediatelyAvailableCredentials;
}

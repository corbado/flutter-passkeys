import 'package:passkeys_platform_interface/types/allow_credential.dart';
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
  });

  final String relyingPartyId;
  final String challenge;
  final int? timeout;
  final String? userVerification;
  final List<AllowCredentialType>? allowCredentials;
  final MediationType mediation;
}

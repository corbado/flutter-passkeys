import 'package:passkeys/relying_party_server/relying_party_server.dart';

/// Returned from the [RelyingPartyServer] after the initial authentication
/// request.
class AuthenticationInitResponse {
  /// Constructor
  AuthenticationInitResponse({
    required this.rpId,
    required this.challenge,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });

  final String rpId;
  /// Challenge to be solved by the platform authenticator
  final String challenge;
  final int? timeout;
  final String? userVerification;
  final List<AllowCredential>? allowCredentials;
}

class AllowCredential {
  AllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });
  final String type;
  final String id;
  final List<String> transports;
}

class AuthenticationCompleteRequest {
  AuthenticationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
  });
  final String id;
  final String rawId;
  final String clientDataJSON;
  final String authenticatorData;
  final String signature;
}

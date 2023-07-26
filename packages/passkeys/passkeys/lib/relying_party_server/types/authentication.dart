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

  /// The timeout
  final int? timeout;

  /// The user verification
  final String? userVerification;

  /// The allow credentials
  final List<AllowCredential>? allowCredentials;
}

/// Represents an allowed credential
class AllowCredential {
  /// Constructor
  AllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// The type
  final String type;

  /// The id
  final String id;

  /// The transports
  final List<String> transports;
}

/// Represents a request to the passkeys backend after completing the authentication
class AuthenticationCompleteRequest {
  /// Constructor
  AuthenticationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
  });

  /// The id
  final String id;

  /// The raw id
  final String rawId;

  /// The client data json
  final String clientDataJSON;

  /// The authenticator data
  final String authenticatorData;

  /// The signature
  final String signature;
}

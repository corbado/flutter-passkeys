class AuthenticationInitResponse {
  AuthenticationInitResponse({
    required this.rpId,
    required this.challenge,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });
  final String rpId;
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

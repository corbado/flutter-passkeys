class AuthenticationInitResponse {
  final String rpId;
  final String challenge;

  AuthenticationInitResponse({
    required this.rpId,
    required this.challenge,
  });
}

class AuthenticationCompleteRequest {
  final String id;
  final String rawId;
  final String clientDataJSON;
  final String authenticatorData;
  final String signature;

  AuthenticationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
  });
}

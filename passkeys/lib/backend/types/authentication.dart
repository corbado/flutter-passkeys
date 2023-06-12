class AuthenticationInitResponse {

  AuthenticationInitResponse({
    required this.rpId,
    required this.challenge,
  });
  final String rpId;
  final String challenge;
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

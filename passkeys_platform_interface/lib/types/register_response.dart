class RegisterResponseType {
  const RegisterResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
  });

  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;
}

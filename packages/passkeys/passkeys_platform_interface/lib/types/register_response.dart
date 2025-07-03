class RegisterResponseType {
  const RegisterResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
    required this.transports,
    required this.authenticatorData,
  });

  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;
  final List<String?> transports;
  final String authenticatorData;
}

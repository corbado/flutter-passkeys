class RegistrationInitResponse {
  final RelyingParty rp;
  final User user;
  final String challenge;

  RegistrationInitResponse(this.rp, this.user, this.challenge);
}

class RelyingParty {
  final String name;
  final String id;

  RelyingParty(this.name, this.id);
}

class User {
  final String name;
  final String id;

  User(this.name, this.id);
}

class RegistrationCompleteRequest {
  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;

  RegistrationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
  });
}

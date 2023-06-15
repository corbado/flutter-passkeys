class RegistrationInitResponse {
  RegistrationInitResponse(this.rp, this.user, this.challenge);
  final RelyingParty rp;
  final User user;
  final String challenge;
}

class RelyingParty {
  RelyingParty(this.name, this.id);
  final String name;
  final String id;
}

class User {
  User(this.displayName, this.name, this.id);
  final String displayName;
  final String name;
  final String id;
}

class RegistrationCompleteRequest {
  RegistrationCompleteRequest({
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

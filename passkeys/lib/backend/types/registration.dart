class RegistrationInitResponse {
  RegistrationInitResponse(
      this.rp, this.user, this.challenge, this.authenticatorSelection);
  final RelyingParty rp;
  final User user;
  final String challenge;
  final AuthenticatorSelection authenticatorSelection;
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

class AuthenticatorSelection {
  AuthenticatorSelection(this.authenticatorAttachment, this.requireResidentKey,
      this.residentKey, this.userVerification);
  final String authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;
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

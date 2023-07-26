/// Represents a response from the passkeys backend during
/// initialization of the registration process.
class RegistrationInitResponse {
  /// Constructor
  RegistrationInitResponse(
    this.rp,
    this.user,
    this.challenge,
    this.authenticatorSelection, {
    this.pubKeyCredParams,
    this.timeout,
    this.attestation,
  });

  /// The relying party
  final RelyingParty rp;

  /// The user
  final User user;

  /// The challenge
  final String challenge;

  /// The authenticator selection
  final AuthenticatorSelection authenticatorSelection;

  /// The public key credential parameters
  final List<PubKeyCredParam>? pubKeyCredParams;

  /// The timeout
  final int? timeout;

  /// The attestation
  final String? attestation;
}

/// Represents a public key credential parameter
class PubKeyCredParam {
  /// Constructor
  PubKeyCredParam(this.alg, this.type);

  /// The algorithm
  final int alg;

  /// The type
  final String type;
}

/// Represents a relying party
class RelyingParty {
  /// Constructor
  RelyingParty(this.name, this.id);

  /// The name
  final String name;

  /// The id
  final String id;
}

/// Represents a user
class User {
  /// Constructor
  User(this.displayName, this.name, this.id);

  /// The display name
  final String displayName;

  /// The name
  final String name;

  /// The id
  final String id;
}

/// Represents an authenticator selection
class AuthenticatorSelection {
  /// Constructor
  AuthenticatorSelection(
    this.authenticatorAttachment,
    this.requireResidentKey,
    this.residentKey,
    this.userVerification,
  );

  /// The authenticator attachment
  final String authenticatorAttachment;

  /// Whether a resident key is required
  final bool requireResidentKey;

  /// The resident key
  final String residentKey;

  /// The user verification
  final String userVerification;
}

/// Represents a request to the passkeys backend after completing the registration
class RegistrationCompleteRequest {
  /// Constructor
  RegistrationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
  });

  /// The id
  final String id;

  /// The raw id
  final String rawId;

  /// The client data JSON
  final String clientDataJSON;

  /// The attestation object
  final String attestationObject;
}

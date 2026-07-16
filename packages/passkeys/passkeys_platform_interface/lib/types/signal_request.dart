/// The [SignalUnknownCredentialRequestType] is used to tell the platform that a
/// credential is no longer recognized by the relying party, so that it can be
/// removed from the credential picker and autofill suggestions.
///
/// This wraps the WebAuthn `PublicKeyCredential.signalUnknownCredential()`
/// signal.
class SignalUnknownCredentialRequestType {
  /// Constructs a new instance.
  const SignalUnknownCredentialRequestType({
    required this.relyingPartyId,
    required this.credentialId,
  });

  /// The relying party ID the credential belongs to.
  final String relyingPartyId;

  /// The Base64URL encoded ID of the credential that is no longer recognized.
  final String credentialId;
}

/// The [SignalAllAcceptedCredentialsRequestType] is used to tell the platform
/// the complete set of credential IDs that the relying party still accepts for
/// a given user, so that any others can be pruned from the credential picker.
///
/// This wraps the WebAuthn `PublicKeyCredential.signalAllAcceptedCredentials()`
/// signal.
class SignalAllAcceptedCredentialsRequestType {
  /// Constructs a new instance.
  const SignalAllAcceptedCredentialsRequestType({
    required this.relyingPartyId,
    required this.userId,
    required this.allAcceptedCredentialIds,
  });

  /// The relying party ID the credentials belong to.
  final String relyingPartyId;

  /// The Base64URL encoded ID of the user the credentials belong to.
  final String userId;

  /// The Base64URL encoded IDs of all credentials that are still accepted by
  /// the relying party for this user.
  final List<String> allAcceptedCredentialIds;
}

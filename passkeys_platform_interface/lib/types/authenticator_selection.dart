///
class AuthenticatorSelectionType {
  /// Constructs a new instance.
  AuthenticatorSelectionType({
    required this.authenticatorAttachment,
    required this.requireResidentKey,
    required this.residentKey,
    required this.userVerification,
  });

  final String authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;
}

class AvailabilityType {
  /// Constructs a new instance.
  AvailabilityType({
    required this.hasPasskeySupport,
    required this.isUserVerifyingPlatformAuthenticatorAvailable,
    required this.isConditionalMediationAvailable,
    required this.isNative,
  });

  final bool hasPasskeySupport;
  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
  final bool? isConditionalMediationAvailable;
  final bool isNative;
}

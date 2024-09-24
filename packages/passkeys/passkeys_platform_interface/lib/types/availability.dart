class AvailabilityType {
  /// Constructs a new instance.
  AvailabilityType({
    required this.isUserVerifyingPlatformAuthenticatorAvailable,
    required this.isConditionalMediationAvailable,
    required this.isNative,
  });

  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
  final bool? isConditionalMediationAvailable;
  final bool isNative;
}

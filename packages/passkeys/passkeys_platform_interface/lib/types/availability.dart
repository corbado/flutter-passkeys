/// The base class for platform-specific availability information.
///
/// This class defines common properties shared across platforms, such as
/// support for passkeys and whether the platform is native.
sealed class AvailabilityType {
  /// Constructs an instance of [AvailabilityType].
  ///
  /// - [hasPasskeySupport]: Indicates if the platform supports passkeys.
  /// - [isNative]: Whether the platform is native (true) or web-based (false).
  AvailabilityType({
    required this.hasPasskeySupport,
    required this.isNative,
  });

  /// Indicates if the platform supports passkeys.
  final bool hasPasskeySupport;

  /// Indicates whether the platform is native (true) or web-based (false).
  final bool isNative;
}

/// Represents the availability information specific to web platforms.
///
/// Extends [AvailabilityType] with web-specific attributes.
class AvailabilityTypeWeb extends AvailabilityType {
  /// Constructs an instance of [AvailabilityTypeWeb].
  ///
  /// - [hasPasskeySupport]: Indicates if the platform supports passkeys.
  /// - [isNative]: Should be `false` for web platforms.
  /// - [isUserVerifyingPlatformAuthenticatorAvailable]: Optional; whether user
  ///   verifying platform authenticators are available.
  /// - [isConditionalMediationAvailable]: Optional; whether conditional
  ///   mediation is available on the web platform.
  AvailabilityTypeWeb({
    required super.hasPasskeySupport,
    required super.isNative,
    required this.isUserVerifyingPlatformAuthenticatorAvailable,
    required this.isConditionalMediationAvailable,
  });

  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
  final bool? isConditionalMediationAvailable;
}

/// Represents the availability information specific to Android platforms.
///
/// Extends [AvailabilityType] with Android-specific attributes.
class AvailabilityTypeAndroid extends AvailabilityType {
  /// Constructs an instance of [AvailabilityTypeAndroid].
  ///
  /// - [hasPasskeySupport]: Indicates if the platform supports passkeys.
  /// - [isNative]: Should be `true` for Android platforms.
  /// - [isUserVerifyingPlatformAuthenticatorAvailable]: Required; whether user
  ///   verifying platform authenticators are available.
  AvailabilityTypeAndroid({
    required super.hasPasskeySupport,
    required super.isNative,
    required this.isUserVerifyingPlatformAuthenticatorAvailable,
  });

  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
}

/// Represents the availability information specific to iOS platforms.
///
/// Extends [AvailabilityType] with iOS-specific attributes.
class AvailabilityTypeIOS extends AvailabilityType {
  /// Constructs an instance of [AvailabilityTypeIOS].
  ///
  /// - [hasPasskeySupport]: Indicates if the platform supports passkeys.
  /// - [isNative]: Should be `true` for iOS platforms.
  /// - [hasBiometrics]: Required; indicates if the device has biometric support.
  AvailabilityTypeIOS({
    required super.hasPasskeySupport,
    required super.isNative,
    required this.hasBiometrics,
  });

  /// Indicates if the iOS device has biometric support.
  final bool hasBiometrics;
}

/// Represents the availability information specific to Windows platforms.
///
/// Extends [AvailabilityType] with Windows-specific attributes.
class AvailabilityTypeWindows extends AvailabilityType {
  /// Constructs an instance of [AvailabilityTypeWindows].
  ///
  /// - [hasPasskeySupport]: Indicates if the platform supports passkeys.
  /// - [isNative]: Should be `true` for Windows platforms.
  /// - [isUserVerifyingPlatformAuthenticatorAvailable]: Required; whether
  ///   Windows Hello or other platform authenticators are available.
  AvailabilityTypeWindows({
    required super.hasPasskeySupport,
    required super.isNative,
    required this.isUserVerifyingPlatformAuthenticatorAvailable,
  });

  /// Indicates if Windows Hello or other platform authenticators are available.
  final bool isUserVerifyingPlatformAuthenticatorAvailable;
}

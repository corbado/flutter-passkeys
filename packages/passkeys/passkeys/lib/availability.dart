import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// Provides platform-specific methods to query the availability of passkeys.
///
/// The [GetAvailability] class acts as a wrapper around the [PasskeysPlatform]
/// interface, exposing methods to check the availability of passkeys on different platforms.
///
/// Supported methods:
/// - [Web]: Queries availability for web-based platforms.
/// - [Android]: Queries availability for Android platforms.
/// - [IOS]: Queries availability for iOS platforms.
///
/// ### Example Usage
/// ```dart
/// final availabilityChecker = GetAvailability(platform: myPlatformInstance);
/// final webAvailability = await availabilityChecker.web();
/// final androidAvailability = await availabilityChecker.android();
/// final iosAvailability = await availabilityChecker.iOS();
/// ```
///
/// ### Constructor
/// - [GetAvailability]: Requires a [PasskeysPlatform] instance to function.
class GetAvailability {
  GetAvailability({required PasskeysPlatform platform}) : _platform = platform;

  final PasskeysPlatform _platform;

  /// Queries the availability of passkeys for web-based platforms.
  Future<AvailabilityTypeWeb> web() {
    return _platform.getAvailability() as Future<AvailabilityTypeWeb>;
  }

  /// Queries the availability of passkeys for Android platforms.
  Future<AvailabilityTypeAndroid> android() {
    return _platform.getAvailability() as Future<AvailabilityTypeAndroid>;
  }

  /// Queries the availability of passkeys for iOS platforms.
  Future<AvailabilityTypeIOS> iOS() {
    return _platform.getAvailability() as Future<AvailabilityTypeIOS>;
  }

  /// Queries the availability of passkeys for Windows platforms.
  Future<AvailabilityTypeWindows> windows() {
    return _platform.getAvailability() as Future<AvailabilityTypeWindows>;
  }
}

import 'package:flutter/services.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/availability.dart';

/// Handles platform dependent parts of the registration and authentication
/// flow.
class PasskeyAuthenticator {
  /// Constructor
  PasskeyAuthenticator() : _platform = PasskeysPlatform.instance;

  final PasskeysPlatform _platform;

  /// Returns true only if passkeys are supported by the platform.
  @deprecated
  Future<bool> canAuthenticate() {
    return _platform.canAuthenticate();
  }

  Future<void> cancelCurrentAuthenticatorOperation() {
    return _platform.cancelCurrentAuthenticatorOperation();
  }

  /// Creates a new passkey and stores it on the device.
  /// Returns [RegisterResponseType] which must be sent to the relying party
  /// server.
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    try {
      await _platform.cancelCurrentAuthenticatorOperation();
      final r = await _platform.register(request);

      return r;
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          throw PasskeyAuthCancelledException();
        case 'exclude-credentials-match':
          throw ExcludeCredentialsCanNotBeRegisteredException();
        case 'android-missing-google-sign-in':
          throw MissingGoogleSignInException();
        case 'android-sync-account-not-available':
          throw SyncAccountNotAvailableException();
        case 'domain-not-associated':
          throw DomainNotAssociatedException(e.message);
        case 'deviceNotSupported':
          throw DeviceNotSupportedException();
        default:
          rethrow;
      }
    }
  }

  /// Authenticates a user with a passkey.
  /// Returns [AuthenticateResponseType] which must be sent to the relying party
  /// server.
  Future<AuthenticateResponseType> authenticate(
      AuthenticateRequestType request,
      ) async {
    try {
      await _platform.cancelCurrentAuthenticatorOperation();
      final r = await _platform.authenticate(request);

      return r;
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'domain-not-associated':
          throw DomainNotAssociatedException(e.message);
        case 'no-credentials-available':
          throw NoCredentialsAvailableException();
        case 'cancelled':
          throw PasskeyAuthCancelledException();
        case 'android-no-credential':
          throw NoCredentialsAvailableException();
        case 'deviceNotSupported':
          throw DeviceNotSupportedException();
        case 'android-no-create-option':
          throw NoCreateOptionException(e.message);
        default:
          if (e.code.startsWith('android-unhandled')) {
            throw UnhandledAuthenticatorException(e.code, e.message, e.details);
          } else if (e.code.startsWith('ios-unhandled')) {
            throw UnhandledAuthenticatorException(e.code, e.message, e.details);
          } else {
            rethrow;
          }
      }
    }
  }

  /// Returns information about the availabilty of passkeys.
  Future<AvailabilityType> getAvailability() {
    return _platform.getAvailability();
  }
}
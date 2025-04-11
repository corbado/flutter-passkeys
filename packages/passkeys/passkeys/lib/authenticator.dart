import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:passkeys/availability.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';

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

      _isValidChallenge(request.challenge);

      _isValidUserID(request.user.id);

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
        case 'android-timeout':
          throw TimeoutException(e.message);
        case 'ios-security-key-timeout':
          throw TimeoutException(e.message);
        case 'malformed-base64-challenge':
          throw MalformedBase64Challenge();
        case 'malformed-base64-userID':
          throw MalformedBase64UserID();
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

      _isValidBase64Url(request.challenge);

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
        case 'android-timeout':
          throw TimeoutException(e.message);
        case 'ios-security-key-timeout':
          throw TimeoutException(e.message);
        case 'malformed-base64-challenge':
          throw MalformedBase64Challenge();
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

  /// Returns platform-specific information about the availability of passkeys.
  ///
  /// This function returns an instance of [GetAvailability], which provides
  /// platform-specific methods to query the availability of passkeys.
  ///
  /// Supported methods:
  /// - [GetAvailability.web]: For web-based platforms.
  /// - [GetAvailability.android]: For Android platforms.
  /// - [GetAvailability.iOS]: For iOS platforms.
  ///
  /// ### Example Usage
  /// ```dart
  /// final webAvailability = await getAvailability().web();
  /// final androidAvailability = await getAvailability().android();
  /// final iosAvailability = await getAvailability().iOS();
  /// ```
  ///
  /// ### Notes
  /// - Ensure you are using the correct method for the platform being queried.
  GetAvailability getAvailability() => GetAvailability(platform: _platform);

  void _isValidChallenge(String challenge) {
    if(!_isValidBase64Url(challenge)){
      throw PlatformException(code: 'malformed-base64-challenge');
    }
  }

  void _isValidUserID(String userID) {
    if(!_isValidBase64Url(userID)){
      throw PlatformException(code: 'malformed-base64-userID');
    }
  }

  /// Validates if the given string is a valid Base64URL encoded string.
  bool _isValidBase64Url(String input) {
    // Base64URL should only contain A-Z, a-z, 0-9, -, _
    final base64UrlRegex = RegExp(r'^[A-Za-z0-9\-_]+$');

    if (!base64UrlRegex.hasMatch(input)) return false;

    try {
      String normalized = input.padRight(input.length + (4 - input.length % 4) % 4, '=');
      base64Url.decode(normalized);
      return true;
    } catch (e) {
      return false;
    }
  }
}
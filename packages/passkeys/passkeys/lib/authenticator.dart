import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:passkeys/availability.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';

/// Handles platform dependent parts of the registration and authentication
/// flow.
class PasskeyAuthenticator {
  final _doctor = PasskeysDoctor();
  final PasskeysPlatform _platform;
  final bool debugMode;

  /// Constructor
  PasskeyAuthenticator({bool? debugMode})
      : _platform = PasskeysPlatform.instance,
        debugMode = debugMode ?? false;

  ValueListenable<Exception?> get lastException => _doctor.lastException;
  ValueListenable<List<Checkpoint>> get checkpoints => _doctor.checkpoints;

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
    if (debugMode) {
      _doctor.check(request.relyingParty.id);
    }

    try {
      await _platform.cancelCurrentAuthenticatorOperation();

      _isValidChallenge(request.challenge);

      _isValidUserID(request.user.id);

      for (final credential in request.excludeCredentials) {
        _isValidCredentialID(credential.id);
      }

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
    if (debugMode) {
      _doctor.check(request.relyingPartyId);
    }

    try {
      await _platform.cancelCurrentAuthenticatorOperation();

      _isValidChallenge(request.challenge);

      if (request.allowCredentials != null) {
        for (final credential in request.allowCredentials!) {
          _isValidCredentialID(credential.id);
        }
      }

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
    if (!_isValidBase64Url(input: challenge)) {
      throw MalformedBase64UrlChallenge();
    }
  }

  void _isValidCredentialID(String credentialID) {
    if (!_isValidBase64Url(input: credentialID)) {
      throw MalformedBase64UrlCredentialID();
    }
  }

  void _isValidUserID(String userID) {
    if (!_isValidBase64Url(input: userID, allowPadding: true)) {
      throw MalformedBase64UrlUserID();
    }
  }

  /// Validates if the given string is a valid Base64URL encoded string.
  bool _isValidBase64Url({required String input, bool allowPadding = false}) {
    // If padding is allowed, remove trailing '=' characters, but only up to two
    if (allowPadding) {
      var i = 0;
      while (input.endsWith('=') && i < 3) {
        input = input.substring(0, input.length - 1);
        i++;
      }

      if(i==3) {
        return false;
      }
    }

    // Base64URL should only contain A-Z, a-z, 0-9, -, _
    final base64UrlRegex = RegExp(r'^[A-Za-z0-9\-_]+$');

    if (!base64UrlRegex.hasMatch(input)) return false;

    try {
      String normalized =
          input.padRight(input.length + (4 - input.length % 4) % 4, '=');
      base64Url.decode(normalized);

      return true;
    } catch (e) {
      return false;
    }
  }
}

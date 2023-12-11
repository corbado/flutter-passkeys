import 'package:flutter/services.dart';
import 'package:passkeys/authenticator/exceptions.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// Handles platform dependent parts of the registration and authentication
/// flow.
class PasskeyAuthenticator {
  /// Constructor
  PasskeyAuthenticator() : _platform = PasskeysPlatform.instance;

  final PasskeysPlatform _platform;

  /// Returns true only if passkeys are supported by the platform.
  Future<bool> canAuthenticate() {
    return _platform.canAuthenticate();
  }

  /// Creates a new passkey and stores it on the device.
  /// Returns a solution to the [challenge] from [relyingParty]
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    AuthenticatorSelectionType authSelectionType,
    List<PubKeyCredParamType>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  ) async {
    try {
      await _platform.cancelCurrentAuthenticatorOperation();

      final r = await _platform.register(
        challenge,
        relyingParty,
        user,
        authSelectionType,
        pubKeyCredParams,
        timeout,
        attestation,
      );

      return r;
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          throw PasskeyAuthCancelledException();
        case 'android-missing-google-sign-in':
          throw MissingGoogleSignInException();
        case 'android-sync-account-not-available':
          throw SyncAccountNotAvailableException();
        default:
          rethrow;
      }
    }
  }

  /// Returns a solution to the [challenge] from [relyingParty]
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredentialType>? allowCredentials,
    MediationType mediation,
  ) async {
    try {
      await _platform.cancelCurrentAuthenticatorOperation();

      final r = await _platform.authenticate(
        relyingPartyId,
        challenge,
        timeout,
        userVerification,
        allowCredentials,
        mediation: mediation,
      );

      return r;
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          throw PasskeyAuthCancelledException();
        case 'android-no-credential':
          throw MissingGoogleSignInException();
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
}

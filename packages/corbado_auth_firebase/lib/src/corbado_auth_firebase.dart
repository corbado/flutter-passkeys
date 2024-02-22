import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_firebase/src/services/corbado.dart';
import 'package:passkeys/authenticator.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class CorbadoAuthFirebase {
  /// Constructor
  CorbadoAuthFirebase();

  late CorbadoService _corbadoService;
  final PasskeyAuthenticator _authenticator = PasskeyAuthenticator();

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init(String firebaseRegion) async {
    final functions = FirebaseFunctions.instanceFor(region: firebaseRegion);
    _corbadoService = CorbadoService(functions);
  }

  Future<String> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    try {
      final ua = await userAgent();
      final challenge = await _corbadoService.startSignUpWithPasskey(email, ua);
      final platformResponse = await _authenticator.register(challenge);

      return await _corbadoService.finishSignUpWithPasskey(
          platformResponse, ua);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> appendPasskey(String firebaseToken) async {
    final ua = await userAgent();
    final challenge =
        await _corbadoService.startPasskeyAppend(firebaseToken, ua);
    final platformResponse = await _authenticator.register(challenge);

    return _corbadoService.finishPasskeyAppend(
        firebaseToken, platformResponse, ua);
  }

  Future<void> cancelAuthenticatorOperation() {
    return _authenticator.cancelCurrentAuthenticatorOperation();
  }

  /// Signs in a user relying on a passkey.
  /// This is the recommended way to do sign in with passkeys as the user does
  /// not have to remember his username.
  ///
  /// This method should be called when the sign in page is loaded.
  /// Depending on the platform, the passkey ceremony will be started
  /// immediately without any user interaction (e.g. Android) or it requires
  /// additional user input (e.g. iOS or web where the user needs to click the
  /// TextField).
  Future<String> autocompletedLoginWithPasskey() {
    return _loginWithPasskey('');
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<String> loginWithPasskey({required String email}) async {
    return _loginWithPasskey(email);
  }

  Future<void> startLoginWithEmailOTP(String email) async {
    return _corbadoService.startLoginWithEmailOTP(email);
  }

  Future<String> finishLoginWithEmailOTP(String code) async {
    return _corbadoService.finishLoginWithEmailOTP(code);
  }

  Future<List<PasskeyInfo>> getPasskeys(String firebaseToken) async {
    return _corbadoService.getPasskeys(firebaseToken);
  }

  Future<void> deletePasskey(String firebaseToken, String passkeyId) async {
    return _corbadoService.deletePasskey(firebaseToken, passkeyId);
  }

  Future<void> deleteUser(String firebaseToken) async {
    try {
      return await _corbadoService.deleteUser(firebaseToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _loginWithPasskey(String email) async {
    final isConditionalUI = email.isEmpty;
    final ua = await userAgent();
    final challenge = await _corbadoService.startLoginWithPasskey(
      email,
      ua,
      conditional: isConditionalUI,
    );
    final platformResponse = await _authenticator.authenticate(challenge);

    return _corbadoService.finishLoginWithPasskey(platformResponse, ua);
  }
}

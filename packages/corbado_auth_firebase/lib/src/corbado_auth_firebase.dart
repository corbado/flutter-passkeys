import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_firebase/src/services/corbado.dart';
import 'package:passkeys/authenticator.dart';

class CorbadoAuthFirebase {
  /// Constructor
  CorbadoAuthFirebase();

  final CorbadoService _corbadoService = CorbadoService.getInstance();
  final PasskeyAuthenticator _authenticator = PasskeyAuthenticator();

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init(String projectId, {String? customDomain}) async {}

  Future<String> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    try {
      final challenge =
      await _corbadoService.startSignUpWithPasskey(email, fullName ?? email);
      final platformResponse = await _authenticator.register(challenge);

      return await _corbadoService.finishSignUpWithPasskey(platformResponse);
    } catch (e) {
      throw e;
    }
  }


  Future<void> appendPasskey(String firebaseToken) async {
    final challenge =
    await _corbadoService.startPasskeyAppend(firebaseToken);
    final platformResponse = await _authenticator.register(challenge);

    return _corbadoService.finishPasskeyAppend(firebaseToken, platformResponse);
  }

  /*
  Future<void> cancelAuthenticatorOperation() {
    return _inner.passkeyAuthenticator.cancelCurrentAuthenticatorOperation();
  }*/

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
    return _loginWithPasskey("");
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<String> loginWithPasskey({required String email}) async {
    try {
      return await _loginWithPasskey(email);
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _loginWithPasskey(String email) async {
    final challenge = await _corbadoService.startLoginWithPasskey(email);
    final platformResponse = await _authenticator.authenticate(challenge);

    return _corbadoService.finishLoginWithPasskey(platformResponse);
  }

  Future<List<PasskeyInfo>> getPasskeys(String firebaseToken) async {
    return _corbadoService.getPasskeys(firebaseToken);
  }

  Future<void> deletePasskey(String firebaseToken, String passkeyId) async {
    return _corbadoService.deletePasskey(firebaseToken, passkeyId);
}

  Future<void> deleteUser(String firebaseToken) async {
    return _corbadoService.deleteUser(firebaseToken);
  }

  Exception _convertFirebaseFunctionsException(FirebaseFunctionsException e) {
    switch (e.message) {
      case 'UNKNOWN_USER':
        return UnknownUserException('');
      case 'NO_PASSKEY_AVAILABLE':
        return NoPasskeyForDeviceException();
    }

    return UnexpectedBackendException(e.code, e.message ?? '');
  }
}

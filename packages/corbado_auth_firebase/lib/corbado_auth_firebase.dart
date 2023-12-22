import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_firebase/services/corbado.dart';

class CorbadoAuthFirebase {
  /// Constructor
  CorbadoAuthFirebase();

  final CorbadoService _corbadoService = CorbadoService.getInstance();

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init(String projectId, {String? customDomain}) async {}

  Future<User> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    // call extension /register/start (no token)
    final r =
        await _corbadoService.startSignUpWithPasskey(email, fullName ?? email);
    // call passkeyAuthenticator

    // call extension /register/finish (no token)

    return User.fromIdToken('');
  }

/*
  Future<User> associatePasskey() async {
    // call extension /register/start (with token)

    // call passkeyAuthenticator

    // call extension /register/finish (with token)

    return null;
  }
  Future<void> cancelAuthenticatorOperation() {
    return _inner.passkeyAuthenticator.cancelCurrentAuthenticatorOperation();
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
  Future<User> autocompletedLoginWithPasskey() {
    return _loginWithPasskey();
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<User> loginWithPasskey({required String email}) async {
    return _loginWithPasskey(email: email);
  }

  Future<User> _loginWithPasskey({String? email}) {
    // call extension /login/start (no token)

    // call passkeyAuthenticator

    // call extension /login/finish (no token)
  }

  /// Deletes a passkey by its credentialID.
  Future<void> deletePasskey(String credentialID) async {
    final refreshToken = await _sessionService.getRefreshToken();
    await _inner.corbadoService
        .deletePasskey(credentialID, token: refreshToken);
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<List<PasskeyInfo>> loadPasskeys(
      {String? explicitRefreshToken}) async {
    final refreshToken =
        explicitRefreshToken ?? await _sessionService.getRefreshToken();
    final passkeys =
    await _inner.corbadoService.getPasskeys(token: refreshToken);

    _passkeysStreamController.sink.add(passkeys);

    return passkeys;
  }*/
}

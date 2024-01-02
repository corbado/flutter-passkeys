import 'dart:async';

import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserNotLoggedInException implements Exception {
  UserNotLoggedInException();

  @override
  String toString() {
    return 'User is not logged in';
  }
}

// This service encapsulates all authentication functionality.
// It makes use of the corbado SDK through CorbadoAuth.
class AuthService {
  final CorbadoAuthFirebase _corbadoAuth;
  final FirebaseAuth _firebaseAuth;
  final User? _user;

  AuthService(this._corbadoAuth, this._firebaseAuth, this._user);

  Future<String?> register({required String email}) async {
    try {
      final passkeyToken =
          await _corbadoAuth.signUpWithPasskey(email: email, fullName: email);
      await _firebaseAuth.signInWithCustomToken(passkeyToken);

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'INVALID_LOGIN_CREDENTIALS':
          return 'Either no such user exists or the password is wrong. Please try again.';
        default:
          return e.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signIn({required String email}) async {
    final passkeyToken = await _corbadoAuth.loginWithPasskey(email: email);
    await _firebaseAuth.signInWithCustomToken(passkeyToken);

    return;
  }

  Future<void> signInWithAutocomplete() async {
    // return await _auth.autocompletedLoginWithPasskey();
    return;
  }

  Future<void> startLoginWithEmailOTP(String email) async {
    return _corbadoAuth.startLoginWithEmailOTP(email);
  }

  Future<String?> finishLoginWithEmailOTP(String code) async {
    try {
      final passkeyToken = await _corbadoAuth.finishLoginWithEmailOTP(code);
      await _firebaseAuth.signInWithCustomToken(passkeyToken);

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  deleteAccount() async {
    final firebaseToken = await getFirebaseToken();
    await _corbadoAuth.deleteUser(firebaseToken);

    await _user?.delete();
  }

  Future<List<PasskeyInfo>> getPasskeys() async {
    final firebaseToken = await getFirebaseToken();
    return await _corbadoAuth.getPasskeys(firebaseToken);
  }

  deletePasskey(String passkeyId) async {
    final firebaseToken = await getFirebaseToken();
    await _corbadoAuth.deletePasskey(firebaseToken, passkeyId);
  }

  Future<String?> appendPasskey() async {
    try {
      final firebaseToken = await getFirebaseToken();
      final mustReload = await _corbadoAuth.appendPasskey(firebaseToken);
      if (mustReload) {
        await _user?.getIdToken(true);
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getFirebaseToken() async {
    if (_user == null) {
      return throw UserNotLoggedInException();
    }

    final firebaseToken = await _user.getIdToken();
    if (firebaseToken == null) {
      return throw UserNotLoggedInException();
    }

    return firebaseToken;
  }
}

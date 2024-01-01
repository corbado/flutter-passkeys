import 'dart:async';

import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      final credential =
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

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signIn({required String email}) async {
    final passkeyToken = await _corbadoAuth.loginWithPasskey(email: email);
    final credential = await _firebaseAuth.signInWithCustomToken(passkeyToken);

    return;
  }

  Future<void> signInWithAutocomplete() async {
    // return await _auth.autocompletedLoginWithPasskey();
    return;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  deleteAccount() async {
    final currentFirebaseUser = _user;
    if (currentFirebaseUser == null) {
      return;
    }

    final firebaseToken = await currentFirebaseUser.getIdToken();
    if (firebaseToken == null) {
      return;
    }

    await _corbadoAuth.deleteUser(firebaseToken);
    await currentFirebaseUser.delete();
  }

  Future<List<PasskeyInfo>> getPasskeys() async {
    final currentFirebaseUser = _user;
    if (currentFirebaseUser == null) {
      return [];
    }

    final firebaseToken = await currentFirebaseUser.getIdToken();
    if (firebaseToken == null) {
      return [];
    }

    return await _corbadoAuth.getPasskeys(firebaseToken);
  }

  deletePasskey(String passkeyId) async {
    final currentFirebaseUser = _user;
    if (currentFirebaseUser == null) {
      return;
    }

    final firebaseToken = await currentFirebaseUser.getIdToken();
    if (firebaseToken == null) {
      return;
    }

    await _corbadoAuth.deletePasskey(firebaseToken, passkeyId);
  }

  appendPasskey() async {
    final currentFirebaseUser = _user;
    if (currentFirebaseUser == null) {
      return;
    }

    final firebaseToken = await currentFirebaseUser.getIdToken();
    if (firebaseToken == null) {
      return;
    }

    await _corbadoAuth.appendPasskey(firebaseToken);
  }
}

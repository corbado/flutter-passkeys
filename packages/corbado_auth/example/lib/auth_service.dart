import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';

// This service encapsulates all authentication functionality.
// It makes use of the corbado SDK through CorbadoAuth.
class AuthService {
  final CorbadoAuth _auth;

  AuthService(this._auth);

  Future<String?> register({required String email}) async {
    try {
      await _auth.registerWithPasskey(email: email, fullName: email);
      return null;
    } on PasskeyAuthCancelledException {
      return null;
    } on ValidationException catch (e) {
      return 'validation error: ${e.toString()}';
    } on UnexpectedBackendException catch (e) {
      debugPrint(e.toString());
      return 'An unexpected error happened during registration. Please try again later.';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({required String email}) async {
    try {
      await _auth.loginWithPasskey(email: email);
      return null;
    } on PasskeyAuthCancelledException {
      return null;
    } on NoPasskeyForDeviceException {
      return 'No passkey has been setup on this device for ${email}.';
    } on UnknownUserException {
      return 'Incorrect user identifier. Please check your email.';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signInWithAutocomplete() async {
    return await _auth.autocompletedLoginWithPasskey();
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

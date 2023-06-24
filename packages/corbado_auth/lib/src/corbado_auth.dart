import 'dart:async';

import 'package:corbado_auth/src/services/secure_storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:passkeys/backend/corbado/types/authentication.dart';
import 'package:passkeys/passkey_auth.dart';

/// {@template corbado_auth}
/// Corbado auth flutter package
/// {@endtemplate}
class CorbadoAuth {
  /// {@macro corbado_auth}
  CorbadoAuth(this._passkeyAuth) {
    _storage = SecureStorage();
  }

  ///
  Stream<User?> get userStream => _userStreamController.stream;

  ///
  Future<User?> get currentUser => _userStreamController.stream.first;

  late SecureStorage _storage;
  final PasskeyAuth<CorbadoAuthenticationCompleteResponse> _passkeyAuth;
  final _userStreamController = StreamController<User?>();

  ///
  Future<void> init() async {
    try {
      final maybeUser = await _storage.getUser();
      return _userStreamController.add(maybeUser);
    } catch (e) {
      debugPrint(e.toString());
      return _userStreamController.add(null);
    }
  }

  ///
  Future<void> registerWithPasskey({required String email}) async {
    return _passkeyAuth.registerWithEmail(email);
  }

  ///
  Future<void> signInWithPasskey({required String email}) async {
    final signInResponse = await _passkeyAuth.authenticateWithEmail(email);
    final user = User.fromIdToken(signInResponse.token);
    _userStreamController.add(user);
    await _storage.setUser(user);
  }

  ///
  Future<void> signOut() async {
    await _storage.clear();
    _userStreamController.add(null);
  }
}

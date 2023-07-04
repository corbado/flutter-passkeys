import 'dart:async';

import 'package:corbado_auth/src/services/corbado_api/generated/lib/api.dart';
import 'package:corbado_auth/src/services/session_storage/secure_storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:passkeys/backend/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/backend/corbado/types/authentication.dart';
import 'package:passkeys/passkey_auth.dart';

/// {@template corbado_auth}
/// Corbado auth flutter package
/// {@endtemplate}
class CorbadoAuth {
  /// {@macro corbado_auth}
  CorbadoAuth(this._projectID) {
    _storage = SecureStorage();
  }

  @visibleForTesting
  PasskeyAuth<CorbadoTokens>? passkeyAuth;

  PasskeyAuth<CorbadoTokens> get _passkeyAuth {
    return passkeyAuth ??= PasskeyAuth(CorbadoPasskeyBackend(_projectID));
  }

  ///
  Stream<User?> get userStream => _userStreamController.stream;

  ///
  Future<User?> get currentUser => _userStreamController.stream.first;

  late SecureStorage _storage;

  final String _projectID;

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

  /// Signs up a user by registering a new passkey.
  Future<String?> registerWithPasskey({required String email}) async {
    final response = await _passkeyAuth.registerWithEmail(email);
    final user = User.fromIdToken(response.token);
    _userStreamController.add(user);
    await _storage.setUser(user);
    await _storage.setRefreshToken(response.refreshToken);

    return null;
  }

  ///
  Future<void> signInWithPasskey({required String email}) async {
    final response = await _passkeyAuth.authenticateWithEmail(email);
    final user = User.fromIdToken(response.token);
    _userStreamController.add(user);
    await _storage.setUser(user);
    await _storage.setRefreshToken(response.refreshToken);
  }

  Future<void> refreshToken() async {
    final client = ApiClient(basePath: 'https://$_projectID.auth.corbado.com');
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('Stopped refreshToken: missing token.');
    }

    // TODO: add refresh token here (currently not easy, as it must be sent as a cookie)
    final res = await SessionsApi(client).sessionRefreshWithHttpInfo(EmptyReq());
    debugPrint(res.toString());
  }

  ///
  Future<void> signOut() async {
    await _storage.clear();
    _userStreamController.add(null);
  }
}

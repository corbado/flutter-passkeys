import 'dart:async';

import 'package:corbado_auth/src/services/corbado_api/generated/lib/api.dart';
import 'package:corbado_auth/src/services/session_storage/secure_storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:rxdart/rxdart.dart';

/// {@template corbado_auth}
/// Corbado auth flutter package
/// {@endtemplate}
class CorbadoAuth {
  /// {@macro corbado_auth}
  CorbadoAuth(this._projectID) {
    _storage = SecureStorage();
  }

  ///
  @visibleForTesting
  PasskeyAuth<CorbadoRequest, CorbadoTokens>? passkeyAuth;

  PasskeyAuth<CorbadoRequest, CorbadoTokens> get _passkeyAuth {
    return passkeyAuth ??= PasskeyAuth(CorbadoPasskeyBackend(_projectID));
  }

  ///
  BehaviorSubject<User?> get userStream => _userSubject;

  ///
  Future<User?> get currentUser => _userSubject.first;

  late SecureStorage _storage;

  final String _projectID;

  final _userSubject = BehaviorSubject<User?>();

  String? _refreshToken;

  final _preemptiveRefreshDuration = const Duration(seconds: 240);

  Timer? _refreshTimer;

  ///
  Future<void> init() async {
    try {
      final passkeysSupported = await _passkeyAuth.isSupported();
      if (!passkeysSupported) {
        debugPrint('passkeys are not supported on this device');
      }

      final maybeUser = await _storage.getUser();
      if (maybeUser == null) {
        _userSubject.add(null);
        return;
      }

      final maybeRefreshToken = await _storage.getRefreshToken();
      await _postSignIn(maybeUser, maybeRefreshToken);
    } catch (e) {
      debugPrint(e.toString());
      return _userSubject.add(null);
    }
  }

  /// Signs up a user by registering a new passkey (using the passkeys package)
  Future<String?> registerWithPasskey({
    required String email,
    String fullName = '',
  }) async {
    final response = await _passkeyAuth
        .registerWithEmail(CorbadoRequest(email, username: fullName));
    // user has not finished the registration
    if (response == null) {
      return null;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);

    return null;
  }

  ///
  Future<void> signInWithPasskey({required String email}) async {
    final response =
        await _passkeyAuth.authenticateWithEmail(CorbadoRequest(email));
    // user has not finished the authentication
    if (response == null) {
      return;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);
  }

  ///
  Future<User> refreshToken() async {
    final client =
        ApiClient(basePath: 'https://$_projectID.frontendapi.corbado.io');
    //final refreshToken = await _storage.getRefreshToken();
    if (_refreshToken == null) {
      throw Exception('Stopped refreshToken: missing refresh token.');
    }

    client.addDefaultHeader('Authorization', 'Bearer $_refreshToken');
    final response = await SessionsApi(client).sessionRefresh(EmptyReq());
    if (response == null || response.shortSession == null) {
      throw Exception('Stopped refreshToken: missing token in response.');
    }

    final user = User.fromIdToken(response.shortSession!.value);
    await _storage.setUser(user);
    _userSubject.add(user);

    return user;
  }

  Future<void> _postSignIn(User user, String? refreshToken) async {
    await _storage.setUser(user);

    if (refreshToken != null) {
      await _storage.setRefreshToken(refreshToken);
      _refreshToken = refreshToken;
      _scheduleRefreshRoutine(user);
    }

    _userSubject.add(user);
  }

  void _scheduleRefreshRoutine(User user) {
    // if another refresh has already been scheduled we stop that one
    // this is not expected => if it occurs there is a problem with the code
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      _refreshTimer!.cancel();
    }

    _refreshTimer = Timer(_getWaitDurationForNextRefresh(user), () async {
      try {
        final user = await refreshToken();
        _scheduleRefreshRoutine(user);
      } catch (e) {
        debugPrint(e.toString());
        _scheduleRefreshRoutine(user);
      }
    });
  }

  Duration _getWaitDurationForNextRefresh(User user) {
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();

    // is token already timed out?
    if (user.decoded.exp < now) {
      return const Duration(seconds: 60);
    }

    final lifetime = Duration(seconds: user.decoded.exp - now);
    final wait = lifetime - _preemptiveRefreshDuration;

    return wait;
  }

  ///
  Future<void> signOut() async {
    await _storage.clear();
    _refreshTimer?.cancel();

    _userSubject.add(null);
  }
}

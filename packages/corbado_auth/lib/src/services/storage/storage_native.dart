import 'dart:convert';

import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _refreshTokenKey = 'refresh_token';
const _userKey = 'user';
const _frontEndApiUrlKey = 'front_end_api_url';
const _clientEnvHandleKey = 'client_env_handle';

/// Used to store session data like:
/// - refreshToken (longSession)
/// - user (shortSession)
/// - frontEndApiUrl
/// - clientEnvHandle (needed for passkey intelligence)
class NativeStorageService implements StorageService {
  NativeStorageService(this._projectId);

  final String _projectId;
  final storage = FlutterSecureStorage();

  String _generateKey(String key) => '$key-$_projectId';

  Future<String?> _get(String key) {
    return storage.read(key: _generateKey(key));
  }

  Future<void> _put(String key, String value) async {
    final doesValueExist = await _get(key) != null;

    if (doesValueExist) {
      return storage.delete(key: _generateKey(key)).then((_) {
        return storage.write(key: _generateKey(key), value: value);
      });
    }

    return storage.write(key: _generateKey(key), value: value);
  }

  Future<void> _remove(String key) {
    return storage.delete(key: _generateKey(key));
  }

  /// Returns the refreshToken if it has been set
  @override
  Future<String?> getRefreshToken() {
    return _get(_refreshTokenKey);
  }

  /// Sets the refreshToken
  @override
  Future<void> setRefreshToken(String value) {
    return _put(_refreshTokenKey, value);
  }

  /// Returns the user if it has been set
  @override
  Future<User?> getUser() async {
    final serialized = await _get(_userKey);
    if (serialized == null) {
      return null;
    }

    final decoded = jsonDecode(serialized);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    return User.fromJson(decoded);
  }

  /// Sets the user
  @override
  Future<void> setUser(User value) {
    final serialized = jsonEncode(value.toJson());
    return _put(_userKey, serialized);
  }

  /// Returns the front-end API URL if it has been set
  @override
  Future<String?> getFrontEndApiUrl() {
    return _get(_frontEndApiUrlKey);
  }

  /// Sets the front-end API URL
  @override
  Future<void> setFrontEndApiUrl(String value) {
    return _put(_frontEndApiUrlKey, value);
  }

  /// Sets the client environment handle
  @override
  Future<void> setClientEnvHandle(String value) {
    return _put(_clientEnvHandleKey, value);
  }

  /// Returns the client environment handle if it has been set
  @override
  Future<String?> getClientEnvHandle() {
    return _get(_clientEnvHandleKey);
  }

  /// Removes all data except the client environment handle (full clear)
  @override
  Future<void> clear() async {
    // We wont clear clientEnv because we want to keep track of it even when we
    // log out and the clear function is called on sign out
    await _remove(_userKey);
    await _remove(_refreshTokenKey);
    await _remove(_frontEndApiUrlKey);
  }
}

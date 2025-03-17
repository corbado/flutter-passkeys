import 'dart:convert';

import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

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

  String _generateKey(String key) => '$_projectId-$key';

  Future<String?> _get(String key) {
    return FlutterKeychain.get(key: _generateKey(key));
  }

  Future<void> _put(String key, String value) {
    return FlutterKeychain.put(key: _generateKey(key), value: value);
  }

  Future<void> _remove(String key) {
    return FlutterKeychain.remove(key: _generateKey(key));
  }

  @override
  Future<String?> getRefreshToken() {
    return _get(_refreshTokenKey);
  }

  @override
  Future<void> setRefreshToken(String value) {
    return _put(_refreshTokenKey, value);
  }

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

  @override
  Future<void> setUser(User value) {
    final serialized = jsonEncode(value.toJson());
    return _put(_userKey, serialized);
  }

  @override
  Future<String?> getFrontEndApiUrl() {
    return _get(_frontEndApiUrlKey);
  }

  @override
  Future<void> setFrontEndApiUrl(String value) {
    return _put(_frontEndApiUrlKey, value);
  }

  @override
  Future<void> setClientEnvHandle(String value) {
    return _put(_clientEnvHandleKey, value);
  }

  @override
  Future<String?> getClientEnvHandle() {
    return _get(_clientEnvHandleKey);
  }

  @override
  Future<void> clear() async {
    await _remove(_userKey);
    await _remove(_refreshTokenKey);
    await _remove(_frontEndApiUrlKey);
  }
}

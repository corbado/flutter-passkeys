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
class NativeStorageService implements StorageService {
  NativeStorageService(this._projectId);

  final String _projectId;

  String _getProjectKey(String key) => '$_projectId-$key';

  /// returns the refreshToken if it has been set
  @override
  Future<String?> getRefreshToken() {
    return FlutterKeychain.get(key: _getProjectKey(_refreshTokenKey));
  }

  /// sets the refreshToken
  @override
  Future<void> setRefreshToken(String value) {
    return FlutterKeychain.put(
      key: _getProjectKey(_refreshTokenKey),
      value: value,
    );
  }

  /// returns the user if it has been set
  @override
  Future<User?> getUser() async {
    final serialized = await FlutterKeychain.get(key: _getProjectKey(_userKey));
    if (serialized == null) {
      return null;
    }

    final decoded = jsonDecode(serialized);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    return User.fromJson(decoded);
  }

  /// sets the user
  @override
  Future<void> setUser(User value) {
    final serialized = jsonEncode(value.toJson());
    return FlutterKeychain.put(key: _userKey, value: serialized);
  }

  @override
  Future<String?> getFrontEndApiUrl() async {
    final value = await FlutterKeychain.get(
      key: _getProjectKey(_frontEndApiUrlKey),
    );
    if (value == null) {
      return null;
    }

    return value;
  }

  @override
  Future<void> setFrontEndApiUrl(String value) {
    return FlutterKeychain.put(
      key: _getProjectKey(_frontEndApiUrlKey),
      value: value,
    );
  }

  @override
  Future<void> setClientEnvHandle(String value) async {
    await FlutterKeychain.put(
      key: _getProjectKey(_clientEnvHandleKey),
      value: value,
    );
  }

  @override
  Future<String?> getClientEnvHandle() {
    return FlutterKeychain.get(
      key: _getProjectKey(_clientEnvHandleKey),
    );
  }

  /// removes all data from (full clear)
  @override
  Future<void> clear() async {
    // We wont clear clientEnv because we want to keep track of it even when we
    // log out and the clear function is called on sign out
    await FlutterKeychain.remove(key: _getProjectKey(_userKey));
    await FlutterKeychain.remove(key: _getProjectKey(_refreshTokenKey));
    await FlutterKeychain.remove(key: _getProjectKey(_frontEndApiUrlKey));
  }
}

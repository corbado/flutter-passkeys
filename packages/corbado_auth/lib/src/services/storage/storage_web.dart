import 'dart:convert';

import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:universal_html/html.dart';

const _refreshTokenKey = 'refresh_token';
const _userKey = 'user';
const _frontEndApiUrlKey = 'front_end_api_url';
const _clientEnvHandleKey = 'client_env_handle';

/// Used to store session data like:
/// - refreshToken (longSession)
/// - user (shortSession)
class WebStorageService implements StorageService {
  WebStorageService(this._projectId);

  final String _projectId;
  final Storage _localStorage = window.localStorage;

  String _generateKey(String key) => '$key-$_projectId';

  String? _get(String key) => _localStorage[_generateKey(key)];

  void _put(String key, String value) =>
      _localStorage[_generateKey(key)] = value;

  void _remove(String key) => _localStorage.remove(_generateKey(key));

  /// Returns the refresh token if it has been set
  @override
  Future<String?> getRefreshToken() async => _get(_refreshTokenKey);

  /// Sets the refresh token
  @override
  Future<void> setRefreshToken(String value) async => _put(
        _refreshTokenKey,
        value,
      );

  /// Returns the user if it has been set
  @override
  Future<User?> getUser() async {
    final serialized = _get(_userKey);
    if (serialized == null) return null;

    final decoded = jsonDecode(serialized);
    if (decoded is! Map<String, dynamic>) return null;

    return User.fromJson(decoded);
  }

  /// Sets the user
  @override
  Future<void> setUser(User value) async {
    final serialized = jsonEncode(value.toJson());
    _put(_userKey, serialized);
  }

  /// Returns the front end API URL
  @override
  Future<String?> getFrontEndApiUrl() async => _get(_frontEndApiUrlKey);

  /// Sets the front end API URL
  @override
  Future<void> setFrontEndApiUrl(String value) async => _put(
        _frontEndApiUrlKey,
        value,
      );

  /// Sets the client environment handle
  @override
  Future<void> setClientEnvHandle(String value) async => _put(
        _clientEnvHandleKey,
        value,
      );

  /// Returns the client environment handle if it has been set
  @override
  Future<String?> getClientEnvHandle() async => _get(_clientEnvHandleKey);

  /// Removes all data except the client environment handle (full clear)
  @override
  Future<void> clear() async {
    // We wont clear clientEnv because we want to keep track of it even when we
    // log out and the clear function is called on sign out
    _remove(_userKey);
    _remove(_refreshTokenKey);
    _remove(_frontEndApiUrlKey);
  }
}

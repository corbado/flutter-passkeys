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
  final Storage _localStorage = window.localStorage;

  /// returns the refreshToken if it has been set
  @override
  Future<String?> getRefreshToken() async {
    return _localStorage[_refreshTokenKey];
  }

  /// sets the refreshToken
  @override
  Future<void> setRefreshToken(String value) async {
    _localStorage[_refreshTokenKey] = value;
    return;
  }

  /// returns the user if it has been set
  @override
  Future<User?> getUser() async {
    final serialized = _localStorage[_userKey];
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
  Future<void> setUser(User value) async {
    final serialized = jsonEncode(value.toJson());
    _localStorage[_userKey] = serialized;

    return;
  }

  @override
  Future<String?> getFrontEndApiUrl() async {
    final value = _localStorage[_frontEndApiUrlKey];
    if (value == null) {
      return null;
    }

    return value;
  }

  @override
  Future<void> setFrontEndApiUrl(String value) async {
    _localStorage[_frontEndApiUrlKey] = value;

    return;
  }

  @override
  Future<void> setClientEnvHandle(String value) async {
    _localStorage[_clientEnvHandleKey] = value;

    return;
  }

  @override
  Future<String?> getClientEnvHandle() async {
    return _localStorage[_clientEnvHandleKey];
  }

  /// removes all data from (full clear)
  @override
  Future<void> clear() async {
    _localStorage
      ..remove(_userKey)
      ..remove(_refreshTokenKey)
      ..remove(_frontEndApiUrlKey)
      ..remove(_clientEnvHandleKey);

    return;
  }
}

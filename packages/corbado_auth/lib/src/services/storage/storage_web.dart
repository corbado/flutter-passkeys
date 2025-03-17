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

  String _generateKey(String key) => '$_projectId-$key';

  String? _get(String key) => _localStorage[_generateKey(key)];

  void _put(String key, String value) =>
      _localStorage[_generateKey(key)] = value;

  void _remove(String key) => _localStorage.remove(_generateKey(key));

  @override
  Future<String?> getRefreshToken() async => _get(_refreshTokenKey);

  @override
  Future<void> setRefreshToken(String value) async => _put(
        _refreshTokenKey,
        value,
      );

  @override
  Future<User?> getUser() async {
    final serialized = _get(_userKey);
    if (serialized == null) return null;

    final decoded = jsonDecode(serialized);
    if (decoded is! Map<String, dynamic>) return null;

    return User.fromJson(decoded);
  }

  @override
  Future<void> setUser(User value) async {
    final serialized = jsonEncode(value.toJson());
    _put(_userKey, serialized);
  }

  @override
  Future<String?> getFrontEndApiUrl() async => _get(_frontEndApiUrlKey);

  @override
  Future<void> setFrontEndApiUrl(String value) async => _put(
        _frontEndApiUrlKey,
        value,
      );

  @override
  Future<void> setClientEnvHandle(String value) async => _put(
        _clientEnvHandleKey,
        value,
      );

  @override
  Future<String?> getClientEnvHandle() async => _get(_clientEnvHandleKey);

  @override
  Future<void> clear() async {
    _remove(_userKey);
    _remove(_refreshTokenKey);
    _remove(_frontEndApiUrlKey);
  }
}

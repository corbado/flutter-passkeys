import 'dart:convert';

import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

const _refreshTokenKey = 'refresh_token';
const _userKey = 'user';

/// Used to store session data like:
/// - refreshToken (longSession)
/// - user (shortSession)
class NativeStorageService implements StorageService {
  /// returns the refreshToken if it has been set
  @override
  Future<String?> getRefreshToken() {
    return FlutterKeychain.get(key: _refreshTokenKey);
  }

  /// sets the refreshToken
  @override
  Future<void> setRefreshToken(String value) {
    return FlutterKeychain.put(key: _refreshTokenKey, value: value);
  }

  /// returns the user if it has been set
  @override
  Future<User?> getUser() async {
    final serialized = await FlutterKeychain.get(key: _userKey);
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

  /// removes all data from (full clear)
  @override
  Future<void> clear() async {
    await FlutterKeychain.remove(key: _userKey);
    await FlutterKeychain.remove(key: _refreshTokenKey);
  }
}

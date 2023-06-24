import 'dart:convert';

import 'package:corbado_auth/src/types/user.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

const _refreshTokenKey = 'refresh_token';
const _userKey = 'user';

class SecureStorage {
  Future<String?> getRefreshToken() {
    return FlutterKeychain.get(key: _refreshTokenKey);
  }

  Future<void> setRefreshToken(String value) {
    return FlutterKeychain.put(key: _refreshTokenKey, value: value);
  }

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

  Future<void> setUser(User value) {
    final serialized = jsonEncode(value.toJson());
    return FlutterKeychain.put(key: _userKey, value: serialized);
  }

  Future<void> clear() async {
    await FlutterKeychain.remove(key: _userKey);
    await FlutterKeychain.remove(key: _refreshTokenKey);
  }
}

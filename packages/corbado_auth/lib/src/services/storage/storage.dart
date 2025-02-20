import 'package:corbado_auth/corbado_auth.dart';

/// Used to store session data like:
/// - refreshToken (longSession)
/// - user (shortSession)
///
/// Implementations depend on the platform
abstract class StorageService {
  /// returns the refreshToken if it has been set
  Future<String?> getRefreshToken();

  /// sets the refreshToken
  Future<void> setRefreshToken(String value);

  /// returns the user if it has been set
  Future<User?> getUser();

  /// sets the user
  Future<void> setUser(User value);

  /// returns the user if it has been set
  Future<String?> getFrontEndApiUrl();

  /// sets the user
  Future<void> setFrontEndApiUrl(String value);

  /// removes all data from (full clear)
  Future<void> clear();
}

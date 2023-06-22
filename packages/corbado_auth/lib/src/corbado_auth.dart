import 'package:corbado_auth/src/types/user.dart';
import 'package:passkeys/passkey_auth.dart';

/// {@template corbado_auth}
/// Corbado auth flutter package
/// {@endtemplate}
class CorbadoAuth {

  /// {@macro corbado_auth}
  const CorbadoAuth(this._passkeyAuth);

  final Stream<User?> _userStream = const Stream.empty();
  final PasskeyAuth _passkeyAuth;

  ///
  Future<void> registerWithPasskey({required String email}) async {
    return _passkeyAuth.registerWithEmail(email);
  }

  ///
  Future<void> signInWithPasskey({required String email}) async {
    final signInResponse = await _passkeyAuth.authenticateWithEmail(email);
    return;
  }

  Future<void> signOut() async {

  }

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out) and also token refresh events.
  Stream<User?> idTokenChanges() => _userStream;
}

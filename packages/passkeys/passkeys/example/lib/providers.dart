import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/local_relying_party_server.dart';

// Relying party server provider.
final authServiceProvider = Provider<AuthService>((ref) {
  final rps = LocalRelyingPartyServer();
  final authenticator = PasskeyAuthenticator();

  return AuthService(rps: rps, authenticator: authenticator);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys_example/relying_party_server.dart';

// Relying party server provider.
final relyingPartyServerProvider =
    Provider<RelyingPartyServer<RpRequest, RpResponse>>(
  (ref) => throw UnimplementedError('no instance of RelyingPartyServer'),
);

// Make the authentication service available throughout the app.
final passkeyAuthProvider = Provider<PasskeyAuth<RpRequest, RpResponse>>((ref) {
  final corbado = ref.watch(relyingPartyServerProvider);

  return PasskeyAuth(corbado);
});

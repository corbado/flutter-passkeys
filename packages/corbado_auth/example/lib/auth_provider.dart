import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Corbado SDK provider. This will be used by other providers to
// e.g. expose user state.
final corbadoProvider = Provider<CorbadoAuth>(
    (ref) => throw UnimplementedError("no instance of corbadoAuth"));

// Make the user available throughout the app.
final userProvider = StreamProvider<User?>((ref) async* {
  final corbado = ref.watch(corbadoProvider);
  await for (final value in corbado.userChanges) {
    yield value;
  }
});

// Make the auth state available throughout the app.
final authStateProvider = StreamProvider((ref) async* {
  final corbado = ref.watch(corbadoProvider);
  await for (final value in corbado.authStateChanges) {
    yield value;
  }
});

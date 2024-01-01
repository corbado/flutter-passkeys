import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:example/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Corbado SDK provider. This will be used by other providers to
// e.g. expose user state.
final corbadoAuthProvider = Provider<CorbadoAuthFirebase>(
    (ref) => throw UnimplementedError("no instance of corbadoAuth"));

// Make the authentication service available throughout the app.
final authServiceProvider = Provider<AuthService>((ref) {
  final corbadoAuth = ref.watch(corbadoAuthProvider);
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final user = ref.watch(userProvider);

  return AuthService(corbadoAuth, firebaseAuth, user.value);
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Make the user available throughout the app.
final userProvider = StreamProvider<User?>((ref) async* {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  await for (final value in firebaseAuth.userChanges()) {
    yield value;
  }
});

// Make the auth state available throughout the app.
final authStateProvider = StreamProvider((ref) async* {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  await for (final value in firebaseAuth.authStateChanges()) {
    yield value;
  }
});
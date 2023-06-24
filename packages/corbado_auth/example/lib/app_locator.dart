import 'package:corbado_auth_example/auth_service.dart';
import 'package:passkeys/backend/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

initLocator() {
  //final corbadoProjectID = const String.fromEnvironment('CORBADO_PROJECT_ID');
  final corbadoProjectID = 'pro-3320381079973729266';
  final passkeysAuth = PasskeyAuth(CorbadoPasskeyBackend(corbadoProjectID));

  getIt.registerSingleton<CorbadoAuth>(CorbadoAuth(passkeysAuth));
  getIt.registerSingleton<AuthService>(AuthService());
}

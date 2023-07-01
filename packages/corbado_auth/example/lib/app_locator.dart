import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

initLocator() {
  final corbadoProjectID = const String.fromEnvironment('CORBADO_PROJECT_ID');

  getIt.registerSingleton<CorbadoAuth>(CorbadoAuth(corbadoProjectID));
  getIt.registerSingleton<AuthService>(AuthService());
}

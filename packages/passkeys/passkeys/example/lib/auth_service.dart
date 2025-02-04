import 'package:passkeys/authenticator.dart';
import 'package:passkeys/availability.dart';
import 'package:passkeys_example/local_relying_party_server.dart';

class Configuration {
  Configuration({required this.name, this.timeout});

  final String name;
  final int? timeout;
}

List<Configuration> ANDROID_CONFIGURATIONS = [
  Configuration(name: 'Default'),
  Configuration(name: '5s Timeout', timeout: 5000),
];

class AuthService {
  AuthService({required this.rps, required this.authenticator});

  final LocalRelyingPartyServer rps;
  final PasskeyAuthenticator authenticator;

  Future<void> loginWithPasskey({required String email}) async {
    final rps1 =
        rps.startPasskeyLogin(name: email, configuration: loginConfiguration);
    final authenticatorRes = await authenticator.authenticate(rps1);
    rps.finishPasskeyLogin(response: authenticatorRes);
  }

  Future<void> loginWithPasskeyConditionalUI() async {
    final rps1 = rps.startPasskeyLoginConditionalU();
    final authenticatorRes = await authenticator.authenticate(rps1);
    rps.finishPasskeyLoginConditionalUI(response: authenticatorRes);
  }

  Future<void> signupWithPasskey({required String email}) async {
    final rps1 = rps.startPasskeyRegister(
        name: email, configuration: signUpConfiguration);
    final authenticatorRes = await authenticator.register(rps1);
    rps.finishPasskeyRegister(response: authenticatorRes);
  }

  GetAvailability getAvailability() {
    return authenticator.getAvailability();
  }

  // This is only related to testing and testing configurations.
  late final Configuration? signUpConfiguration;
  late final Configuration? loginConfiguration;

  void setSignupConfiguration(Configuration configuration) {
    signUpConfiguration = configuration;
  }

  void unsetSignupConfiguration() {
    signUpConfiguration = null;
  }

  void setLoginConfiguration(Configuration configuration) {
    loginConfiguration = configuration;
  }

  void unsetLoginConfiguration() {
    loginConfiguration = null;
  }
}

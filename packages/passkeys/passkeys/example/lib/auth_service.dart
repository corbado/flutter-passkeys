import 'package:passkeys/authenticator.dart';
import 'package:passkeys/availability.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_example/local_relying_party_server.dart';

class Configuration {
  Configuration(
      {required this.name,
      this.timeout,
      this.excludeCredentials,
      this.allowCredentials,
      this.preferImmediatelyAvailableCredentials});

  final String name;
  final int? timeout;
  final bool? excludeCredentials;
  final bool? allowCredentials;
  final bool? preferImmediatelyAvailableCredentials;
}

List<Configuration> SIGNUP_ANDROID_CONFIGURATIONS = [
  Configuration(name: 'Default'),
  Configuration(name: '5s Timeout', timeout: 5000),
  Configuration(name: 'ExcludeCredentials', excludeCredentials: true),
];

List<Configuration> SIGNUP_IOS_CONFIGURATIONS = [
  Configuration(name: 'Default'),
  Configuration(name: 'ExcludeCredentials', excludeCredentials: true),
];

List<Configuration> LOGIN_ANDROID_CONFIGURATIONS = [
  Configuration(name: 'Default'),
  Configuration(name: '5s Timeout', timeout: 5000),
  Configuration(name: 'AllowCredentials', allowCredentials: true),
  Configuration(
      name: 'PreferImmediatelyAvailableCredentials',
      preferImmediatelyAvailableCredentials: true,
      allowCredentials: true),
];

List<Configuration> LOGIN_IOS_CONFIGURATIONS = [
  Configuration(name: 'Default'),
  Configuration(
      name: 'AllowCredentials And PreferImmediatelyAvailableCredentials',
      allowCredentials: true,
      preferImmediatelyAvailableCredentials: true),
];

class AuthService {
  AuthService({required this.rps, required this.authenticator});

  final LocalRelyingPartyServer rps;
  final PasskeyAuthenticator authenticator;

  Future<void> loginWithPasskey({required String email}) async {
    final jsonRequestString =
        rps.startPasskeyLogin(name: email, configuration: loginConfiguration);

    final request = AuthenticateRequestType.fromJsonString(jsonRequestString);
    final authenticatorRes = await authenticator.authenticate(request);

    rps.finishPasskeyLogin(response: authenticatorRes.toJsonString());
  }

  Future<void> loginWithPasskeyConditionalUI() async {
    final jsonRequestString = rps.startPasskeyLoginConditionalU();

    final request = AuthenticateRequestType.fromJsonString(jsonRequestString);
    final authenticatorRes = await authenticator.authenticate(request);

    rps.finishPasskeyLoginConditionalUI(
        response: authenticatorRes.toJsonString());
  }

  Future<void> signupWithPasskey({required String email}) async {
    // Simulate backend API call - server returns JSON string
    final jsonRequestString = rps.startPasskeyRegister(
        name: email, configuration: signUpConfiguration);

    final request = RegisterRequestType.fromJsonString(jsonRequestString);
    final authenticatorRes = await authenticator.register(request);

    rps.finishPasskeyRegister(response: authenticatorRes.toJsonString());
  }

  GetAvailability getAvailability() {
    return authenticator.getAvailability();
  }

  // This is only related to testing and testing configurations.
  Configuration? signUpConfiguration = null;
  Configuration? loginConfiguration = null;

  void setSignupConfiguration(Configuration? configuration) {
    signUpConfiguration = configuration;
  }

  void setLoginConfiguration(Configuration? configuration) {
    loginConfiguration = configuration;
  }
}

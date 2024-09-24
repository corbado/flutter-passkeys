import 'package:passkeys/authenticator.dart';
import 'package:passkeys_example/local_relying_party_server.dart';

class AuthService {
  AuthService({required this.rps, required this.authenticator});

  final LocalRelyingPartyServer rps;
  final PasskeyAuthenticator authenticator;

  Future<void> loginWithPasskey({required String email}) async {
    final rps1 = rps.startPasskeyLogin(name: email);
    final authenticatorRes = await authenticator.authenticate(rps1);
    rps.finishPasskeyLogin(response: authenticatorRes);
  }

  Future<void> loginWithPasskeyConditionalUI() async {
    final rps1 = rps.startPasskeyLoginConditionalU();
    final authenticatorRes = await authenticator.authenticate(rps1);
    rps.finishPasskeyLoginConditionalUI(response: authenticatorRes);
  }

  Future<void> signupWithPasskey({required String email}) async {
    final rps1 = rps.startPasskeyRegister(name: email);
    final authenticatorRes = await authenticator.register(rps1);
    rps.finishPasskeyRegister(response: authenticatorRes);
  }
}

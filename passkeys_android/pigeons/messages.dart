import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.g.dart',
    javaOut: 'android/src/main/java/com/corbado/passkeys_android/Messages.java',
    javaOptions: JavaOptions(
      package: 'com.corbado.passkeys_android',
    ),
  ),
)
class RegisterResponse {
  const RegisterResponse({
    required this.responseJSON,
  });

  final String responseJSON;
}

class AuthenticateResponse {
  const AuthenticateResponse({
    required this.responseJSON,
  });

  final String responseJSON;
}

@HostApi()
abstract class PasskeysApi {
  bool canAuthenticate();

  @async
  RegisterResponse register(String options);

  @async
  AuthenticateResponse authenticate(String options);
}

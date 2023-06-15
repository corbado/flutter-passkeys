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
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
  });

  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;
}

class AuthenticateResponse {
  const AuthenticateResponse({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
  });

  final String id;
  final String rawId;
  final String clientDataJSON;
  final String authenticatorData;
  final String signature;
}

@HostApi()
abstract class PasskeysApi {
  @async
  bool canAuthenticate();

  @async
  RegisterResponse register(String options);

  @async
  AuthenticateResponse authenticate(String options);

  @async
  String getSignatureFingerprint();
}

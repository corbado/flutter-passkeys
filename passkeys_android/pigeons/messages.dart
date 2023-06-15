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
class RelyingParty {
  const RelyingParty(this.name, this.id);

  final String name;
  final String id;
}

class User {
  const User(this.displayName, this.name, this.id);
  final String displayName;
  final String name;
  final String id;
}

class AuthenticatorSelection {
  const AuthenticatorSelection(this.authenticatorAttachment,
      this.requireResidentKey, this.residentKey, this.userVerification);
  final String authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;
}

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
  RegisterResponse register(
    String challenge,
    RelyingParty relyingParty,
    User user,
    AuthenticatorSelection authenticatorSelection,
  );

  @async
  AuthenticateResponse authenticate(
    String relyingPartyId,
    String challenge,
  );

  @async
  String getSignatureFingerprint();
}

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

class PubKeyCredParam {
  const PubKeyCredParam(this.type, this.alg);
  final String type;
  final int alg;
}

class User {
  const User(this.displayName, this.name, this.id, {this.icon});
  final String displayName;
  final String name;
  final String id;
  final String? icon;
}

class AllowCredential {
  const AllowCredential(this.type, this.id, this.transports);
  final String type;
  final String id;
  final List<String?> transports;
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
    List<PubKeyCredParam>? pubKeyCredParams,
    int? timeout,
    String? attestation,
  );

  @async
  AuthenticateResponse authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredential>? allowCredentials,
  );

  @async
  String getFacetID();
}

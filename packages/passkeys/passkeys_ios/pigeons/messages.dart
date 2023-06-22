import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.g.dart',
    swiftOut: 'ios/Classes/messages.swift',
  ),
)
class RelyingParty {
  const RelyingParty(this.name, this.id);

  final String name;
  final String id;
}

class User {
  const User(this.name, this.id);

  final String name;
  final String id;
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
  bool canAuthenticate();

  @async
  RegisterResponse register(
    String challenge,
    RelyingParty relyingParty,
    User user,
  );

  @async
  AuthenticateResponse authenticate(
    String relyingPartyId,
    String challenge,
  );

  @async
  String getFacetID();
}

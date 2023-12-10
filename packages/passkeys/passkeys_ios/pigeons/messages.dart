import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.g.dart',
    swiftOut: 'ios/Classes/messages.swift',
  ),
)

/// Represents a relying party
class RelyingParty {
  /// Constructor
  const RelyingParty(this.name, this.id);

  /// Name of the relying party
  final String name;

  /// ID of the relying party
  final String id;
}

/// Represents a user
class User {
  /// Constructor
  const User(this.name, this.id);

  /// The name
  final String name;

  /// The ID
  final String id;
}

/// Represents a register response
class RegisterResponse {
  /// Constructor
  const RegisterResponse({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
  });

  /// The ID
  final String id;

  /// The raw ID
  final String rawId;

  /// The client data JSON
  final String clientDataJSON;

  /// The attestation object
  final String attestationObject;
}

/// Represents an authenticate response
class AuthenticateResponse {
  /// Constructor
  const AuthenticateResponse({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  /// The ID
  final String id;

  /// The raw ID
  final String rawId;

  /// The client data JSON
  final String clientDataJSON;

  /// The authenticator data
  final String authenticatorData;

  /// Signed challenge
  final String signature;

  final String userHandle;
}

@HostApi()
abstract class PasskeysApi {
  bool canAuthenticate();

  @async
  RegisterResponse register(String challenge,
      RelyingParty relyingParty,
      User user,);

  @async
  AuthenticateResponse authenticate(
      String relyingPartyId,
      String challenge,
      bool conditionalUI);

  @async
  void cancelCurrentAuthenticatorOperation();

  @async
  String getFacetID();
}

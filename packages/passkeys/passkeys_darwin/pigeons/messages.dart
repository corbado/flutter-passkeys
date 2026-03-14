import 'package:pigeon/pigeon.dart';

/// Represents a relying party
@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.g.dart',
    swiftOut: 'darwin/Classes/messages.swift',
  ),
)
class RelyingParty {
  /// Constructor
  const RelyingParty(this.name, this.id);

  /// Name of the relying party
  final String name;

  /// ID of the relying party
  final String id;
}

/// Represents a credential
class CredentialType {
  /// Constructor
  const CredentialType({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// The type of the credential.
  final String type;

  /// The ID of the credential.
  final String id;

  /// The transports of the credential.
  final List<String?> transports;
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
    required this.transports,
    this.clientExtensionResults = const {},
  });

  /// The ID
  final String id;

  /// The raw ID
  final String rawId;

  /// The client data JSON
  final String clientDataJSON;

  /// The attestation object
  final String attestationObject;

  /// The supported transports for the authenticator
  final List<String?> transports;

  /// The clientExtensionResults - PRF results
  final Map<String?, Object?>? clientExtensionResults;
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
    this.userHandle,
    this.clientExtensionResults = const {},
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

  final String? userHandle;

  /// The clientExtensionResults - PRF results
  final Map<String?, Object?>? clientExtensionResults;
}

@HostApi()
abstract class PasskeysApi {
  bool canAuthenticate();

  bool hasBiometrics();

  @async
  RegisterResponse register(
    String challenge,
    RelyingParty relyingParty,
    User user,
    List<CredentialType> excludeCredentials,
    List<int> pubKeyCredValues,
    bool canBePlatformAuthenticator,
    bool canBeSecurityKey,
    String? residentKeyPreference,
    String? attestationPreference,
    String? salt,
  );

  @async
  AuthenticateResponse authenticate(
    String relyingPartyId,
    String challenge,
    bool conditionalUI,
    List<CredentialType> allowedCredentials,
    bool preferImmediatelyAvailableCredentials,
    String? salt,
  );

  @async
  void cancelCurrentAuthenticatorOperation();
}

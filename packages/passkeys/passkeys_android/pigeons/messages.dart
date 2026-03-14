import 'package:pigeon/pigeon.dart';

/// Represents a relying party
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
  /// Constructor
  const RelyingParty(this.name, this.id);

  /// Name of the relying party
  final String name;

  /// ID of the relying party
  final String id;
}

/// Represents a public key credential parameter
class PubKeyCredParam {
  /// Constructor
  const PubKeyCredParam(this.type, this.alg);

  /// The type
  final String type;

  /// The algorithm
  final int alg;
}

/// Represents a user
class User {
  /// Constructor
  const User(this.displayName, this.name, this.id, {this.icon});

  /// The display name
  final String displayName;

  /// The name
  final String name;

  /// The ID
  final String id;

  /// The icon
  final String? icon;
}

/// Represents an allowed credential
class AllowCredential {
  /// Constructor
  const AllowCredential(this.type, this.id, this.transports);

  /// The type
  final String type;

  /// The ID
  final String id;

  /// The transports
  final List<String?> transports;
}

class ExcludeCredential {
  /// Constructor
  const ExcludeCredential(this.type, this.id);

  /// The type
  final String type;

  /// The ID
  final String id;
}

/// Represents an authenticator selection
class AuthenticatorSelection {
  /// Constructor
  const AuthenticatorSelection(this.authenticatorAttachment, this.requireResidentKey, this.residentKey, this.userVerification);

  /// The authenticator attachment
  final String? authenticatorAttachment;

  /// Whether a resident key is required
  final bool requireResidentKey;

  /// The resident key
  final String residentKey;

  /// The user verification
  final String userVerification;
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
    required this.userHandle,
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

  /// The signature
  final String signature;

  /// The userHandle
  final String userHandle;

  /// The clientExtensionResults - PRF results
  final Map<String?, Object?>? clientExtensionResults;
}

@HostApi()
abstract class PasskeysApi {
  @async
  bool canAuthenticate();

  @async
  bool hasPasskeySupport();

  @async
  RegisterResponse register(
    String challenge,
    RelyingParty relyingParty,
    User user,
    AuthenticatorSelection? authenticatorSelection,
    List<PubKeyCredParam>? pubKeyCredParams,
    int? timeout,
    String? attestation,
    List<ExcludeCredential> excludeCredentials,
    String? salt,
  );

  @async
  AuthenticateResponse authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredential>? allowCredentials,
    bool? preferImmediatelyAvailableCredentials,
    String? salt,
  );

  @async
  void cancelCurrentAuthenticatorOperation();
}

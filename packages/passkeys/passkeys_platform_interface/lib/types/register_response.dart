/// The [RegisterResponseType] represents the response from a WebAuthn
/// registration (credential creation) ceremony.
///
/// This class supports serialization to the standard WebAuthn JSON format
/// that server-side implementations expect.
class RegisterResponseType {
  /// Constructs a new instance.
  const RegisterResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
    required this.transports,
    this.publicKey,
    this.publicKeyAlgorithm,
    this.authenticatorData,
    this.authenticatorAttachment,
  });

  /// Constructs a new instance from a standard WebAuthn JSON map.
  ///
  /// This factory parses the JSON format that WebAuthn authenticators produce.
  factory RegisterResponseType.fromJson(Map<String, dynamic> json) {
    final response = json['response'] as Map<String, dynamic>;
    final transports = response['transports'] as List<dynamic>?;

    return RegisterResponseType(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      clientDataJSON: response['clientDataJSON'] as String,
      attestationObject: response['attestationObject'] as String,
      transports: transports?.map((e) => e as String?).toList() ?? [],
      publicKey: response['publicKey'] as String?,
      publicKeyAlgorithm: response['publicKeyAlgorithm'] as int?,
      authenticatorData: response['authenticatorData'] as String?,
      authenticatorAttachment: json['authenticatorAttachment'] as String?,
    );
  }

  /// The Base64URL encoded credential ID.
  final String id;

  /// The Base64URL encoded raw credential ID.
  final String rawId;

  /// The Base64URL encoded client data JSON.
  final String clientDataJSON;

  /// The Base64URL encoded attestation object.
  final String attestationObject;

  /// The transports that the authenticator supports.
  final List<String?> transports;

  /// The Base64URL encoded public key (optional, from getPublicKey()).
  final String? publicKey;

  /// The COSE algorithm identifier for the public key (optional).
  final int? publicKeyAlgorithm;

  /// The Base64URL encoded authenticator data (optional, from getAuthenticatorData()).
  final String? authenticatorData;

  /// The authenticator attachment modality (e.g., "platform", "cross-platform").
  final String? authenticatorAttachment;

  /// Converts this instance to the standard WebAuthn JSON format.
  ///
  /// The output follows the `RegistrationResponseJSON` format from the WebAuthn spec,
  /// which is what server-side implementations expect.
  ///
  /// Output structure:
  /// ```json
  /// {
  ///   "id": "base64url...",
  ///   "rawId": "base64url...",
  ///   "type": "public-key",
  ///   "response": {
  ///     "clientDataJSON": "base64url...",
  ///     "attestationObject": "base64url...",
  ///     "transports": ["internal"]
  ///   },
  ///   "clientExtensionResults": {},
  ///   "authenticatorAttachment": "platform"
  /// }
  /// ```
  Map<String, dynamic> toJson() {
    final response = <String, dynamic>{
      'clientDataJSON': clientDataJSON,
      'attestationObject': attestationObject,
    };

    // Only include non-null transports
    final nonNullTransports = transports.whereType<String>().toList();
    if (nonNullTransports.isNotEmpty) {
      response['transports'] = nonNullTransports;
    }

    // Include optional response fields if available
    if (publicKey != null) response['publicKey'] = publicKey;
    if (publicKeyAlgorithm != null) {
      response['publicKeyAlgorithm'] = publicKeyAlgorithm;
    }
    if (authenticatorData != null) {
      response['authenticatorData'] = authenticatorData;
    }

    final result = <String, dynamic>{
      'id': id,
      'rawId': rawId,
      'type': 'public-key',
      'response': response,
      'clientExtensionResults': <String, dynamic>{},
    };

    if (authenticatorAttachment != null) {
      result['authenticatorAttachment'] = authenticatorAttachment;
    }

    return result;
  }
}

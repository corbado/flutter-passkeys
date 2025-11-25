/// The [AuthenticateResponseType] represents the response from a WebAuthn
/// authentication (assertion) ceremony.
///
/// This class supports serialization to the standard WebAuthn JSON format
/// that server-side implementations expect.
class AuthenticateResponseType {
  /// Constructs a new instance.
  const AuthenticateResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
    this.authenticatorAttachment,
  });

  /// Constructs a new instance from a standard WebAuthn JSON map.
  ///
  /// This factory parses the JSON format that WebAuthn authenticators produce.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "id": "base64url...",
  ///   "rawId": "base64url...",
  ///   "type": "public-key",
  ///   "response": {
  ///     "clientDataJSON": "base64url...",
  ///     "authenticatorData": "base64url...",
  ///     "signature": "base64url...",
  ///     "userHandle": "base64url..."
  ///   },
  ///   "clientExtensionResults": {},
  ///   "authenticatorAttachment": "platform"
  /// }
  /// ```
  factory AuthenticateResponseType.fromJson(Map<String, dynamic> json) {
    // Support both flat format (legacy) and nested format (standard WebAuthn)
    if (json.containsKey('response')) {
      final response = json['response'] as Map<String, dynamic>;
      return AuthenticateResponseType(
        id: json['id'] as String,
        rawId: json['rawId'] as String,
        clientDataJSON: response['clientDataJSON'] as String,
        authenticatorData: response['authenticatorData'] as String,
        signature: response['signature'] as String,
        userHandle: (response['userHandle'] as String?) ?? '',
        authenticatorAttachment: json['authenticatorAttachment'] as String?,
      );
    }

    // Legacy flat format
    return AuthenticateResponseType(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      clientDataJSON: json['clientDataJSON'] as String,
      authenticatorData: json['authenticatorData'] as String,
      signature: json['signature'] as String,
      userHandle: (json['userHandle'] as String?) ?? '',
      authenticatorAttachment: json['authenticatorAttachment'] as String?,
    );
  }

  /// The Base64URL encoded credential ID.
  final String id;

  /// The Base64URL encoded raw credential ID.
  final String rawId;

  /// The Base64URL encoded client data JSON.
  final String clientDataJSON;

  /// The Base64URL encoded authenticator data.
  final String authenticatorData;

  /// The Base64URL encoded signature.
  final String signature;

  /// The Base64URL encoded user handle. Can be empty if the user handle is not available.
  final String userHandle;

  /// The authenticator attachment modality (e.g., "platform", "cross-platform").
  final String? authenticatorAttachment;

  /// Converts this instance to the standard WebAuthn JSON format.
  ///
  /// The output follows the `AuthenticationResponseJSON` format from the WebAuthn spec,
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
  ///     "authenticatorData": "base64url...",
  ///     "signature": "base64url...",
  ///     "userHandle": "base64url..."
  ///   },
  ///   "clientExtensionResults": {},
  ///   "authenticatorAttachment": "platform"
  /// }
  /// ```
  Map<String, dynamic> toJson() {
    final response = <String, dynamic>{
      'clientDataJSON': clientDataJSON,
      'authenticatorData': authenticatorData,
      'signature': signature,
    };

    // Only include userHandle if it's not empty
    if (userHandle.isNotEmpty) {
      response['userHandle'] = userHandle;
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

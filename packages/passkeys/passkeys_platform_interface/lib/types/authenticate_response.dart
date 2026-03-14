import 'dart:convert';

class AuthenticateResponseType {
  /// Constructs a new instance.
  const AuthenticateResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
    this.clientExtensionResults,
  });

  /// Constructs a new instance from a JSON string.
  factory AuthenticateResponseType.fromJsonString(String jsonString) {
    final decoded = jsonDecode(jsonString);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('Expected JSON object, got ${decoded.runtimeType}');
    }
    return AuthenticateResponseType.fromJson(decoded);
  }

  /// Constructs a new instance from a JSON map.
  ///
  /// Supports both flat format (legacy) and nested format (standard WebAuthn).
  factory AuthenticateResponseType.fromJson(Map<String, dynamic> json) {
    // Check if it's the nested WebAuthn format with 'response' object
    if (json.containsKey('response')) {
      final response = json['response'];
      if (response is! Map<String, dynamic>) {
        throw FormatException('Expected "response" to be a Map, got ${response.runtimeType}');
      }
      return AuthenticateResponseType(
        id: json['id'] as String? ?? '',
        rawId: json['rawId'] as String? ?? '',
        clientDataJSON: response['clientDataJSON'] as String? ?? '',
        authenticatorData: response['authenticatorData'] as String? ?? '',
        signature: response['signature'] as String? ?? '',
        userHandle: (response['userHandle'] as String?) ?? '',
        clientExtensionResults: json['clientExtensionResults'] as Map<String, Object>?,
      );
    }

    // Legacy flat format
    return AuthenticateResponseType(
      id: json['id'] as String? ?? '',
      rawId: json['rawId'] as String? ?? '',
      clientDataJSON: json['clientDataJSON'] as String? ?? '',
      authenticatorData: json['authenticatorData'] as String? ?? '',
      signature: json['signature'] as String? ?? '',
      userHandle: (json['userHandle'] as String?) ?? '',
      clientExtensionResults: json['clientExtensionResults'] as Map<String, Object>?,
    );
  }

  /// The ID of the credential.
  final String id;

  /// The raw ID of the credential.
  final String rawId;

  /// The client data JSON.
  final String clientDataJSON;

  /// The authenticator data.
  final String authenticatorData;

  /// The signature.
  final String signature;

  /// The user handle. Can be empty if the user handle is not available.
  final String userHandle;

  /// Optional client extension results.
  final Map<String?, Object?>? clientExtensionResults;

  /// Converts this instance to a JSON string.
  String toJsonString() => jsonEncode(toJson());

  /// Converts this instance to a JSON map.
  ///
  /// Output follows the standard WebAuthn format with nested 'response' object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic>? sanitizedExtensions;

    final response = <String, dynamic>{'clientDataJSON': clientDataJSON, 'authenticatorData': authenticatorData, 'signature': signature};

    // Only include userHandle if it's not empty
    if (userHandle.isNotEmpty) {
      response['userHandle'] = userHandle;
    }

    if (clientExtensionResults != null) {
      sanitizedExtensions = {};

      final prf = clientExtensionResults?['prf'] as Map?;
      final results = prf?['results'] as Map?;

      if (results != null) {
        sanitizedExtensions['prf'] = {
          'results': {'first': ''},
        };
      }
    }

    return {'id': id, 'rawId': rawId, 'type': 'public-key', 'response': response, 'clientExtensionResults': sanitizedExtensions ?? <String, dynamic>{}};
  }
}

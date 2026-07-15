import 'dart:convert';

class RegisterResponseType {
  const RegisterResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
    required this.transports,
    this.clientExtensionResults,
  });

  /// Constructs a new instance from a JSON string.
  factory RegisterResponseType.fromJsonString(String jsonString) {
    final decoded = jsonDecode(jsonString);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('Expected JSON object, got ${decoded.runtimeType}');
    }
    return RegisterResponseType.fromJson(decoded);
  }

  /// Constructs a new instance from a JSON map.
  factory RegisterResponseType.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    if (response is! Map<String, dynamic>) {
      throw FormatException(
        'Expected "response" to be a Map, got ${response.runtimeType}',
      );
    }
    final transports = response['transports'] as List<dynamic>?;

    return RegisterResponseType(
      id: json['id'] as String? ?? '',
      rawId: json['rawId'] as String? ?? '',
      clientDataJSON: response['clientDataJSON'] as String? ?? '',
      attestationObject: response['attestationObject'] as String? ?? '',
      transports: transports?.map((e) => e as String?).toList() ?? [],
      clientExtensionResults:
          json['clientExtensionResults'] as Map<String, dynamic>?,
    );
  }
  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;
  final List<String?> transports;

  /// Raw WebAuthn client extension results, including the on-device PRF output.
  final Map<String?, Object?>? clientExtensionResults;

  /// Converts this instance to a JSON string.
  String toJsonString() => jsonEncode(toJson());

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() {
    final response = <String, dynamic>{
      'clientDataJSON': clientDataJSON,
      'attestationObject': attestationObject,
    };

    final nonNullTransports = transports.whereType<String>().toList();
    if (nonNullTransports.isNotEmpty) {
      response['transports'] = nonNullTransports;
    }

    return {
      'id': id,
      'rawId': rawId,
      'type': 'public-key',
      'response': response,
      'clientExtensionResults': <String, dynamic>{
        if (clientExtensionResults?['prf'] is Map) 'prf': {'enabled': true},
      },
    };
  }
}

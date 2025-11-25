import 'dart:convert';

class RegisterResponseType {
  const RegisterResponseType({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
    required this.transports,
  });

  /// Constructs a new instance from a JSON string.
  factory RegisterResponseType.fromJsonString(String jsonString) =>
      RegisterResponseType.fromJson(
          jsonDecode(jsonString) as Map<String, dynamic>);

  /// Constructs a new instance from a JSON map.
  factory RegisterResponseType.fromJson(Map<String, dynamic> json) {
    final response = json['response'] as Map<String, dynamic>;
    final transports = response['transports'] as List<dynamic>?;

    return RegisterResponseType(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      clientDataJSON: response['clientDataJSON'] as String,
      attestationObject: response['attestationObject'] as String,
      transports: transports?.map((e) => e as String?).toList() ?? [],
    );
  }

  final String id;
  final String rawId;
  final String clientDataJSON;
  final String attestationObject;
  final List<String?> transports;

  /// Converts this instance to a JSON string.
  String toJsonString() => jsonEncode(toJson());

  /// Converts this instance to a JSON map.
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

    return {
      'id': id,
      'rawId': rawId,
      'type': 'public-key',
      'response': response,
      'clientExtensionResults': <String, dynamic>{},
    };
  }
}

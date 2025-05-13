import 'dart:convert';

class TelemetryEventRequest {
  String? payload;
  String? sdkVersion;
  String? sdkName;
  String identifier;
  String type;

  TelemetryEventRequest({
    this.payload,
    this.sdkVersion,
    this.sdkName,
    required this.identifier,
    required this.type,
  });

  String toJsonString() {
    return jsonEncode({
      'payload': payload,
      'sdkVersion': sdkVersion,
      'sdkName': sdkName,
      'identifier': identifier,
      'type': type,
    });
  }
}

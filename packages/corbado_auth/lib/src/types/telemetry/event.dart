import 'dart:convert';

class TelemetryEventPayload {
  final String event;
  final Map<String, dynamic> data;

  TelemetryEventPayload({
    required this.event,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'data': data,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}

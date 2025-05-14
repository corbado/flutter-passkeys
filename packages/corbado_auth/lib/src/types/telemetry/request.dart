import 'dart:convert';

import 'package:corbado_auth/src/types/telemetry/event.dart';

class TelemetryEventRequest {
  Map<String, dynamic>? payload;
  String? sdkVersion;
  String? sdkName;
  String identifier;
  TelemetryEventType type;

  TelemetryEventRequest({
    this.payload,
    this.sdkVersion,
    this.sdkName,
    required this.identifier,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'identifier': identifier,
      'type': type.toString(),
    };

    if (payload != null)   map['payload']    = payload;
    if (sdkVersion != null) map['sdkVersion'] = sdkVersion;
    if (sdkName != null)    map['sdkName']    = sdkName;

    return map;
  }

  String toJsonString() => jsonEncode(toJson());
}

import 'package:http/http.dart' as http;

import 'types/types.dart';

const String basePath = "https://telemetry.cloud.corbado.io/v1/";
const String endpoint = "telemetryEvents";
const Duration timeout = Duration(milliseconds: 500);

class CorbadoTelemetry {
  final String sdkVersion;
  final String sdkName;
  final String projectId;
  final bool? debugMode;

  CorbadoTelemetry({
    required this.sdkVersion,
    required this.sdkName,
    required this.projectId,
    this.debugMode,
  });

  Future<void> sendEvent({
    required TelemetryEventType type,
    Map<String, dynamic>? payload,
  }) async {
    final request = TelemetryEventRequest(
      type: type,
      sdkVersion: sdkVersion,
      sdkName: sdkName,
      identifier: projectId,
      payload: payload,
    );

    final uri = Uri.parse(basePath + endpoint);

    try {
      await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: request.toJsonString(),
          )
          .timeout(timeout);
    } catch (_) {}
  }
}

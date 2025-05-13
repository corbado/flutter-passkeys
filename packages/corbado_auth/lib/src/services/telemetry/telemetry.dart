import 'package:corbado_auth/src/types/telemetry/event.dart';
import 'package:corbado_auth/src/types/telemetry/request.dart';
import 'package:http/http.dart' as http;

const String sdkVersion = "3.6.0";
const String sdkName = "@corbado/corbado_auth";
const String basePath = "https://app.corbado-dev.com/v1/";
const String endpoint = "telemetryEvents";

class TelemetryService {
  String projectId;
  bool isEnabled;
  bool? debugMode;

  TelemetryService(
      {required this.projectId,
      required this.isEnabled,
      this.debugMode = false}) {
    if (isEnabled) {
      print("Telemetry service is enabled");
    }
  }

  void printDebug(String message) {
    if (debugMode == true) {
      print("$message");
    }
  }

  void logEvent(TelemetryEventPayload event) {
    if (isEnabled) {
      // Log the event to your telemetry system
      printDebug("Logging event: $event");
      _sendEvent(event);
    }
  }

  Future<void> _sendEvent(TelemetryEventPayload event) async {
    final request = TelemetryEventRequest(
      type: 'type-1',
      payload: event.toJsonString(),
      sdkVersion: sdkVersion,
      sdkName: sdkName,
      identifier: projectId,
    );

    final uri = Uri.parse(basePath + endpoint);

    await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: request.toJsonString(),
    );
  }
}

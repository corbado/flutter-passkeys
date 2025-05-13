import 'package:corbado_auth/src/types/telemetry/event.dart';
import 'package:corbado_auth/src/types/telemetry/request.dart';
import 'package:http/http.dart' as http;

const String sdkVersion = "3.6.0";
const String sdkName = "@corbado/corbado_auth";
const String basePath = "https://app.corbado-dev.com/v1/";
const String endpoint = "telemetryEvents";

class TelemetryService {
  TelemetryService._internal({
    required this.projectId,
    required this.isEnabled,
    this.debugMode = false,
  }) {
    if (isEnabled) {
      print("Telemetry service is enabled");
    }
  }

  static TelemetryService? _instance;

  static void init({
    required String projectId,
    required bool isEnabled,
    bool? debugMode = false,
  }) {
    if (_instance != null) {
      throw StateError('TelemetryService.init() was already called.');
    }
    _instance = TelemetryService._internal(
      projectId: projectId,
      isEnabled: isEnabled,
      debugMode: debugMode ?? false,
    );
  }

  static TelemetryService get instance {
    if (_instance == null) {
      throw StateError('TelemetryService.init() must be called first.');
    }
    return _instance!;
  }

  final String projectId;
  final bool isEnabled;
  final bool debugMode;

  void printDebug(String message) {
    if (debugMode) {
      print(message);
    }
  }

  void logEvent(TelemetryEventPayload event) {
    if (isEnabled) {
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
      headers: {'Content-Type': 'application/json'},
      body: request.toJsonString(),
    );
  }
}

import 'dart:io';

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
    if (isEnabled && debugMode) {
      print(
          "Telemetry service is enabled, Check out the docs for more information.");
    }
  }

  static TelemetryService? _instance;

  static void init({
    required String projectId,
    bool? isEnabled = true,
    bool? debugMode = false,
  }) {
    if (_instance != null) {
      throw StateError('TelemetryService.init() was already called.');
    }
    _instance = TelemetryService._internal(
      projectId: projectId,
      isEnabled: isEnabled ?? false,
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

  void _printDebug(String message) {
    if (debugMode) {
      print(message);
    }
  }

  void logMethodCalled(String methodName, String screenName) {
    if (isEnabled) {
      _printDebug(
          'Logging Method_Called event: $methodName called on $screenName');

      final payload = {
        'methodName': methodName,
        'screenName': screenName,
      };

      _sendEvent(type: TelemetryEventType.METHOD_CALLED, payload: payload);
    }
  }

  void logPackageMetadata(bool debugMode) {
    if (isEnabled) {
      _printDebug('Logging Package_Metadata event');

      final payload = {
        'dartSDKVersion': Platform.version,
        'isDoctorEnabled': debugMode,
      };

      _sendEvent(type: TelemetryEventType.PACKAGE_METADATA, payload: payload);
    }
  }

  Future<void> _sendEvent(
      {required TelemetryEventType type, Map<String, dynamic>? payload}) async {
    final request = TelemetryEventRequest(
      type: type,
      sdkVersion: sdkVersion,
      sdkName: sdkName,
      identifier: projectId,
      payload: payload,
    );

    if (debugMode) {
      print('Telemetry request: ${request.toJsonString()}');
      return;
    }

    final uri = Uri.parse(basePath + endpoint);

    await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: request.toJsonString(),
    );
  }
}

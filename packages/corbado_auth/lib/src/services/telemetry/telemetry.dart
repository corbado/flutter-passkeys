import 'dart:io';

import 'package:corbado_telemetry_api_client/corbado_telemetry_api_client.dart';
import 'package:flutter/foundation.dart';

const String sdkVersion = "3.7.1";
const String sdkName = "Flutter SDK";

// The TelemetryService manages the collection of telemetry events and
// is enabled by default. It can be disabled by setting isEnabled=false
// during initialization (see init() method).
//
// For more details, please refer to our telemetry documentation
// at https://docs.corbado.com/corbado-complete/other/telemetry.

class TelemetryService {
  TelemetryService._internal({
    required this.projectId,
    required this.isEnabled,
    required this.isDoctorEnabled,
    required this.api,
    this.debugMode = false,
  });

  static TelemetryService? _instance;

  static void init({
    required String projectId,
    bool? isEnabled = true,
    bool? debugMode = false,
    required bool isDoctorEnabled,
  }) {
    if (_instance != null) {
      throw StateError('TelemetryService.init() was already called.');
    }

    final corbadoTelemetry = CorbadoTelemetryApiClient(
      sdkVersion: sdkVersion,
      sdkName: sdkName,
      projectId: projectId,
      debugMode: debugMode,
    );

    _instance = TelemetryService._internal(
      projectId: projectId,
      isEnabled: isEnabled ?? false,
      debugMode: debugMode ?? false,
      isDoctorEnabled: isDoctorEnabled,
      api: corbadoTelemetry,
    );
  }

  static TelemetryService get instance {
    if (_instance == null) {
      throw StateError('TelemetryService.init() must be called first.');
    }
    return _instance!;
  }

  final String projectId;
  bool isEnabled;
  final bool debugMode;
  final bool isDoctorEnabled;
  bool telemetryPacketMetadataSent = false;
  final CorbadoTelemetryApiClient api;

  void logMethodCalled(String methodName, String screenName) {
    if (!isEnabled) {
      return;
    }

    final payload = {
      'methodName': methodName,
      'screenName': screenName,
    };

    api.sendEvent(type: TelemetryEventType.METHOD_CALLED, payload: payload);
  }

  void disableTelemetry() {
    this.isEnabled = false;
  }

  void logPackageMetadata() {
    if (!isEnabled || telemetryPacketMetadataSent) {
      return;
    }

    final payload = {
      'dartSDKVersion': kIsWeb ? 'Flutter web' : Platform.version,
      'isDoctorEnabled': isDoctorEnabled,
    };

    api.sendEvent(type: TelemetryEventType.PACKAGE_METADATA, payload: payload);

    telemetryPacketMetadataSent = true;
  }
}

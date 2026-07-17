import 'dart:io';

import 'package:corbado_auth/src/version.dart';
import 'package:corbado_telemetry_api_client/corbado_telemetry_api_client.dart';
import 'package:flutter/foundation.dart';

// The TelemetryService manages the collection of telemetry events and
// is enabled by default. It can be disabled by setting isEnabled=false
// during initialization (see init() method).
//
// For more details, please refer to our telemetry documentation
// at https://docs.corbado.com/corbado-complete/other/telemetry.

/// Collects and sends telemetry events for the Corbado SDK.
class TelemetryService {
  TelemetryService._internal({
    required this.projectId,
    required this.isEnabled,
    required this.isDoctorEnabled,
    required this.api,
    this.debugMode = false,
  });

  static TelemetryService? _instance;

  /// Initializes the singleton [TelemetryService]. Must be called once.
  static void init({
    required String projectId,
    required bool isDoctorEnabled,
    bool? isEnabled = true,
    bool? debugMode = false,
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

  /// Returns the singleton instance. Throws if [init] has not been called.
  static TelemetryService get instance {
    if (_instance == null) {
      throw StateError('TelemetryService.init() must be called first.');
    }
    return _instance!;
  }

  /// The Corbado project id.
  final String projectId;

  /// Whether telemetry collection is currently enabled.
  bool isEnabled;

  /// Whether the telemetry API client runs in debug mode.
  final bool debugMode;

  /// Whether the Corbado doctor is enabled.
  final bool isDoctorEnabled;

  /// Whether the package metadata event has already been sent.
  bool telemetryPacketMetadataSent = false;

  /// The client used to send telemetry events.
  final CorbadoTelemetryApiClient api;

  /// Logs that a method was called on a given screen.
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

  /// Disables telemetry collection.
  void disableTelemetry() {
    isEnabled = false;
  }

  /// Logs package metadata once per session.
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

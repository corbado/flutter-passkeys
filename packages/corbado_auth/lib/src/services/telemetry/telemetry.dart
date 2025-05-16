import 'dart:io';

import 'package:corbado_auth/src/types/telemetry/event.dart';
import 'package:corbado_auth/src/types/telemetry/request.dart';
import 'package:http/io_client.dart';

const String sdkVersion = "3.6.0";
const String sdkName = "@corbado/corbado_auth";
const String basePath = "https://app.corbado-dev.com/v1/";
const String endpoint = "telemetryEvents";
const Duration timeout = Duration(seconds: 2);

class TelemetryService {
  TelemetryService._internal({
    required this.projectId,
    required this.isEnabled,
    required this.isDoctorEnabled,
    this.debugMode = false,
  });

  static TelemetryService? _instance;

  static void init({
    required String projectId,
    required bool isDoctorEnabled,
    bool? debugMode = false,
  }) {
    if (_instance != null) {
      throw StateError('TelemetryService.init() was already called.');
    }
    _instance = TelemetryService._internal(
      projectId: projectId,
      isEnabled: false,
      debugMode: debugMode ?? false,
      isDoctorEnabled: isDoctorEnabled,
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

  void logMethodCalled(String methodName, String screenName) {
    if (!isEnabled) {
      return;
    }

    final payload = {
      'methodName': methodName,
      'screenName': screenName,
    };

    _sendEvent(type: TelemetryEventType.METHOD_CALLED, payload: payload);
  }

  void toggleTelemetry(bool isEnabled) {
    this.isEnabled = isEnabled;
  }

  void logPackageMetadata() {
    if (!isEnabled || telemetryPacketMetadataSent) {
      return;
    }

    final payload = {
      'dartSDKVersion': Platform.version,
      'isDoctorEnabled': isDoctorEnabled,
    };

    _sendEvent(type: TelemetryEventType.PACKAGE_METADATA, payload: payload);

    telemetryPacketMetadataSent = true;
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

    final ioClient = IOClient(
      HttpClient()..connectionTimeout = timeout,
    );

    try {
      await ioClient
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: request.toJsonString(),
          )
          .timeout(timeout);
    } catch (_) {
    } finally {
      ioClient.close();
    }
  }
}

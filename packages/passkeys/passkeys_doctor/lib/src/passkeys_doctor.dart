import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:passkeys_doctor/src/checks.dart';
import 'package:passkeys_doctor/src/logger.dart';
import 'package:passkeys_doctor/src/web_script_check.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

import '../passkeys_doctor.dart';
import 'messages.g.dart';

class PasskeysDoctor {
  PasskeysDoctor() : _platform = PasskeysPlatform.instance {
    _logger = Logger(_streamController.stream.distinct());

    _checkpoints.addListener(() {
      _streamController.add(
        Result(
          checkpoints: _checkpoints.value,
          exception: _lastException.value,
        ),
      );
    });

    _lastException.addListener(() {
      if (_lastException.value == null) {
        return;
      }

      _streamController.add(
        Result(
          checkpoints: _checkpoints.value,
          exception: _lastException.value,
        ),
      );

      _lastException.value = null;
    });
  }

  final PasskeysPlatform _platform;
  final WebCredentialsApi _api = WebCredentialsApi();
  late final Logger _logger;

  final ValueNotifier<PlatformException?> _lastException = ValueNotifier(null);
  final ValueNotifier<List<Checkpoint>> _checkpoints = ValueNotifier([]);
  final StreamController<Result> _streamController =
      StreamController<Result>.broadcast();

  Stream<Result> get resultStream => _streamController.stream;

  void recordException(PlatformException exception) {
    if (exception.code == 'suppressed') {
      return;
    }

    _lastException.value = exception;
  }

  Future<void> check(String rpId) async {
    final checkpoints = <Checkpoint>[];

    try {
      if (kIsWeb) {
        checkpoints.add(checkRpidValue(rpId, hostname: Uri.base.host));
        checkpoints.add(_checkWebScript());
      } else {
        checkpoints.add(checkRpidValue(rpId));

        if (Platform.isIOS || Platform.isMacOS) {
          if (Platform.isIOS) {
            final iosAvailability =
                (await _platform.getAvailability()) as AvailabilityTypeIOS;
            final iosCheck = await _checkIosAvailability(iosAvailability);
            if (iosCheck != null) {
              checkpoints.add(iosCheck);
            }
          }
          checkpoints.add(await _checkAASAFile(rpId));
        } else if (Platform.isAndroid) {
          checkpoints.add(await _checkAssetLinks(rpId));
        } else if (Platform.isWindows) {
          checkpoints.add(await _checkWindows());
        }
      }
    } on DoctorException catch (e) {
      // If a DoctorException is thrown, it means that the blocking checkpoint
      // is failing. We add it to the list of checkpoints and return it.
      checkpoints.add(e.blockingCheckpoint);
    }

    _checkpoints.value = checkpoints;
  }

  Checkpoint _checkWebScript() {
    if (isPasskeysWebScriptLoaded()) {
      return Checkpoint(
        name: 'Passkeys JS script check',
        description: 'The passkeys web SDK (bundle.js) is loaded.',
        type: CheckpointType.success,
      );
    }

    return Checkpoint(
      name: 'Passkeys JS script check',
      description:
          'The passkeys web SDK (bundle.js) is not loaded. Include it in your '
          'index.html. Releases: '
          'https://github.com/corbado/flutter-passkeys/releases',
      type: CheckpointType.error,
      documentationLink: DocLinks.flutterIntegration,
    );
  }

  Future<Checkpoint> _checkAASAFile(String rpid) async {
    final uri = Uri.parse(
      'https://$rpid/.well-known/apple-app-site-association',
    );

    http.Response response;
    try {
      response = await http.get(uri).timeout(const Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'AASA file check',
        description: 'Failed to fetch $uri: $e',
        type: CheckpointType.error,
        documentationLink: DocLinks.ios,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'AASA file check',
        description: '$uri not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
        documentationLink: DocLinks.ios,
      );
    }

    final contentType = response.headers['content-type'];
    if (contentType == null ||
        !contentType.toLowerCase().startsWith('application/json')) {
      return Checkpoint(
        name: 'AASA file check',
        description:
            '$uri does not return valid "Content-Type" header: expected "application/json" but received "${contentType ?? 'none'}".',
        type: CheckpointType.error,
        documentationLink: DocLinks.ios,
      );
    }

    Map<String, dynamic> jsonBody;
    try {
      jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'AASA file check',
        description: '$uri does not return valid JSON: $e',
        type: CheckpointType.error,
        documentationLink: DocLinks.ios,
      );
    }

    final bundleId = await _getBundleId();

    return evaluateAasa(uri, jsonBody, bundleId);
  }

  Future<Checkpoint> _checkAssetLinks(String rpid) async {
    final uri = Uri.parse('https://$rpid/.well-known/assetlinks.json');

    http.Response response;
    try {
      response = await http.get(uri).timeout(const Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'Asset link file check',
        description: 'Failed to fetch $uri: $e',
        type: CheckpointType.error,
        documentationLink: DocLinks.android,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'Asset link file check',
        description: '$uri not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
        documentationLink: DocLinks.android,
      );
    }

    final contentType = response.headers['content-type'];
    if (contentType == null ||
        !contentType.toLowerCase().startsWith('application/json')) {
      return Checkpoint(
        name: 'Asset link file check',
        description:
            '$uri does not return valid "Content-Type" header: expected "application/json" but received "${contentType ?? 'none'}".',
        type: CheckpointType.error,
        documentationLink: DocLinks.android,
      );
    }

    List<dynamic> entries;
    try {
      entries = jsonDecode(response.body) as List<dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'Asset link file check',
        description: '$uri does not return valid JSON: $e',
        type: CheckpointType.error,
        documentationLink: DocLinks.android,
      );
    }

    final expectedPackage = await _getBundleId();
    final expectedFingerprints = await _getFingerprints();

    return evaluateAssetLinks(
      uri,
      entries,
      package: expectedPackage,
      fingerprints: expectedFingerprints,
      rpid: rpid,
    );
  }

  Future<Checkpoint?> _checkIosAvailability(
    AvailabilityTypeIOS iosAvailability,
  ) async {
    final info = await DeviceInfoPlugin().iosInfo;

    if (!iosAvailability.hasBiometrics && !info.isPhysicalDevice) {
      return Checkpoint(
        name: 'iOS Biometrics Check',
        description:
            'FaceID/TouchID is not enabled on your simulator. Please enable it in the simulator settings "Features > Face ID/Touch ID > Enable".',
        type: CheckpointType.error,
        documentationLink: DocLinks.ios,
      );
    }

    return null;
  }

  Future<Checkpoint> _checkWindows() async {
    // Windows 10 version 1903 (build 18362) is the first release exposing the
    // WebAuthn platform API used for passkeys.
    const minWebAuthnBuild = 18362;
    final info = await DeviceInfoPlugin().windowsInfo;

    if (info.buildNumber < minWebAuthnBuild) {
      return Checkpoint(
        name: 'Windows version check',
        description:
            'Windows build ${info.buildNumber} does not support the WebAuthn '
            'platform API (requires Windows 10 version 1903 / build 18362 or '
            'newer).',
        type: CheckpointType.error,
        documentationLink: DocLinks.flutterIntegration,
      );
    }

    return Checkpoint(
      name: 'Windows version check',
      description:
          'Windows build ${info.buildNumber} supports the WebAuthn platform '
          'API.',
      type: CheckpointType.success,
    );
  }

  Future<String> _getBundleId() async {
    final info = await PackageInfo.fromPlatform();

    return info.packageName;
  }

  Future<List<String>> _getFingerprints() async {
    final fingerprints = await _api.getFingerprints();

    return fingerprints;
  }

  Future<void> dispose() async {
    await _logger.dispose();
    await _streamController.close();
    _lastException.dispose();
    _checkpoints.dispose();
  }
}

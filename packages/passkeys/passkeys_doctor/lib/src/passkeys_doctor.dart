import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:passkeys_doctor/src/logger.dart';
import 'package:passkeys_platform_interface/types/types.dart';

import '../passkeys_doctor.dart';
import 'messages.g.dart';

class PasskeysDoctor {
  late Logger _logger;

  PasskeysDoctor() {
    _logger = Logger(_streamController.stream.distinct());

    _checkpoints.addListener(
      () {
        _streamController.add(
          Result(
            checkpoints: _checkpoints.value,
            exception: _lastException.value,
          ),
        );
      },
    );

    _lastException.addListener(
      () {
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
      },
    );
  }

  final WebCredentialsApi _api = WebCredentialsApi();

  final ValueNotifier<PlatformException?> _lastException = ValueNotifier(null);
  final ValueNotifier<List<Checkpoint>> _checkpoints = ValueNotifier([]);
  final StreamController<Result> _streamController =
      StreamController<Result>.broadcast();

  Stream<Result> get resultStream => _streamController.stream;

  recordException(PlatformException exception) {
    _lastException.value = exception;
  }

  check(String rpId, Future<AvailabilityTypeIOS> iosAvailability) async {
    final List<Checkpoint> checkpoints = [];

    try {
      checkpoints.add(_checkRpid(rpId));

      if (!kIsWeb) {
        if (Platform.isIOS) {
          final iosCheck = await _checkIosAvailability(iosAvailability);
          if (iosCheck != null) {
            checkpoints.add(iosCheck);
          }
          checkpoints.add(await _checkAASAFile(rpId));
        }

        if (Platform.isAndroid) {
          checkpoints.add(await _checkAssetLinks(rpId));
        }
      }
    } on DoctorException catch (e) {
      // If a DoctorException is thrown, it means that the blocking checkpoint
      // is failing. We add it to the list of checkpoints and return it.
      checkpoints.add(e.blockingCheckpoint);
    }

    _checkpoints.value = checkpoints;
  }

  Checkpoint _checkRpid(String rpid) {
    if (rpid.isEmpty) {
      throw DoctorException(
        blockingCheckpoint: Checkpoint(
          name: 'RPID check',
          description: 'RPID is not set',
          type: CheckpointType.error,
        ),
      );
    }

    // If they passed a URL (scheme or any slash), extract host and bail out with suggestion
    if (rpid.contains('://') || rpid.contains('/')) {
      try {
        final uri = Uri.parse(rpid);
        final host = uri.host.toLowerCase();
        if (host.isEmpty) throw FormatException();

        throw DoctorException(
          blockingCheckpoint: Checkpoint(
            name: 'RPID check',
            description: 'RPID must be just a hostname, not a URL. '
                'Did you mean "$host"?',
            type: CheckpointType.error,
          ),
        );
      } catch (_) {
        throw DoctorException(
          blockingCheckpoint: Checkpoint(
            name: 'RPID check',
            description: 'RPID "$rpid" is not a valid URL or hostname.',
            type: CheckpointType.error,
          ),
        );
      }
    }

    if (kIsWeb) {
      final hostname = Uri.base.host.toLowerCase();
      final matches = hostname == rpid || hostname.endsWith('.' + rpid);

      if (!matches) {
        return Checkpoint(
          name: 'RPID check',
          description: 'RPID "$rpid" is NOT valid for hostname "$hostname".',
          type: CheckpointType.error,
        );
      }

      return Checkpoint(
        name: 'RPID check',
        description: 'RPID "$rpid" is valid for hostname "$hostname".',
        type: CheckpointType.success,
      );
    }

    return Checkpoint(
      name: 'RPID check',
      description: 'RPID is set correctly ("$rpid").',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkAASAFile(String rpid) async {
    final uri =
        Uri.parse('https://$rpid/.well-known/apple-app-site-association');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'AASA file check',
        description: 'Failed to fetch $uri: $e',
        type: CheckpointType.error,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'AASA file check',
        description: '$uri not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
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
      );
    }

    final bundleID = await _getBundleId();
    final expectedAppID = bundleID;

    // Check applinks.details.appID (match bundle ID after the first dot)
    bool foundInAppLinks = false;
    if (jsonBody['applinks'] is Map) {
      final details = (jsonBody['applinks'] as Map)['details'];
      if (details is List) {
        foundInAppLinks = details.any((entry) {
          if (entry is Map && entry['appID'] is String) {
            final fullId = entry['appID'] as String;
            final dotIndex = fullId.indexOf('.');
            if (dotIndex > 0 && dotIndex < fullId.length - 1) {
              final bundlePart = fullId.substring(dotIndex + 1);
              return bundlePart == expectedAppID;
            }
          }
          return false;
        });
      }
    }

    // Check webcredentials.apps (same bundle-only match)
    bool foundInWebCred = false;
    if (jsonBody['webcredentials'] is Map) {
      final apps = (jsonBody['webcredentials'] as Map)['apps'];
      if (apps is List) {
        foundInWebCred = apps.any((entry) {
          if (entry is String) {
            final dotIndex = entry.indexOf('.');
            if (dotIndex > 0 && dotIndex < entry.length - 1) {
              final bundlePart = entry.substring(dotIndex + 1);
              return bundlePart == expectedAppID;
            }
          }
          return false;
        });
      }
    }

    if (foundInAppLinks && foundInWebCred) {
      return Checkpoint(
        name: 'AASA file check',
        description:
            '$uri contains valid entries for applinks.details.appID and webcredentials.apps.',
        type: CheckpointType.success,
      );
    }

    final missing = <String>[];
    if (!foundInAppLinks) missing.add('applinks.details.appID');
    if (!foundInWebCred) missing.add('webcredentials.apps');

    return Checkpoint(
      name: 'AASA file check',
      description:
          'Missing expected bundle ID "$bundleID" in ${missing.join(', ')} from $uri',
      type: CheckpointType.error,
    );
  }

  Future<Checkpoint> _checkAssetLinks(String rpid) async {
    final uri = Uri.parse('https://$rpid/.well-known/assetlinks.json');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'Asset link file check',
        description: 'Failed to fetch $uri: $e',
        type: CheckpointType.error,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'Asset link file check',
        description: '$uri not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
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
      );
    }

    final expectedPackage = await _getBundleId();
    final expectedFingerprints = await _getFingerprints();

    bool androidValid = false;
    bool webValid = false;

    for (var obj in entries) {
      if (obj is Map<String, dynamic>) {
        final target = obj['target'];
        if (target is Map<String, dynamic>) {
          final namespace = target['namespace'];

          if (namespace == 'android_app' &&
              target['package_name'] == expectedPackage) {
            final fps = target['sha256_cert_fingerprints'];
            if (fps is List &&
                fps.any((f) => expectedFingerprints.contains(f))) {
              androidValid = true;
            }
          }

          if (namespace == 'web' && target['site'] == 'https://' + rpid) {
            webValid = true;
          }
        }
      }
    }

    if (androidValid && webValid) {
      return Checkpoint(
        name: 'Asset link file check',
        description: '$uri contains valid entries for Android and Web.',
        type: CheckpointType.success,
      );
    }

    final missing = <String>[];
    if (!androidValid)
      missing.add('android_app (package or fingerprint mismatch)');
    if (!webValid) missing.add('web (site mismatch)');

    return Checkpoint(
      name: 'Asset link file check',
      description: 'Missing or invalid entries in $uri: $missing',
      type: CheckpointType.error,
    );
  }

  Future<Checkpoint?> _checkIosAvailability(
      Future<AvailabilityTypeIOS> iosAvailability) async {
    final availability = await iosAvailability;

    final info = await DeviceInfoPlugin().iosInfo;

    if (!availability.hasBiometrics && !info.isPhysicalDevice) {
      return Checkpoint(
        name: 'iOS Biometrics Check',
        description: 'FaceID/TouchID is not enabled on your simulator. Please enable it in the simulator settings "Features > Face ID/Touch ID > Enable".',
        type: CheckpointType.error,
      );
    }

    return null;
  }

  Future<String> _getBundleId() async {
    final info = await PackageInfo.fromPlatform();

    return info.packageName;
  }

  Future<List<String>> _getFingerprints() async {
    final fingerprints = await _api.getFingerprints();

    return fingerprints;
  }

  void dispose() {
    _lastException.dispose();
    _checkpoints.dispose();
  }
}

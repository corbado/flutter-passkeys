import 'dart:convert';
import 'dart:io';
import 'dart:ui' as html;

import 'package:corbado_auth_doctor/corbado_auth_doctor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import 'messages.g.dart';

class CorbadoAuthDoctor {
  final String _projectId;
  late String _rpid;

  CorbadoAuthDoctor(this._projectId);

  final WebCredentialsApi _api = WebCredentialsApi();

  Future<List<Checkpoint>> check(String rpid) async {
    if (rpid.isEmpty) {
      throw ArgumentError('rpid cannot be empty.');
    }

    this._rpid = rpid;

    final List<Checkpoint> checkpoints = [];

    try {
      checkpoints.add(_checkProjectId());
      checkpoints.add(_checkRpid());

      if (!kIsWeb) {
        if (Platform.isIOS) {
          checkpoints.add(await _checkAASAFile());
        }

        if (Platform.isAndroid) {
          checkpoints.add(await _checkAssetLinks());
        }
      }
    } on DoctorException catch (e) {
      // If a DoctorException is thrown, it means that the blocking checkpoint
      // is failing. We add it to the list of checkpoints and return it.
      checkpoints.add(e.blockingCheckpoint);
    }

    return checkpoints;
  }

  Checkpoint _checkProjectId() {
    if (_projectId.isEmpty) {
      throw DoctorException(
        blockingCheckpoint: Checkpoint(
          name: 'Project ID check',
          description:
              'Project ID is not set.',
          documentationLink:
              'https://app.corbado.com/settings/general?tab=Project+Info',
          type: CheckpointType.error,
        ),
      );
    }

    if (!_projectId.startsWith('pro-')) {
      throw DoctorException(
        blockingCheckpoint: Checkpoint(
          name: 'Project ID check',
          description: 'Project ID must start with "pro-".',
          type: CheckpointType.error,
        ),
      );
    }

    return Checkpoint(
      name: 'Project ID check',
      description: 'Project ID is set correctly ($_projectId).',
      type: CheckpointType.success,
    );
  }

  Checkpoint _checkRpid() {
    if (kIsWeb) {
      final hostname = Uri.base.host.toLowerCase();
      final matches = hostname == _rpid || hostname.endsWith('.' + _rpid);

      if (!matches) {
        return Checkpoint(
          name: 'RPID check',
          description: 'RPID "$_rpid" is NOT valid for hostname "$hostname".',
          type: CheckpointType.error,
        );
      }

      return Checkpoint(
        name: 'RPID check',
        description: 'RPID "$_rpid" is valid for hostname "$hostname".',
        type: CheckpointType.success,
      );
    }

    // iOS and Android
    final expected = '$_projectId.frontendapi.cloud.corbado.io';
    if (_rpid != expected) {
      return Checkpoint(
        name: 'RPID check',
        description:
            'RPID "$_rpid" might not be valid, expected "$expected".',
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
        type: CheckpointType.warning,
      );
    }

    return Checkpoint(
      name: 'RPID check',
      description: 'RPID is set correctly ("$_rpid").',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkAASAFile() async {
    final uri = Uri.parse('https://$_rpid/.well-known/apple-app-site-association');

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
        description:
            '$uri not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
      );
    }

    final contentType = response.headers['content-type'];
    if (contentType == null || !contentType.toLowerCase().startsWith('application/json')) {
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
      description: 'Missing expected bundle ID "$bundleID" in ${missing.join(', ')} from $uri',
      type: CheckpointType.error,
    );
  }

  Future<Checkpoint> _checkAssetLinks() async {
    final uri = Uri.parse('https://$_rpid/.well-known/assetlinks.json');

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
    if (contentType == null || !contentType.toLowerCase().startsWith('application/json')) {
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

          if (namespace == 'web' && target['site'] == _rpid) {
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

  Future<String> _getBundleId() async {
    final info = await PackageInfo.fromPlatform();

    return info.packageName;
  }

  Future<List<String>> _getFingerprints() async {
    final fingerprints = await _api.getFingerprints();

    return fingerprints;
  }
}

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
  late String _rpID;

  CorbadoAuthDoctor(this._projectId);

  final WebCredentialsApi _api = WebCredentialsApi();

  Future<List<Checkpoint>> check(String rpID) async {
    if (kReleaseMode) {
      throw StateError('doctor() should not be called in release mode. ');
    }

    this._rpID = rpID;

    final List<Checkpoint> checkpoints = [];

    try {
      checkpoints.add(_checkProjectId());

      checkpoints.add(await _checkRpId());

      if (kIsWeb) {
        checkpoints.add(await _checkHostname());
      } else {
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
          name: 'Project ID Check',
          description:
              'Project ID is not set. Make sure you pass it when initializing CorbadoAuthDoctor.',
          documentationLink:
              'https://app.corbado.com/settings/general?tab=Project+Info',
          type: CheckpointType.error,
        ),
      );
    }

    if (!_projectId.startsWith('pro-')) {
      throw DoctorException(
        blockingCheckpoint: Checkpoint(
          name: 'Project ID Check',
          description: 'Project ID must start with "pro-".',
          type: CheckpointType.error,
        ),
      );
    }

    return Checkpoint(
      name: 'Project ID Check',
      description: 'Project ID $_projectId is set correctly.',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkRpId() async {
    if (_rpID.isEmpty) {
      throw DoctorException(
        blockingCheckpoint: Checkpoint(
          name: 'RPID Check',
          description:
              'RPID is not set. Make sure to set it on the Corbado developer panel.',
          documentationLink:
              'https://app.corbado.com/settings/general?tab=URLs',
          type: CheckpointType.error,
        ),
      );
    }

    final expected =
        kIsWeb ? 'localhost' : '$_projectId.frontendapi.cloud.corbado.io';
    if (_rpID != expected) {
      return Checkpoint(
        name: 'RPID Check',
        description:
            'RPID might not be valid. Expected "$expected" but got "$_rpID".',
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
        type: CheckpointType.warning,
      );
    }
    return Checkpoint(
      name: 'RPID Check',
      description: 'RPID $_rpID is set correctly.',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkAASAFile() async {
    final uri = Uri.parse('https://$_rpID/.well-known/apple-app-site-association');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'AASA File Check',
        description: 'Failed to fetch apple-app-site-association from $uri : $e',
        type: CheckpointType.error,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'AASA File Check',
        description:
            'apple-app-site-association not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
      );
    }

    final contentType = response.headers['content-type'];
    if (contentType == null || !contentType.toLowerCase().startsWith('application/json')) {
      return Checkpoint(
        name: 'AASA File Check',
        description:
        'Invalid Content-Type on $uri: expected application/json but got ${contentType ?? 'none'}.',
        type: CheckpointType.error,
      );
    }

    Map<String, dynamic> jsonBody;
    try {
      jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'AASA File Check',
        description: 'Invalid JSON in apple-app-site-association on $uri: $e',
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
        name: 'AASA File Check',
        description:
            'apple-app-site-association hosted on $uri contains correct entries for both applinks.details.appID and webcredentials.apps.',
        type: CheckpointType.success,
      );
    }

    final missing = <String>[];
    if (!foundInAppLinks) missing.add('applinks.details.appID');
    if (!foundInWebCred) missing.add('webcredentials.apps');

    return Checkpoint(
      name: 'AASA File Check',
      description: 'Missing expected bundle ID in: ${missing.join(', ')}',
      type: CheckpointType.error,
    );
  }

  Future<Checkpoint> _checkAssetLinks() async {
    final uri = Uri.parse('https://$_rpID/.well-known/assetlinks.json');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'Failed to fetch assetlinks.json from $uri: $e',
        type: CheckpointType.error,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'assetlinks.json not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
      );
    }

    final contentType = response.headers['content-type'];
    if (contentType == null || !contentType.toLowerCase().startsWith('application/json')) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description:
        'Invalid Content-Type on $uri: expected application/json but got ${contentType ?? 'none'}.',
        type: CheckpointType.error,
      );
    }

    List<dynamic> entries;
    try {
      entries = jsonDecode(response.body) as List<dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'Invalid JSON array in assetlinks.json on $uri: $e',
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

          if (namespace == 'web' && target['site'] == _rpID) {
            webValid = true;
          }
        }
      }
    }

    if (androidValid && webValid) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'assetlinks.json hosted on $uri contains valid Android and Web entries.',
        type: CheckpointType.success,
      );
    }

    final missing = <String>[];
    if (!androidValid)
      missing.add('android_app (package or fingerprint mismatch)');
    if (!webValid) missing.add('web (site mismatch)');

    return Checkpoint(
      name: 'Asset Link File Check',
      description: 'Missing or invalid entries in assetlinks.json on $uri: $missing',
      type: CheckpointType.error,
    );
  }

  Future<Checkpoint> _checkHostname() async {
    final String hostname = Uri.base.host.toLowerCase();

    if (_rpID.isEmpty) {
      return Checkpoint(
        name: 'Hostname Check',
        description: 'RPID is null or empty.',
        type: CheckpointType.error,
      );
    }

    final String rpHost = Uri.parse(_rpID).host.toLowerCase();

    final bool matches =
        hostname == rpHost || hostname.endsWith('.' + rpHost);

    if (matches) {
      return Checkpoint(
        name: 'Hostname Check',
        description: 'Hostname "$hostname" is valid for RPID host "$rpHost".',
        type: CheckpointType.success,
      );
    } else {
      return Checkpoint(
        name: 'Hostname Check',
        description:
        'Hostname "$hostname" is NOT valid for RPID host "$rpHost".',
        type: CheckpointType.error,
      );
    }
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

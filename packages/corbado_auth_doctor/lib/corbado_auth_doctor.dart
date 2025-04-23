import 'dart:convert';
import 'dart:io';

import 'package:corbado_auth_doctor/types/checkpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import 'messages.g.dart';

class CorbadoAuthDoctor {
  final String _projectId;
  final Future<String?> _rpIdFuture;

  CorbadoAuthDoctor(this._projectId, this._rpIdFuture);

  final WebCredentialsApi _api = WebCredentialsApi();

  @override
  Future<List<Checkpoint>> check() async {
    final List<Checkpoint> checkpoints = [];
    checkpoints.add(_checkProjectId());
    checkpoints.add(await _checkRpId());

    if (Platform.isIOS) {
      checkpoints.add(await _checkAASAFile());
    }

    if (Platform.isAndroid) {
      checkpoints.add(await _checkAssetLinks());
    }
    return checkpoints;
  }

  Checkpoint _checkProjectId() {
    if (_projectId.isEmpty) {
      return Checkpoint(
        name: 'Project ID Check',
        description:
            'Project ID is not set. Make sure you pass it when initializing CorbadoAuthDoctor.',
        documentationLink:
            'https://app.corbado.com/settings/general?tab=Project+Info',
        type: CheckpointType.error,
      );
    }
    if (!_projectId.startsWith('pro-')) {
      return Checkpoint(
        name: 'Project ID Check',
        description: 'Project ID must start with "pro-".',
        type: CheckpointType.error,
      );
    }
    return Checkpoint(
      name: 'Project ID Check',
      description: 'Project ID is set correctly.',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkRpId() async {
    final rpId = await _rpIdFuture;
    if (rpId == null || rpId.isEmpty) {
      return Checkpoint(
        name: 'RP ID Check',
        description:
            'RP ID is not set. Make sure to set it on the Corbado developer panel.',
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
        type: CheckpointType.error,
      );
    }

    final expected =
        kIsWeb ? 'localhost' : '$_projectId.frontendapi.cloud.corbado.io';
    if (rpId != expected) {
      return Checkpoint(
        name: 'RP ID Check',
        description:
            'RP ID might not be valid. Expected "$expected" but got "$rpId".',
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
        type: CheckpointType.warning,
      );
    }
    return Checkpoint(
      name: 'RP ID Check',
      description: 'RP ID is set correctly.',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkAASAFile() async {
    final rpID = await _rpIdFuture;
    final uri = Uri.parse('$rpID/.well-known/apple-app-site-association');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'AASA File Check',
        description: 'Failed to fetch apple-app-site-association: $e',
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

    Map<String, dynamic> jsonBody;
    try {
      jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'AASA File Check',
        description: 'Invalid JSON in apple-app-site-association: $e',
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
            '✅ apple-app-site-association contains correct entries for both applinks.details.appID and webcredentials.apps.',
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
    final rpID = await _rpIdFuture;
    final uri = Uri.parse('$rpID/.well-known/assetlinks.json');

    http.Response response;
    try {
      response = await http.get(uri).timeout(Duration(seconds: 5));
    } catch (e) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'Failed to fetch assetlinks.json: $e',
        type: CheckpointType.error,
      );
    }

    if (response.statusCode != 200) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description:
            'assetlinks.json not found (HTTP ${response.statusCode}).',
        type: CheckpointType.error,
      );
    }

    List<dynamic> entries;
    try {
      entries = jsonDecode(response.body) as List<dynamic>;
    } catch (e) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description: 'Invalid JSON array in assetlinks.json: $e',
        type: CheckpointType.error,
      );
    }

    final expectedPackage = await _getBundleId();
    final expectedFingerprints = await _getFingerprints();

    bool androidValid = false;
    bool webValid = false;

    for (var obj in entries) {
      if (obj is Map<String, dynamic>) {
        final relation = obj['relation'];
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

          if (namespace == 'web' && target['site'] == rpID) {
            webValid = true;
          }
        }
      }
    }

    if (androidValid && webValid) {
      return Checkpoint(
        name: 'Asset Link File Check',
        description:
            '✅ assetlinks.json contains valid Android and Web entries.',
        type: CheckpointType.success,
      );
    }

    final missing = <String>[];
    if (!androidValid)
      missing.add('android_app (package or fingerprint mismatch)');
    if (!webValid) missing.add('web (site mismatch)');

    return Checkpoint(
      name: 'Asset Link File Check',
      description: 'Missing or invalid entries in assetlinks.json: $missing',
      type: CheckpointType.error,
    );
  }

  Future<String> _getBundleId() async {
    final info = await PackageInfo.fromPlatform();

    return info.packageName;
  }

  Future<String> _getFingerprints() async {
    final fingerprints = await _api.getWebCredentialsDomains();

    return fingerprints.domains[0].toString();
  }
}

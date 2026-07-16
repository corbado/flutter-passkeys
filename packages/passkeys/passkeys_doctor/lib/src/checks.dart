import 'types/checkpoint.dart';
import 'types/exceptions.dart';

/// Documentation links surfaced on failing checkpoints.
class DocLinks {
  static const flutterIntegration =
      'https://docs.corbado.com/corbado-complete/frontend-integration/flutter';
  static const ios =
      'https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/ios/overview';
  static const android =
      'https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/android/overview';
}

/// Validates the RPID value.
///
/// When [hostname] is non-null the check runs in a web context and also
/// verifies that the RPID is valid for the current hostname. Throws a
/// [DoctorException] for blocking format errors so later checks are skipped.
Checkpoint checkRpidValue(String rpid, {String? hostname}) {
  if (rpid.isEmpty) {
    throw DoctorException(
      blockingCheckpoint: Checkpoint(
        name: 'RPID check',
        description: 'RPID is not set',
        type: CheckpointType.error,
        documentationLink: DocLinks.flutterIntegration,
      ),
    );
  }

  if (rpid.contains('://') || rpid.contains('/')) {
    String? host;
    try {
      final parsed = Uri.parse(rpid).host.toLowerCase();
      if (parsed.isNotEmpty) {
        host = parsed;
      }
    } catch (_) {
      host = null;
    }

    throw DoctorException(
      blockingCheckpoint: Checkpoint(
        name: 'RPID check',
        description: host != null
            ? 'RPID must be just a hostname, not a URL. Did you mean "$host"?'
            : 'RPID "$rpid" is not a valid URL or hostname.',
        type: CheckpointType.error,
        documentationLink: DocLinks.flutterIntegration,
      ),
    );
  }

  if (hostname != null) {
    final normalizedHost = hostname.toLowerCase();
    final matches = normalizedHost == rpid || normalizedHost.endsWith('.$rpid');

    if (!matches) {
      return Checkpoint(
        name: 'RPID check',
        description:
            'RPID "$rpid" is NOT valid for hostname "$normalizedHost".',
        type: CheckpointType.error,
        documentationLink: DocLinks.flutterIntegration,
      );
    }

    return Checkpoint(
      name: 'RPID check',
      description: 'RPID "$rpid" is valid for hostname "$normalizedHost".',
      type: CheckpointType.success,
    );
  }

  return Checkpoint(
    name: 'RPID check',
    description: 'RPID is set correctly ("$rpid").',
    type: CheckpointType.success,
  );
}

/// Evaluates a parsed AASA JSON body for the given [bundleId].
Checkpoint evaluateAasa(
  Uri uri,
  Map<String, dynamic> jsonBody,
  String bundleId,
) {
  bool matchesBundle(String fullId) {
    final dotIndex = fullId.indexOf('.');
    if (dotIndex <= 0 || dotIndex >= fullId.length - 1) {
      return false;
    }
    return fullId.substring(dotIndex + 1) == bundleId;
  }

  var foundInAppLinks = false;
  final applinks = jsonBody['applinks'];
  if (applinks is Map) {
    final details = applinks['details'];
    if (details is List) {
      foundInAppLinks = details.any(
        (entry) =>
            entry is Map &&
            entry['appID'] is String &&
            matchesBundle(entry['appID'] as String),
      );
    }
  }

  var foundInWebCred = false;
  final webcredentials = jsonBody['webcredentials'];
  if (webcredentials is Map) {
    final apps = webcredentials['apps'];
    if (apps is List) {
      foundInWebCred = apps.any(
        (entry) => entry is String && matchesBundle(entry),
      );
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
        'Missing expected bundle ID "$bundleId" in ${missing.join(', ')} from $uri',
    type: CheckpointType.error,
    documentationLink: DocLinks.ios,
  );
}

/// Evaluates parsed assetlinks entries for the given app.
Checkpoint evaluateAssetLinks(
  Uri uri,
  List<dynamic> entries, {
  required String package,
  required List<String> fingerprints,
  required String rpid,
}) {
  final expectedFingerprints = fingerprints.map((f) => f.toUpperCase()).toSet();

  var androidValid = false;
  var webValid = false;

  for (final obj in entries) {
    if (obj is! Map<String, dynamic>) continue;
    final target = obj['target'];
    if (target is! Map<String, dynamic>) continue;

    final namespace = target['namespace'];

    if (namespace == 'android_app' && target['package_name'] == package) {
      final fps = target['sha256_cert_fingerprints'];
      if (fps is List &&
          fps.any(
            (f) =>
                f is String && expectedFingerprints.contains(f.toUpperCase()),
          )) {
        androidValid = true;
      }
    }

    if (namespace == 'web' && target['site'] == 'https://$rpid') {
      webValid = true;
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
  if (!androidValid) {
    missing.add('android_app (package or fingerprint mismatch)');
  }
  if (!webValid) missing.add('web (site mismatch)');

  return Checkpoint(
    name: 'Asset link file check',
    description: 'Missing or invalid entries in $uri: $missing',
    type: CheckpointType.error,
    documentationLink: DocLinks.android,
  );
}

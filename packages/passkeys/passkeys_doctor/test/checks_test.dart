import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';
import 'package:passkeys_doctor/src/checks.dart';

void main() {
  group('checkRpidValue', () {
    test('throws when RPID is empty', () {
      expect(() => checkRpidValue(''), throwsA(isA<DoctorException>()));
    });

    test('throws with a suggestion when a URL is passed', () {
      try {
        checkRpidValue('https://flutter.corbado.io/');
        fail('expected DoctorException');
      } on DoctorException catch (e) {
        expect(e.blockingCheckpoint.type, CheckpointType.error);
        expect(
          e.blockingCheckpoint.description,
          contains('flutter.corbado.io'),
        );
      }
    });

    test('throws when a path-only value is passed', () {
      expect(() => checkRpidValue('foo/bar'), throwsA(isA<DoctorException>()));
    });

    test('succeeds for a plain hostname off-web', () {
      final cp = checkRpidValue('flutter.corbado.io');
      expect(cp.type, CheckpointType.success);
    });

    test('matches exact hostname on web', () {
      final cp = checkRpidValue('corbado.io', hostname: 'corbado.io');
      expect(cp.type, CheckpointType.success);
    });

    test('matches a subdomain of the RPID on web', () {
      final cp = checkRpidValue('corbado.io', hostname: 'app.corbado.io');
      expect(cp.type, CheckpointType.success);
    });

    test('fails when hostname does not match the RPID on web', () {
      final cp = checkRpidValue('corbado.io', hostname: 'example.com');
      expect(cp.type, CheckpointType.error);
    });

    test('does not treat a suffix substring as a subdomain match', () {
      final cp = checkRpidValue('corbado.io', hostname: 'notcorbado.io');
      expect(cp.type, CheckpointType.error);
    });
  });

  group('evaluateAasa', () {
    final uri = Uri.parse(
      'https://corbado.io/.well-known/apple-app-site-association',
    );

    Map<String, dynamic> aasa({
      required String appLinkId,
      required String webCredId,
    }) {
      return jsonDecode(
            jsonEncode({
              'applinks': {
                'details': [
                  {'appID': appLinkId},
                ],
              },
              'webcredentials': {
                'apps': [webCredId],
              },
            }),
          )
          as Map<String, dynamic>;
    }

    test('succeeds when both applinks and webcredentials match', () {
      final cp = evaluateAasa(
        uri,
        aasa(
          appLinkId: 'ABCDE.com.corbado.app',
          webCredId: 'ABCDE.com.corbado.app',
        ),
        'com.corbado.app',
      );
      expect(cp.type, CheckpointType.success);
    });

    test('fails when webcredentials is missing the bundle', () {
      final cp = evaluateAasa(
        uri,
        aasa(appLinkId: 'ABCDE.com.corbado.app', webCredId: 'ABCDE.com.other'),
        'com.corbado.app',
      );
      expect(cp.type, CheckpointType.error);
      expect(cp.description, contains('webcredentials.apps'));
    });

    test('matches a bundle id that itself contains dots', () {
      final cp = evaluateAasa(
        uri,
        aasa(
          appLinkId: 'TEAM.io.corbado.demo.app',
          webCredId: 'TEAM.io.corbado.demo.app',
        ),
        'io.corbado.demo.app',
      );
      expect(cp.type, CheckpointType.success);
    });

    test('fails on a malformed appID with no team prefix', () {
      final cp = evaluateAasa(
        uri,
        aasa(appLinkId: 'com.corbado.app', webCredId: 'com.corbado.app'),
        'com.corbado.app',
      );
      expect(cp.type, CheckpointType.error);
    });
  });

  group('evaluateAssetLinks', () {
    final uri = Uri.parse('https://corbado.io/.well-known/assetlinks.json');
    const fingerprint = 'F8:90:4E:9A:99:01:71:75';

    List<dynamic> entries({
      required String package,
      required String fp,
      String site = 'https://corbado.io',
    }) {
      return jsonDecode(
            jsonEncode([
              {
                'relation': ['delegate_permission/common.get_login_creds'],
                'target': {
                  'namespace': 'android_app',
                  'package_name': package,
                  'sha256_cert_fingerprints': [fp],
                },
              },
              {
                'relation': ['delegate_permission/common.get_login_creds'],
                'target': {'namespace': 'web', 'site': site},
              },
            ]),
          )
          as List<dynamic>;
    }

    test('succeeds when android and web entries match', () {
      final cp = evaluateAssetLinks(
        uri,
        entries(package: 'com.corbado.app', fp: fingerprint),
        package: 'com.corbado.app',
        fingerprints: [fingerprint],
        rpid: 'corbado.io',
      );
      expect(cp.type, CheckpointType.success);
    });

    test('matches fingerprints case-insensitively', () {
      final cp = evaluateAssetLinks(
        uri,
        entries(package: 'com.corbado.app', fp: fingerprint.toLowerCase()),
        package: 'com.corbado.app',
        fingerprints: [fingerprint],
        rpid: 'corbado.io',
      );
      expect(cp.type, CheckpointType.success);
    });

    test('fails on a fingerprint mismatch', () {
      final cp = evaluateAssetLinks(
        uri,
        entries(package: 'com.corbado.app', fp: 'AA:BB:CC'),
        package: 'com.corbado.app',
        fingerprints: [fingerprint],
        rpid: 'corbado.io',
      );
      expect(cp.type, CheckpointType.error);
    });

    test('fails when the web site does not match the RPID', () {
      final cp = evaluateAssetLinks(
        uri,
        entries(
          package: 'com.corbado.app',
          fp: fingerprint,
          site: 'https://other.io',
        ),
        package: 'com.corbado.app',
        fingerprints: [fingerprint],
        rpid: 'corbado.io',
      );
      expect(cp.type, CheckpointType.error);
    });
  });
}

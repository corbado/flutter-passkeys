import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

class PasskeysMock extends PasskeysPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<bool> canAuthenticate() async => false;

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) async =>
      throw UnimplementedError();

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType authenticateResponseType,
  ) => throw UnimplementedError();

  @override
  Future<void> cancelCurrentAuthenticatorOperation() {
    throw UnimplementedError();
  }

  @override
  Future<AvailabilityType> getAvailability() => throw UnimplementedError();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PasskeysPlatformInterface', () {
    late PasskeysPlatform passkeysPlatform;

    setUp(() {
      passkeysPlatform = PasskeysMock();
      PasskeysPlatform.instance = passkeysPlatform;
    });
  });

  group('AuthenticatorSelectionType.fromJson', () {
    test('applies WebAuthn spec defaults when fields are null', () {
      final selection = AuthenticatorSelectionType.fromJson({
        'requireResidentKey': null,
        'residentKey': null,
        'userVerification': null,
      });

      expect(selection.requireResidentKey, isFalse);
      expect(selection.userVerification, 'preferred');
    });

    test('applies WebAuthn spec defaults when fields are absent', () {
      final selection = AuthenticatorSelectionType.fromJson(
        <String, dynamic>{},
      );

      expect(selection.requireResidentKey, isFalse);
      expect(selection.userVerification, 'preferred');
    });

    test(
      'derives residentKey as discouraged when requireResidentKey is false',
      () {
        final selection = AuthenticatorSelectionType.fromJson({
          'requireResidentKey': false,
        });

        expect(selection.residentKey, 'discouraged');
      },
    );

    test('derives residentKey as required when requireResidentKey is true', () {
      final selection = AuthenticatorSelectionType.fromJson({
        'requireResidentKey': true,
      });

      expect(selection.residentKey, 'required');
    });

    test(
      'derives residentKey from default requireResidentKey when both absent',
      () {
        final selection = AuthenticatorSelectionType.fromJson(
          <String, dynamic>{},
        );

        expect(selection.residentKey, 'discouraged');
      },
    );

    test('preserves provided values', () {
      final selection = AuthenticatorSelectionType.fromJson({
        'authenticatorAttachment': 'platform',
        'requireResidentKey': true,
        'residentKey': 'required',
        'userVerification': 'required',
      });

      expect(selection.authenticatorAttachment, 'platform');
      expect(selection.requireResidentKey, isTrue);
      expect(selection.residentKey, 'required');
      expect(selection.userVerification, 'required');
    });
  });

  group('RegisterRequestType PRF extension', () {
    RegisterRequestType build(Map<String, dynamic> extra) =>
        RegisterRequestType.fromJson({
          'challenge': 'challenge',
          'rp': {'id': 'example.com', 'name': 'Example'},
          'user': {'id': 'user-id', 'name': 'user', 'displayName': 'User'},
          ...extra,
        });

    test('prf is null when no extensions are present', () {
      expect(build(<String, dynamic>{}).prf, isNull);
    });

    test('prf is parsed from extensions.prf.eval.first', () {
      final request = build({
        'extensions': {
          'prf': {
            'eval': {'first': 'salt-value'},
          },
        },
      });
      expect(request.prf, 'salt-value');
    });

    test('prf is null when the extensions object is malformed', () {
      expect(
        build({
          'extensions': {'prf': <String, dynamic>{}},
        }).prf,
        isNull,
      );
      expect(build({'extensions': 'nonsense'}).prf, isNull);
    });

    test('toJson round-trips the prf salt into extensions.prf.eval.first', () {
      final json = build({
        'extensions': {
          'prf': {
            'eval': {'first': 'salt-value'},
          },
        },
      }).toJson();
      expect(json['extensions'], {
        'prf': {
          'eval': {'first': 'salt-value'},
        },
      });
    });

    test('toJson omits extensions when prf is null', () {
      expect(
        build(<String, dynamic>{}).toJson().containsKey('extensions'),
        isFalse,
      );
    });
  });

  group('AuthenticateRequestType PRF extension', () {
    AuthenticateRequestType build(Map<String, dynamic> extra) =>
        AuthenticateRequestType.fromJson({
          'challenge': 'challenge',
          'rpId': 'example.com',
          ...extra,
        });

    test('prf is null when no extensions are present', () {
      expect(build(<String, dynamic>{}).prf, isNull);
    });

    test('prf is parsed from extensions.prf.eval.first', () {
      final request = build({
        'extensions': {
          'prf': {
            'eval': {'first': 'salt-value'},
          },
        },
      });
      expect(request.prf, 'salt-value');
    });

    test('toJson round-trips the prf salt into extensions.prf.eval.first', () {
      final json = build({
        'extensions': {
          'prf': {
            'eval': {'first': 'salt-value'},
          },
        },
      }).toJson();
      expect(json['extensions'], {
        'prf': {
          'eval': {'first': 'salt-value'},
        },
      });
    });

    test('toJson omits extensions when prf is null', () {
      expect(
        build(<String, dynamic>{}).toJson().containsKey('extensions'),
        isFalse,
      );
    });
  });

  group('RegisterResponseType PRF extension', () {
    test('clientExtensionResults is read from the response JSON', () {
      final response = RegisterResponseType.fromJson({
        'id': 'id',
        'rawId': 'rawId',
        'response': {'clientDataJSON': 'cdj', 'attestationObject': 'ao'},
        'clientExtensionResults': {
          'prf': {
            'enabled': true,
            'results': {'first': 'top-secret'},
          },
        },
      });

      expect(
        response.clientExtensionResults?['prf'],
        isA<Map<dynamic, dynamic>>(),
      );
    });

    test('toJson signals prf.enabled without leaking the secret', () {
      const response = RegisterResponseType(
        id: 'id',
        rawId: 'rawId',
        clientDataJSON: 'cdj',
        attestationObject: 'ao',
        transports: [],
        clientExtensionResults: {
          'prf': {
            'enabled': true,
            'results': {'first': 'top-secret'},
          },
        },
      );

      expect(response.toJson()['clientExtensionResults'], {
        'prf': {'enabled': true},
      });
      expect(response.toJsonString(), isNot(contains('top-secret')));
    });

    test('toJson emits empty clientExtensionResults when none are present', () {
      const response = RegisterResponseType(
        id: 'id',
        rawId: 'rawId',
        clientDataJSON: 'cdj',
        attestationObject: 'ao',
        transports: [],
      );

      expect(response.toJson()['clientExtensionResults'], <String, dynamic>{});
    });
  });

  group('AuthenticateResponseType PRF extension', () {
    test('clientExtensionResults is read from the response JSON', () {
      final response = AuthenticateResponseType.fromJson({
        'id': 'id',
        'rawId': 'rawId',
        'response': {
          'clientDataJSON': 'cdj',
          'authenticatorData': 'ad',
          'signature': 'sig',
          'userHandle': 'uh',
        },
        'clientExtensionResults': {
          'prf': {
            'results': {'first': 'top-secret'},
          },
        },
      });

      expect(
        response.clientExtensionResults?['prf'],
        isA<Map<dynamic, dynamic>>(),
      );
    });

    test('toJson never forwards the PRF secret to the relying party', () {
      const response = AuthenticateResponseType(
        id: 'id',
        rawId: 'rawId',
        clientDataJSON: 'cdj',
        authenticatorData: 'ad',
        signature: 'sig',
        userHandle: 'uh',
        clientExtensionResults: {
          'prf': {
            'results': {'first': 'top-secret'},
          },
        },
      );

      expect(response.toJson()['clientExtensionResults'], <String, dynamic>{});
      expect(response.toJsonString(), isNot(contains('top-secret')));
    });
  });
}

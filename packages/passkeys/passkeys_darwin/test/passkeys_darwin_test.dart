import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_darwin/messages.g.dart' as pigeon;
import 'package:passkeys_darwin/passkeys_darwin.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

class _FakePasskeysApi extends pigeon.PasskeysApi {
  String? registerSalt;
  String? authenticateSalt;

  @override
  Future<pigeon.RegisterResponse> register(
    String challenge,
    pigeon.RelyingParty relyingParty,
    pigeon.User user,
    List<pigeon.CredentialType?> excludeCredentials,
    List<int?> pubKeyCredValues,
    bool canBePlatformAuthenticator,
    bool canBeSecurityKey,
    String? residentKeyPreference,
    String? attestationPreference,
    String? salt,
  ) async {
    registerSalt = salt;
    return pigeon.RegisterResponse(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'cdj',
      attestationObject: 'ao',
      transports: const [],
      clientExtensionResults: const {
        'prf': {
          'results': {'first': 'prf-output'},
        },
      },
    );
  }

  @override
  Future<pigeon.AuthenticateResponse> authenticate(
    String relyingPartyId,
    String challenge,
    bool conditionalUI,
    List<pigeon.CredentialType?> allowedCredentials,
    bool preferImmediatelyAvailableCredentials,
    String? salt,
  ) async {
    authenticateSalt = salt;
    return pigeon.AuthenticateResponse(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'cdj',
      authenticatorData: 'ad',
      signature: 'sig',
      userHandle: 'uh',
      clientExtensionResults: const {
        'prf': {
          'results': {'first': 'prf-output'},
        },
      },
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PasskeysDarwin', () {
    test('can be registered', () {
      PasskeysDarwin.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysDarwin>());
    });

    test('register forwards the PRF salt and maps the result', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      final response = await platform.register(
        RegisterRequestType(
          challenge: 'challenge',
          relyingParty: RelyingPartyType(id: 'example.com', name: 'Example'),
          user: const UserType(id: 'user', name: 'user', displayName: 'User'),
          excludeCredentials: const [],
          prf: 'salt-value',
        ),
      );

      expect(api.registerSalt, 'salt-value');
      expect(
        response.clientExtensionResults?['prf'],
        isA<Map<dynamic, dynamic>>(),
      );
    });

    test('register passes a null salt when prf is not set', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.register(
        RegisterRequestType(
          challenge: 'challenge',
          relyingParty: RelyingPartyType(id: 'example.com', name: 'Example'),
          user: const UserType(id: 'user', name: 'user', displayName: 'User'),
          excludeCredentials: const [],
        ),
      );

      expect(api.registerSalt, isNull);
    });

    test('authenticate forwards the PRF salt and maps the result', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      final response = await platform.authenticate(
        const AuthenticateRequestType(
          relyingPartyId: 'example.com',
          challenge: 'challenge',
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: true,
          prf: 'salt-value',
        ),
      );

      expect(api.authenticateSalt, 'salt-value');
      expect(
        response.clientExtensionResults?['prf'],
        isA<Map<dynamic, dynamic>>(),
      );
    });
  });
}

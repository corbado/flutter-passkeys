import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_darwin/messages.g.dart' as pigeon;
import 'package:passkeys_darwin/passkeys_darwin.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

class _FakePasskeysApi extends pigeon.PasskeysApi {
  String? registerSalt;
  String? registerUserVerificationPreference;
  String? authenticateSalt;
  String? authenticateUserVerificationPreference;
  bool? authenticateCanBeSecurityKey;
  List<Object?>? signalUnknownCredentialArgs;
  List<Object?>? signalAllAcceptedCredentialsArgs;

  @override
  Future<void> signalUnknownCredential(
    String relyingPartyId,
    String credentialId,
  ) async {
    signalUnknownCredentialArgs = [relyingPartyId, credentialId];
  }

  @override
  Future<void> signalAllAcceptedCredentials(
    String relyingPartyId,
    String userId,
    List<String?> allAcceptedCredentialIds,
  ) async {
    signalAllAcceptedCredentialsArgs = [
      relyingPartyId,
      userId,
      allAcceptedCredentialIds,
    ];
  }

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
    String? userVerificationPreference,
    String? salt,
  ) async {
    registerSalt = salt;
    registerUserVerificationPreference = userVerificationPreference;
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
    String? userVerificationPreference,
    String? salt,
    bool canBeSecurityKey,
  ) async {
    authenticateSalt = salt;
    authenticateUserVerificationPreference = userVerificationPreference;
    authenticateCanBeSecurityKey = canBeSecurityKey;
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

    test('register forwards the user verification preference', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.register(
        RegisterRequestType(
          challenge: 'challenge',
          relyingParty: RelyingPartyType(id: 'example.com', name: 'Example'),
          user: const UserType(id: 'user', name: 'user', displayName: 'User'),
          excludeCredentials: const [],
          authSelectionType: AuthenticatorSelectionType(
            requireResidentKey: false,
            residentKey: 'preferred',
            userVerification: 'required',
          ),
        ),
      );

      expect(api.registerUserVerificationPreference, 'required');
    });

    test('register passes a null user verification preference when '
        'no authenticator selection is set', () async {
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

      expect(api.registerUserVerificationPreference, isNull);
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

    test('authenticate forwards the user verification preference', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.authenticate(
        const AuthenticateRequestType(
          relyingPartyId: 'example.com',
          challenge: 'challenge',
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: true,
          userVerification: 'discouraged',
        ),
      );

      expect(api.authenticateUserVerificationPreference, 'discouraged');
    });

    test('authenticate passes a null user verification preference when '
        'it is not set', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.authenticate(
        const AuthenticateRequestType(
          relyingPartyId: 'example.com',
          challenge: 'challenge',
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: true,
        ),
      );

      expect(api.authenticateUserVerificationPreference, isNull);
    });

    test('authenticate allows security keys by default', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.authenticate(
        const AuthenticateRequestType(
          relyingPartyId: 'example.com',
          challenge: 'challenge',
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: false,
        ),
      );

      expect(api.authenticateCanBeSecurityKey, isTrue);
    });

    test('authenticate forwards canBeSecurityKey when disabled', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.authenticate(
        const AuthenticateRequestType(
          relyingPartyId: 'example.com',
          challenge: 'challenge',
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: false,
          canBeSecurityKey: false,
        ),
      );

      expect(api.authenticateCanBeSecurityKey, isFalse);
    });

    test('signalUnknownCredential forwards its arguments', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.signalUnknownCredential(
        const SignalUnknownCredentialRequestType(
          relyingPartyId: 'example.com',
          credentialId: 'credential-id',
        ),
      );

      expect(api.signalUnknownCredentialArgs, ['example.com', 'credential-id']);
    });

    test('signalAllAcceptedCredentials forwards its arguments', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysDarwin(api: api);

      await platform.signalAllAcceptedCredentials(
        const SignalAllAcceptedCredentialsRequestType(
          relyingPartyId: 'example.com',
          userId: 'user-id',
          allAcceptedCredentialIds: ['cred-1', 'cred-2'],
        ),
      );

      expect(api.signalAllAcceptedCredentialsArgs, [
        'example.com',
        'user-id',
        ['cred-1', 'cred-2'],
      ]);
    });
  });
}

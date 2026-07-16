import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_android/messages.g.dart' as pigeon;
import 'package:passkeys_android/passkeys_android.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

class _FakePasskeysApi extends pigeon.PasskeysApi {
  String? registerSalt;
  String? authenticateSalt;
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
    pigeon.AuthenticatorSelection? authenticatorSelection,
    List<pigeon.PubKeyCredParam?>? pubKeyCredParams,
    int? timeout,
    String? attestation,
    List<pigeon.ExcludeCredential?> excludeCredentials,
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
    int? timeout,
    String? userVerification,
    List<pigeon.AllowCredential?>? allowCredentials,
    bool? preferImmediatelyAvailableCredentials,
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

  group('PasskeysAndroid', () {
    test('can be registered', () {
      PasskeysAndroid.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysAndroid>());
    });

    test('register forwards the PRF salt and maps the result', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysAndroid(api: api);

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
      final platform = PasskeysAndroid(api: api);

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
      final platform = PasskeysAndroid(api: api);

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

    test('signalUnknownCredential forwards its arguments', () async {
      final api = _FakePasskeysApi();
      final platform = PasskeysAndroid(api: api);

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
      final platform = PasskeysAndroid(api: api);

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

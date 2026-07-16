import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:passkeys_windows/messages.g.dart';
import 'package:passkeys_windows/passkeys_windows.dart';

class _FakePasskeysApi extends PasskeysApi {
  String? capturedRegisterPrf;
  String? capturedAuthenticatePrf;

  bool? registerPrfEnabled;
  String? authenticatePrfResultFirst;

  @override
  Future<RegisterResponse> register(
    String challenge,
    RelyingParty relyingParty,
    User user,
    AuthenticatorSelection? authenticatorSelection,
    List<PubKeyCredParam?>? pubKeyCredParams,
    int? timeout,
    String? attestation,
    List<ExcludeCredential?> excludeCredentials,
    String? prf,
  ) async {
    capturedRegisterPrf = prf;
    return RegisterResponse(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'clientDataJSON',
      attestationObject: 'attestationObject',
      transports: const [],
      prfEnabled: registerPrfEnabled,
    );
  }

  @override
  Future<AuthenticateResponse> authenticate(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? userVerification,
    List<AllowCredential?>? allowCredentials,
    bool? preferImmediatelyAvailableCredentials,
    String? prf,
  ) async {
    capturedAuthenticatePrf = prf;
    return AuthenticateResponse(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'clientDataJSON',
      authenticatorData: 'authenticatorData',
      signature: 'signature',
      userHandle: 'userHandle',
      prfResultFirst: authenticatePrfResultFirst,
    );
  }
}

RegisterRequestType _registerRequest({String? prf}) => RegisterRequestType(
  challenge: 'challenge',
  relyingParty: RelyingPartyType(name: 'name', id: 'example.com'),
  user: const UserType(displayName: 'display', name: 'name', id: 'userId'),
  excludeCredentials: const [],
  prf: prf,
);

AuthenticateRequestType _authenticateRequest({String? prf}) =>
    AuthenticateRequestType(
      relyingPartyId: 'example.com',
      challenge: 'challenge',
      mediation: MediationType.Optional,
      preferImmediatelyAvailableCredentials: false,
      prf: prf,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PasskeysWindows', () {
    late PasskeysWindows passkeys;

    setUp(() {
      passkeys = PasskeysWindows();
    });

    test('can be registered', () {
      PasskeysWindows.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysWindows>());
    });

    test('is a PasskeysPlatform', () {
      expect(passkeys, isA<PasskeysPlatform>());
    });
  });

  group('PasskeysWindows PRF', () {
    late _FakePasskeysApi api;
    late PasskeysWindows passkeys;

    setUp(() {
      api = _FakePasskeysApi();
      passkeys = PasskeysWindows(api: api);
    });

    test('register forwards the prf salt', () async {
      await passkeys.register(_registerRequest(prf: 'prfSalt'));

      expect(api.capturedRegisterPrf, 'prfSalt');
    });

    test('register surfaces prf.enabled in clientExtensionResults', () async {
      api.registerPrfEnabled = true;

      final response = await passkeys.register(
        _registerRequest(prf: 'prfSalt'),
      );

      expect(response.clientExtensionResults, {
        'prf': {'enabled': true},
      });
    });

    test('register without prf has no clientExtensionResults', () async {
      final response = await passkeys.register(_registerRequest());

      expect(api.capturedRegisterPrf, isNull);
      expect(response.clientExtensionResults, isNull);
    });

    test('authenticate forwards the prf salt', () async {
      await passkeys.authenticate(_authenticateRequest(prf: 'prfSalt'));

      expect(api.capturedAuthenticatePrf, 'prfSalt');
    });

    test(
      'authenticate surfaces the prf result in clientExtensionResults',
      () async {
        api.authenticatePrfResultFirst = 'derivedSecret';

        final response = await passkeys.authenticate(
          _authenticateRequest(prf: 'prfSalt'),
        );

        expect(response.clientExtensionResults, {
          'prf': {
            'enabled': true,
            'results': {'first': 'derivedSecret'},
          },
        });
      },
    );

    test(
      'authenticate without a prf result has no clientExtensionResults',
      () async {
        final response = await passkeys.authenticate(_authenticateRequest());

        expect(api.capturedAuthenticatePrf, isNull);
        expect(response.clientExtensionResults, isNull);
      },
    );
  });
}

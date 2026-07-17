import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _ThrowingPlatform extends PasskeysPlatform
    with MockPlatformInterfaceMixin {
  _ThrowingPlatform(this.exception);

  final PlatformException exception;

  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {}

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    throw exception;
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) async {
    throw exception;
  }

  @override
  Future<AvailabilityType> getAvailability() {
    throw UnimplementedError();
  }
}

AuthenticateRequestType _authenticateRequest() => const AuthenticateRequestType(
  relyingPartyId: 'example.com',
  challenge: 'Y2hhbGxlbmdl',
  mediation: MediationType.Optional,
  preferImmediatelyAvailableCredentials: true,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('authenticate maps platform error codes to typed exceptions', () {
    Future<void> expectMapping(
      String code,
      Matcher matcher, {
      String? message,
    }) async {
      PasskeysPlatform.instance = _ThrowingPlatform(
        PlatformException(code: code, message: message),
      );
      final authenticator = PasskeyAuthenticator();

      await expectLater(
        () => authenticator.authenticate(_authenticateRequest()),
        throwsA(matcher),
      );
    }

    // Regression test for
    // https://github.com/corbado/flutter-passkeys/issues/262 (duplicate of
    // #236). On non-English devices the native layer now surfaces
    // `no-credentials-available` for the "no passkeys on device" case
    // instead of `cancelled`, so it must not be mapped to
    // PasskeyAuthCancelledException.
    test(
      'no-credentials-available throws NoCredentialsAvailableException',
      () async {
        await expectMapping(
          'no-credentials-available',
          isA<NoCredentialsAvailableException>(),
        );
      },
    );

    test('cancelled still throws PasskeyAuthCancelledException', () async {
      await expectMapping('cancelled', isA<PasskeyAuthCancelledException>());
    });

    test('domain-not-associated throws DomainNotAssociatedException', () async {
      await expectMapping(
        'domain-not-associated',
        isA<DomainNotAssociatedException>(),
      );
    });
  });
}

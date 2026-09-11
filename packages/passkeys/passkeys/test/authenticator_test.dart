import 'dart:async';

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

  @override
  Future<RegisterResponseType> createRestoreCredential(
    RegisterRequestType request, {
    bool isCloudBackupEnabled = true,
  }) async {
    throw exception;
  }

  @override
  Future<AuthenticateResponseType> getRestoreCredential(
    AuthenticateRequestType request,
  ) async {
    throw exception;
  }

  @override
  Future<void> clearRestoreCredential() async {
    throw exception;
  }
}

class _RecordingPlatform extends PasskeysPlatform
    with MockPlatformInterfaceMixin {
  RegisterRequestType? createRequest;
  bool? createIsCloudBackupEnabled;
  AuthenticateRequestType? getRequest;
  int clearCalls = 0;
  int cancelCalls = 0;

  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    cancelCalls++;
  }

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<AvailabilityType> getAvailability() {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseType> createRestoreCredential(
    RegisterRequestType request, {
    bool isCloudBackupEnabled = true,
  }) async {
    createRequest = request;
    createIsCloudBackupEnabled = isCloudBackupEnabled;
    return const RegisterResponseType(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'cdj',
      attestationObject: 'ao',
      transports: [],
    );
  }

  @override
  Future<AuthenticateResponseType> getRestoreCredential(
    AuthenticateRequestType request,
  ) async {
    getRequest = request;
    return const AuthenticateResponseType(
      id: 'id',
      rawId: 'rawId',
      clientDataJSON: 'cdj',
      authenticatorData: 'ad',
      signature: 'sig',
      userHandle: 'uh',
    );
  }

  @override
  Future<void> clearRestoreCredential() async {
    clearCalls++;
  }
}

/// Models an authentication that is still waiting on the user, so a test can
/// observe whether an unrelated call cancels it. Restore credentials are
/// unsupported here, matching every platform other than Android.
class _PendingAuthenticationPlatform extends PasskeysPlatform
    with MockPlatformInterfaceMixin {
  final _pending = Completer<AuthenticateResponseType>();
  var _authenticationInFlight = false;

  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    // Only an operation that already reached the platform can be cancelled,
    // so authenticate's own pre-dispatch cancel is a no-op here.
    if (_authenticationInFlight && !_pending.isCompleted) {
      _pending.completeError(PlatformException(code: 'cancelled'));
    }
  }

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) {
    _authenticationInFlight = true;
    return _pending.future;
  }

  @override
  Future<AvailabilityType> getAvailability() {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseType> createRestoreCredential(
    RegisterRequestType request, {
    bool isCloudBackupEnabled = true,
  }) async {
    throw PlatformException(code: 'restore-credential-unsupported');
  }

  @override
  Future<AuthenticateResponseType> getRestoreCredential(
    AuthenticateRequestType request,
  ) async {
    throw PlatformException(code: 'restore-credential-unsupported');
  }

  @override
  Future<void> clearRestoreCredential() async {
    throw PlatformException(code: 'restore-credential-unsupported');
  }
}

RegisterRequestType _registerRequest({String challenge = 'Y2hhbGxlbmdl'}) =>
    RegisterRequestType(
      challenge: challenge,
      relyingParty: RelyingPartyType(id: 'example.com', name: 'Example'),
      user: const UserType(id: 'dXNlcg', name: 'user', displayName: 'User'),
      excludeCredentials: const [],
    );

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

  group('restore credentials', () {
    Future<void> expectMapping(
      String code,
      Matcher matcher,
      Future<void> Function(PasskeyAuthenticator authenticator) call,
    ) async {
      PasskeysPlatform.instance = _ThrowingPlatform(
        PlatformException(code: code),
      );
      final authenticator = PasskeyAuthenticator();

      await expectLater(() => call(authenticator), throwsA(matcher));
    }

    test(
      'createRestoreCredential forwards the request and the backup flag',
      () async {
        final platform = _RecordingPlatform();
        PasskeysPlatform.instance = platform;
        final authenticator = PasskeyAuthenticator();

        final response = await authenticator.createRestoreCredential(
          _registerRequest(),
          isCloudBackupEnabled: false,
        );

        expect(platform.cancelCalls, isZero);
        expect(platform.createRequest?.challenge, 'Y2hhbGxlbmdl');
        expect(platform.createIsCloudBackupEnabled, isFalse);
        expect(response.id, 'id');
      },
    );

    test('createRestoreCredential defaults to cloud backup', () async {
      final platform = _RecordingPlatform();
      PasskeysPlatform.instance = platform;

      await PasskeyAuthenticator().createRestoreCredential(_registerRequest());

      expect(platform.createIsCloudBackupEnabled, isTrue);
    });

    test('createRestoreCredential validates the challenge first', () async {
      final platform = _RecordingPlatform();
      PasskeysPlatform.instance = platform;

      await expectLater(
        () => PasskeyAuthenticator().createRestoreCredential(
          _registerRequest(challenge: 'not base64url!'),
        ),
        throwsA(isA<MalformedBase64UrlChallenge>()),
      );
      expect(platform.createRequest, isNull);
    });

    test('getRestoreCredential forwards the request', () async {
      final platform = _RecordingPlatform();
      PasskeysPlatform.instance = platform;

      final response = await PasskeyAuthenticator().getRestoreCredential(
        _authenticateRequest(),
      );

      expect(platform.cancelCalls, isZero);
      expect(platform.getRequest?.relyingPartyId, 'example.com');
      expect(response.signature, 'sig');
    });

    // An unsupported restore call used to cancel whatever passkey operation
    // was in flight, so an app could lose an ongoing authentication just by
    // asking for a restore credential on a platform that has none.
    test('restore calls leave an ongoing authentication untouched', () async {
      final platform = _PendingAuthenticationPlatform();
      PasskeysPlatform.instance = platform;
      final authenticator = PasskeyAuthenticator();

      var authenticationSettled = false;
      unawaited(
        authenticator
            .authenticate(_authenticateRequest())
            .then<void>(
              (_) => authenticationSettled = true,
              onError: (_) => authenticationSettled = true,
            ),
      );
      await pumpEventQueue();

      await expectLater(
        () => authenticator.getRestoreCredential(_authenticateRequest()),
        throwsA(isA<RestoreCredentialUnsupportedException>()),
      );
      await expectLater(
        () => authenticator.createRestoreCredential(_registerRequest()),
        throwsA(isA<RestoreCredentialUnsupportedException>()),
      );
      await pumpEventQueue();

      expect(authenticationSettled, isFalse);
    });

    test('clearRestoreCredential forwards to the platform', () async {
      final platform = _RecordingPlatform();
      PasskeysPlatform.instance = platform;

      await PasskeyAuthenticator().clearRestoreCredential();

      expect(platform.clearCalls, 1);
    });

    test(
      'restore-credential-unsupported throws '
      'RestoreCredentialUnsupportedException',
      () async {
        await expectMapping(
          'restore-credential-unsupported',
          isA<RestoreCredentialUnsupportedException>(),
          (authenticator) =>
              authenticator.createRestoreCredential(_registerRequest()),
        );
        await expectMapping(
          'restore-credential-unsupported',
          isA<RestoreCredentialUnsupportedException>(),
          (authenticator) =>
              authenticator.getRestoreCredential(_authenticateRequest()),
        );
      },
    );

    test(
      'android-no-credential throws NoCredentialsAvailableException',
      () async {
        await expectMapping(
          'android-no-credential',
          isA<NoCredentialsAvailableException>(),
          (authenticator) =>
              authenticator.getRestoreCredential(_authenticateRequest()),
        );
      },
    );

    test('android-unhandled throws UnhandledAuthenticatorException', () async {
      await expectMapping(
        'android-unhandled: some-type',
        isA<UnhandledAuthenticatorException>(),
        (authenticator) =>
            authenticator.createRestoreCredential(_registerRequest()),
      );
    });

    test('unknown codes are rethrown as PlatformException', () async {
      await expectMapping(
        'something-else',
        isA<PlatformException>(),
        (authenticator) => authenticator.clearRestoreCredential(),
      );
    });
  });
}

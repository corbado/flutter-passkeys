import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/availability.dart';
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
  ) =>
      throw UnimplementedError();

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
      final selection =
          AuthenticatorSelectionType.fromJson(<String, dynamic>{});

      expect(selection.requireResidentKey, isFalse);
      expect(selection.userVerification, 'preferred');
    });

    test('derives residentKey as discouraged when requireResidentKey is false',
        () {
      final selection = AuthenticatorSelectionType.fromJson({
        'requireResidentKey': false,
      });

      expect(selection.residentKey, 'discouraged');
    });

    test('derives residentKey as required when requireResidentKey is true', () {
      final selection = AuthenticatorSelectionType.fromJson({
        'requireResidentKey': true,
      });

      expect(selection.residentKey, 'required');
    });

    test('derives residentKey from default requireResidentKey when both absent',
        () {
      final selection =
          AuthenticatorSelectionType.fromJson(<String, dynamic>{});

      expect(selection.residentKey, 'discouraged');
    });

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
}

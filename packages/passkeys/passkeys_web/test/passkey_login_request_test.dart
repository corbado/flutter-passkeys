import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/types.dart';
import 'package:passkeys_web/models/passkey_login_request.dart';

PasskeyLoginRequest _requestWithTransports(List<String> transports) =>
    PasskeyLoginRequest.fromPlatformType(
      'example.com',
      'AAAA',
      60000,
      null,
      [CredentialType(type: 'public-key', id: 'AQID', transports: transports)],
      MediationType.Optional,
    );

void main() {
  group('PasskeyLoginRequest.fromPlatformType', () {
    test('ignores unknown transports', () {
      final request = _requestWithTransports(['internal', 'carrier-pigeon']);

      expect(request.publicKey.allowCredentials!.single.transports, [
        AuthenticatorTransport.Internal,
      ]);
    });

    test('maps every WebAuthn transport', () {
      final request = _requestWithTransports([
        'hybrid',
        'internal',
        'usb',
        'nfc',
        'ble',
        'smart-card',
      ]);

      expect(
        request.publicKey.allowCredentials!.single.toJson()['transports'],
        [
          'hybrid',
          'internal',
          'usb',
          'nfc',
          'ble',
          'smart-card',
        ],
      );
    });

    test('maps the legacy bluetooth value to ble', () {
      final request = _requestWithTransports(['bluetooth']);

      expect(
        request.publicKey.allowCredentials!.single.toJson()['transports'],
        [
          'ble',
        ],
      );
    });
  });

  group('AuthenticatorTransport.fromPlatformType', () {
    test('throws for unknown transports', () {
      expect(
        () => AuthenticatorTransport.fromPlatformType('carrier-pigeon'),
        throwsArgumentError,
      );
    });
  });
}

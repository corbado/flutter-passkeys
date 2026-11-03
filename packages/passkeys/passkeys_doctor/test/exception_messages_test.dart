import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_doctor/src/types/exception_messages.dart';

void main() {
  group('getExceptionInfo', () {
    test('uses the details marker for a cancellation', () async {
      final info = await getExceptionInfo(
        PlatformException(
          code: 'cancelled',
          details: 'android-credential-not-authenticated',
        ),
        [],
      );

      expect(info.title, 'CredentialNotAuthenticatedException');
    });

    test('falls back to the code without a details marker', () async {
      final info = await getExceptionInfo(
        PlatformException(code: 'cancelled', details: ''),
        [],
      );

      expect(info.title, 'PasskeyAuthCancelledException');
    });
  });
}

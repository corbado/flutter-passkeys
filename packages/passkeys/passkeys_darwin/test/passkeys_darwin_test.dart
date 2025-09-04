import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_darwin/passkeys_darwin.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PasskeysDarwin', () {
    test('can be registered', () {
      PasskeysDarwin.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysDarwin>());
    });
  });
}

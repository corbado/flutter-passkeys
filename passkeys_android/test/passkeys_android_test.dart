import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_android/passkeys_android.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PasskeysAndroid', () {
    const kPlatformName = 'Android';
    late PasskeysAndroid passkeys;
    late List<MethodCall> log;

    test('can be registered', () {
      PasskeysAndroid.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysAndroid>());
    });
  });
}

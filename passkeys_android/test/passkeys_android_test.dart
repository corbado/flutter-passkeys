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

    setUp(() async {
      passkeys = PasskeysAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(passkeys.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      PasskeysAndroid.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await passkeys.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}

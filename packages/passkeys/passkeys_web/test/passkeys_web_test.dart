import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';

import 'package:passkeys_web/passkeys_web.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TestPluginWeb', () {
    const kPlatformName = 'Web';
    late PasskeysWeb testPlugin;

    setUp(() async {
      testPlugin = PasskeysWeb();
    });

    test('can be registered', () {
      PasskeysWeb.registerWith();
      expect(PasskeysPlatform.instance, isA<PasskeysPlatform>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await testPlugin.getPlatformName();
      expect(name, equals(kPlatformName));
    });
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corbado_auth_doctor/corbado_auth_doctor_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCorbadoAuthDoctor platform = MethodChannelCorbadoAuthDoctor();
  const MethodChannel channel = MethodChannel('corbado_auth_doctor');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

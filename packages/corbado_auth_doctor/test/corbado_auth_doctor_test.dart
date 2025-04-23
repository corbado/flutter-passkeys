import 'package:flutter_test/flutter_test.dart';
import 'package:corbado_auth_doctor/corbado_auth_doctor.dart';
import 'package:corbado_auth_doctor/corbado_auth_doctor_platform_interface.dart';
import 'package:corbado_auth_doctor/corbado_auth_doctor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCorbadoAuthDoctorPlatform
    with MockPlatformInterfaceMixin
    implements CorbadoAuthDoctorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CorbadoAuthDoctorPlatform initialPlatform = CorbadoAuthDoctorPlatform.instance;

  test('$MethodChannelCorbadoAuthDoctor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCorbadoAuthDoctor>());
  });

  test('getPlatformVersion', () async {
    CorbadoAuthDoctor corbadoAuthDoctorPlugin = CorbadoAuthDoctor();
    MockCorbadoAuthDoctorPlatform fakePlatform = MockCorbadoAuthDoctorPlatform();
    CorbadoAuthDoctorPlatform.instance = fakePlatform;

    expect(await corbadoAuthDoctorPlugin.getPlatformVersion(), '42');
  });
}

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
}

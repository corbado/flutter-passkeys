import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

class PasskeysMock extends PasskeysPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<bool> canAuthenticate() async => false;

  @override
  Future<RegisterResponseType> register(
    String challenge,
    RelyingPartyType relyingParty,
    UserType user,
    String rawOptions,
  ) async =>
      throw UnimplementedError();

  @override
  Future<AuthenticateResponseType> authenticate(
    String relyingPartyId,
    String challenge,
    String rawOptions,
  ) =>
      throw UnimplementedError();
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

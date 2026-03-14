import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/availability.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// An implementation of [PasskeysPlatform] that uses method channels.
class MethodChannelPasskeys extends PasskeysPlatform {
  @override
  Future<bool> canAuthenticate() async => throw UnimplementedError();

  @override
  Future<RegisterResponseType> register(RegisterRequestType request, String? salt) async => throw UnimplementedError();

  @override
  Future<AuthenticateResponseType> authenticate(AuthenticateRequestType request, String? salt) => throw UnimplementedError();

  @override
  Future<void> cancelCurrentAuthenticatorOperation() {
    return Future.value();
  }

  @override
  Future<AvailabilityType> getAvailability() => throw UnimplementedError();
}

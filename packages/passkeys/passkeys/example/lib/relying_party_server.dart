import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';

// For the example we make use of a shared and preconfigured Corbado project.
// This makes it easy to setup (no configuration required for the developer).
class SharedRelyingPartyServer
    extends RelyingPartyServer<RpRequest, RpResponse> {
  SharedRelyingPartyServer()
      : _auth = CorbadoPasskeyBackend('pro-6244024196016258271');

  final CorbadoPasskeyBackend _auth;

  Future<void> init() async {
    await _auth.init();
  }

  @override
  Future<RpResponse> completeAuthenticate(
      AuthenticationCompleteRequest request) async {
    try {
      await _auth.completeAuthenticate(request);
      return const RpResponse(success: true);
    } catch (e) {
      return const RpResponse(success: false);
    }
  }

  @override
  Future<RpResponse> completeRegister(
      RegistrationCompleteRequest request) async {
    try {
      await _auth.completeRegister(request);
      return const RpResponse(success: true);
    } catch (e) {
      return const RpResponse(success: false);
    }
  }

  @override
  Future<AuthenticationInitResponse> initAuthenticate(RpRequest request) {
    return _auth.initAuthenticate(AuthRequest(request.email));
  }

  @override
  Future<RegistrationInitResponse> initRegister(RpRequest request) {
    return _auth.initRegister(AuthRequest(request.email));
  }
}

class RpRequest {
  const RpRequest({required this.email});

  final String email;
}

class RpResponse {
  const RpResponse({required this.success});

  final bool success;
}

import 'package:flutter/cupertino.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/backend/passkey_backend.dart';
import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/registration.dart';
import 'package:passkeys_platform_interface/types/types.dart';

///
class PasskeyAuth {
  ///
  PasskeyAuth(this._backend) : _authenticator = PasskeyAuthenticator();

  final PasskeyAuthenticator _authenticator;
  final PasskeyBackend _backend;

  ///
  Future<bool> isSupported() async {
    return _authenticator.canAuthenticate();
  }

  ///
  dynamic registerWithEmail(String email) async {
    debugPrint('registerWithEmail: $email');
    final initResponse = await _backend.initRegister(email);

    final challenge = initResponse.challenge;
    final user = UserType(
      name: initResponse.user.name,
      id: initResponse.user.id,
    );
    final rp = RelyingPartyType(
      name: initResponse.rp.name,
      id: initResponse.rp.id,
    );

    final authenticatorResponse = await _authenticator.register(
        challenge, rp, user, initResponse.rawOptions);

    final completeRequest = RegistrationCompleteRequest(
      id: authenticatorResponse.id,
      rawId: authenticatorResponse.rawId,
      clientDataJSON: authenticatorResponse.clientDataJSON,
      attestationObject: authenticatorResponse.attestationObject,
    );
    final completeResponse = await _backend.completeRegister(completeRequest);

    return completeResponse;
  }

  ///
  dynamic authenticateWithEmail(String email) async {
    final initResponse = await _backend.initAuthenticate(email);

    final authenticatorResponse = await _authenticator.authenticate(
      initResponse.rpId,
      initResponse.challenge,
      initResponse.rawOptions,
    );

    final completeRequest = AuthenticationCompleteRequest(
      id: authenticatorResponse.id,
      rawId: authenticatorResponse.rawId,
      clientDataJSON: authenticatorResponse.clientDataJSON,
      authenticatorData: authenticatorResponse.authenticatorData,
      signature: authenticatorResponse.signature,
    );
    final completeResponse =
        await _backend.completeAuthenticate(completeRequest);

    return completeResponse;
  }
}

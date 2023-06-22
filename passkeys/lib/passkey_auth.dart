import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/backend/passkey_backend.dart';
import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/registration.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

///y
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
    final initResponse = await _backend.initRegister(email);

    final challenge = initResponse.challenge;
    final user = UserType(
      displayName: initResponse.user.displayName,
      name: initResponse.user.name,
      id: initResponse.user.id,
    );
    final rp = RelyingPartyType(
      name: initResponse.rp.name,
      id: initResponse.rp.id,
    );

    final authSelectionType = AuthenticatorSelectionType(
      authenticatorAttachment:
          initResponse.authenticatorSelection.authenticatorAttachment,
      requireResidentKey:
          initResponse.authenticatorSelection.requireResidentKey,
      residentKey: initResponse.authenticatorSelection.residentKey,
      userVerification: initResponse.authenticatorSelection.userVerification,
    );

    final authenticatorResponse = await _authenticator.register(
      challenge,
      rp,
      user,
      authSelectionType,
      initResponse.pubKeyCredParams
          ?.map(
            (e) => PubKeyCredParamType(
              alg: e.alg,
              type: e.type,
            ),
          )
          .cast<PubKeyCredParamType>()
          .toList(),
      initResponse.timeout,
      initResponse.attestation,
    );

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
      initResponse.timeout,
      initResponse.userVerification,
      initResponse.allowCredentials
          ?.map(
            (e) => AllowCredential(
              id: e.id,
              type: e.type,
              transports: e.transports,
            ),
          )
          .cast<AllowCredentialType>()
          .toList(),
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

import 'package:flutter/services.dart';
import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// Enables passkey based registration and authentication.
/// Entrypoint of the Flutter passkeys package.
///
/// Generic type [Request] indicates the type that has to be provided to
/// get registration and authentication going.
/// Generic type [Response] indicates the type that will be returned after
/// successful registration or authentication.
/// Both types depend on how [RelyingPartyServer] works.
///
/// [PasskeyAuth] connects [PasskeyAuthenticator] (WebAuthn Authenticator) and
/// [RelyingPartyServer] (WebAuthn relying party server)
///
/// The [PasskeyAuthenticator] depends on the platform (e.g. iOS, Android, web).
/// Currently this package contains implementations for iOS and Android.
///
/// The [RelyingPartyServer] implementation depends on the relying party server.
/// This package comes with an implementation that enables usage of the Corbado
/// backend as a relying party server.
/// Additional backends can be setup easily though by implementing
/// [RelyingPartyServer].
class PasskeyAuth<Request, Response> {
  /// Constructor
  PasskeyAuth(this._backend) : _authenticator = PasskeyAuthenticator();

  final PasskeyAuthenticator _authenticator;
  final RelyingPartyServer<Request, Response> _backend;

  /// Determines if passkeys are supported on the current platform by checking
  /// if an authenticator is available.
  Future<bool> isSupported() async {
    return _authenticator.canAuthenticate();
  }

  /// Implements the registration flow.
  ///
  /// Consists of the following three steps:
  /// 1. Ask the relying party server for a challenge.
  ///    At this point the relying party can decide to block the registration
  ///    (e.g. because such a user already exists).
  ///    This will result in [_backend] throwing an [Exception].
  /// 2. Ask the [_authenticator] to create a new passkey and solve the
  ///    challenge.
  /// 3. Send the solution of the challenge back to the relying party server.
  /// For a successful solution the relying party server will respond
  /// with [Response].
  ///
  /// The contents of [Response] depend on the relying party server
  /// (the [_backend]), but usually it contains some user data (name, email) and
  /// some kind of token (e.g. a JWT token)
  ///
  /// returns null if the user did cancel the registration
  Future<Response?> registerWithEmail(Request request) async {
    final initResponse = await _backend.initRegister(request);

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

    try {
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
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          return null;
        default:
          rethrow;
      }
    }
  }

  /// Signs in an existing user identified by an email address.
  ///
  /// Authentication consists of the following three steps:
  /// 1. Ask the relying party server for a challenge.
  /// 2. Ask the [_authenticator] to solve the challenge.
  /// 3. Send the solution of the challenge back to the relying party server.
  /// For a successful solution the relying party server will respond
  /// with [Response].
  ///
  /// The contents of [Response] depend on the relying party server
  /// (the [_backend]), but usually it contains some user data (name, email) and
  /// some kind of token (e.g. a JWT token).
  ///
  /// returns null if the user did cancel the authentication.
  Future<Response?> authenticateWithEmail(Request request) async {
    try {
      final initResponse = await _backend.initAuthenticate(request);
      final authenticatorResponse = await _authenticator.authenticate(
        initResponse.rpId,
        initResponse.challenge,
        initResponse.timeout,
        initResponse.userVerification,
        initResponse.allowCredentials
            ?.map(
              (e) => AllowCredentialType(
                id: e.id,
                type: e.type,
                transports: e.transports,
              ),
            )
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
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          return null;
        default:
          rethrow;
      }
    }
  }
}

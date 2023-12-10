import 'package:passkeys/authenticator/passkey_authenticator.dart';
import 'package:passkeys/authenticator/types.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';
import 'package:passkeys/sign_in_handler.dart';

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

  PasskeyAuthenticator get authenticator => _authenticator;

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

  /// Sign in an existing user using a passkey.
  /// While [authenticateWithEmail] can also be used to do this
  /// [authenticateWithAutocompletion] is the better way and should be used by
  /// default because it is more convenient for the user.
  Future<Response?> authenticateWithAutocompletion({
    required Request request,
  }) async {
    final initResponse = await _backend.initAuthenticate(request);

    return _completeSignIn(
      initResponse,
      mediationType: MediationType.Conditional,
    );
  }

  /// Sign in an existing user using a passkey.
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
    final initResponse = await _backend.initAuthenticate(request);
    return _completeSignIn(initResponse);
  }

  Future<Response> _completeSignIn(
    AuthenticationInitResponse initResponse, {
    MediationType mediationType = MediationType.Optional,
  }) async {
    final allowCredentials = initResponse.allowCredentials
        ?.map(
          (e) => AllowCredentialType(
            id: e.id,
            type: e.type,
            transports: e.transports,
          ),
        )
        .toList();
    final authenticatorResponse = await _authenticator.authenticate(
      initResponse.rpId,
      initResponse.challenge,
      initResponse.timeout,
      initResponse.userVerification,
      allowCredentials,
      mediationType,
    );

    final completeRequest = AuthenticationCompleteRequest(
      id: authenticatorResponse.id,
      rawId: authenticatorResponse.rawId,
      clientDataJSON: authenticatorResponse.clientDataJSON,
      authenticatorData: authenticatorResponse.authenticatorData,
      signature: authenticatorResponse.signature,
      userHandle: authenticatorResponse.userHandle,
    );
    final completeResponse =
        await _backend.completeAuthenticate(completeRequest);

    return completeResponse;
  }
}

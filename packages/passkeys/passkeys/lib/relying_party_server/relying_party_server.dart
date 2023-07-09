import 'package:passkeys/relying_party_server/types/authentication.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';

/// Defines an interface that an implementation of a relying party server should
/// comply to.
abstract class RelyingPartyServer<Request, Response> {
  /// Initiates the registration by asking for a challenge.
  Future<RegistrationInitResponse> initRegister(Request request);

  /// Completes the registration by sending the solution to the challenge back.
  Future<Response> completeRegister(
    RegistrationCompleteRequest request,
  );

  /// Initiates the authentication by asking for a challenge.
  Future<AuthenticationInitResponse> initAuthenticate(Request request);

  /// Completes the authentication by sending the solution to the challenge
  /// back.
  Future<Response> completeAuthenticate(
    AuthenticationCompleteRequest request,
  );
}

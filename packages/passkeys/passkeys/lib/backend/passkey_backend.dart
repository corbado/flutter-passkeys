import 'package:passkeys/backend/types/authentication.dart';
import 'package:passkeys/backend/types/registration.dart';

///
abstract class PasskeyBackend {
  ///
  Future<RegistrationInitResponse> initRegister(String email);

  ///
  Future<void> completeRegister(RegistrationCompleteRequest signedChallenge);

  ///
  Future<AuthenticationInitResponse> initAuthenticate(String email);

  ///
  Future<void> completeAuthenticate(
    AuthenticationCompleteRequest signedChallenge,
  );
}

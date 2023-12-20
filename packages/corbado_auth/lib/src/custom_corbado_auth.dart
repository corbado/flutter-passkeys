import 'dart:async';

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/corbado/corbado_stub.dart'
    if (dart.library.html) 'package:corbado_auth/src/services/corbado/corbado_web.dart'
    if (dart.library.io) 'package:corbado_auth/src/services/corbado/corbado_native.dart';
import 'package:corbado_auth/src/types/auth_response.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_auth/src/types/webauthn/authentication.dart';
import 'package:corbado_auth/src/types/webauthn/registration.dart';
import 'package:passkeys/authenticator.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CustomCorbadoAuth {
  /// Constructor
  CustomCorbadoAuth() : passkeyAuthenticator = PasskeyAuthenticator();

  final PasskeyAuthenticator passkeyAuthenticator;

  late CorbadoService corbadoService;

  Future<void> init(String projectId, {String? customDomain}) async {
    corbadoService = await createClient(projectId, customDomain: customDomain);
  }

  /// Signs up a user by registering a new passkey (using the passkeys package).
  Future<AuthResponse> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    final res1 =
        await corbadoService.startSignUpWithPasskey(email, fullName ?? email);
    final platformReq = res1.toPlatformType();
    final platformResponse = await passkeyAuthenticator.register(platformReq);
    final req2 =
        FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);
    final res2 = await corbadoService.finishSignUpWithPasskey(req2);

    return res2;
  }

  /// Signs up a user by sending out an email OTP (one-time password)
  /// Calling this method only initiates the OTP.
  /// When the user has provided the code he received by email completeEmailCode
  /// must be called to finish the sign up.
  Future<EmailOTPState> startSignUpWithEmailCode({
    required String email,
    String fullName = '',
  }) async {
    return corbadoService.startSignUpWithEmailCode(
      email,
      fullName,
    );
  }

  /// Completes an email OTP transaction.
  /// This can either be a sign up or a sign in.
  Future<AuthResponse> finishEmailCode({
    required String token,
    required String code,
  }) async {
    return corbadoService.completeEmailCode(
      token,
      code,
    );
  }

  /// Init a user sign in using email OTP.
  /// Similarly to registerWithEmailCode a email code will be sent to the user.
  /// This code must then be provided by calling completeEmailCode.
  Future<EmailOTPState> startLoginWithEmailCode({
    required String email,
  }) async {
    return corbadoService.startLoginWithEmailCode(email);
  }

  /// Signs in a user relying on a passkey.
  /// This is the recommended way to do sign in with passkeys as the user does
  /// not have to remember his username.
  ///
  /// This method should be called when the sign in page is loaded.
  /// Depending on the platform, the passkey ceremony will be started
  /// immediately without any user interaction (e.g. Android) or it requires
  /// additional user input (e.g. iOS or web where the user needs to click the
  /// TextField).
  Future<AuthResponse> autocompletedLoginWithPasskey() async {
    return _loginWithPasskey(conditional: true);
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<AuthResponse> loginWithPasskey({required String email}) async {
    return _loginWithPasskey(email: email, conditional: false);
  }

  Future<AuthResponse> _loginWithPasskey({
    required bool conditional,
    String email = '',
  }) async {
    final res1 = await corbadoService.startLoginWithPasskey(email, conditional);
    final platformReq =
        res1.toPlatformType(conditional: conditional);
    final platformResponse =
        await passkeyAuthenticator.authenticate(platformReq);
    final req2 =
        FinishLoginRequest.fromPlatformType(platformResponse);
    final res2 = await corbadoService.finishLoginWithPasskey(req2);

    return res2;
  }
}

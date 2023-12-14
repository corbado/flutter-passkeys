import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';

abstract class CorbadoService {
  final StorageService _storageService;
  late ApiClient frontendAPIClient;
  late PasskeyAuth<AuthRequest, AuthResponse> _passkeyAuth;

  CorbadoService(this._storageService);

  init(
    ApiClient frontendAPIClient,
    PasskeyAuth<AuthRequest, AuthResponse> passkeyAuth,
  ) {
    this.frontendAPIClient = frontendAPIClient;
    _passkeyAuth = passkeyAuth;
  }

  Future<String> startPasskeyAppend();

  Future<void> deletePasskey(String credentialID);

  Future<List<PasskeyInfo>> getPasskeys();

  Future<User> refreshToken();

  Future<EmailOTPState> signUpWithEmailCode(
    String email,
    String fullName,
  ) async {
    try {
      final req = EmailCodeRegisterStartReq(email: email, username: fullName);
      final res = await UsersApi(frontendAPIClient).emailCodeRegisterStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailLinkRegisterStart', '');
      }

      return EmailOTPState(EmailOTPFlow.SignUp, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeRegisterStart',
        e.message ?? '',
      );
    }
  }

  Future<User> signUpWithPasskey(
    String email,
    String fullName,
  ) async {
    final response = await _passkeyAuth
        .registerWithEmail(AuthRequest(email, username: fullName));
    // user has not finished the registration
    if (response == null) {
      throw Exception('User has not finished the registration');
    }

    final user = User.fromIdToken(response.token);
    await _postLogin(user, response.refreshToken);

    return user;
  }

  Future<EmailOTPState> loginWithEmailCode(
    String email,
  ) async {
    try {
      final req = EmailCodeLoginStartReq(username: email);
      final res = await UsersApi(frontendAPIClient).emailCodeLoginStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailCodeLoginStart', '');
      }

      return EmailOTPState(EmailOTPFlow.SignUp, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeLoginStart',
        e.message ?? '',
      );
    }
  }

  Future<User> loginWithPasskey(String email,
      {bool conditional = false}) async {
    AuthResponse? authResponse;
    if (conditional) {
      authResponse = await _passkeyAuth
          .authenticateWithAutocompletion(const AuthRequest(''));
    } else {
      authResponse =
          await _passkeyAuth.authenticateWithEmail(AuthRequest(email));
    }

    final user = User.fromIdToken(authResponse!.token);
    await _postLogin(user, authResponse.refreshToken);

    return user;
  }

  Future<User> completeEmailCode(
    String emailCodeID,
    String code,
  ) async {
    try {
      final req = EmailCodeConfirmReq(emailCodeID: emailCodeID, code: code);
      final res =
          await UsersApi(frontendAPIClient).emailCodeConfirmWithHttpInfo(req);
      final authResponse = await AuthResponse.fromHttpResponse(res);
      final user = User.fromIdToken(authResponse.token);
      await _postLogin(user, authResponse.refreshToken);

      return user;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeConfirm',
        e.message ?? '',
      );
    }
  }

  Future<void> _postLogin(User user, String? refreshToken) async {
    await _storageService.setUser(user);

    if (refreshToken != null) {
      await _storageService.setRefreshToken(refreshToken);
    }
  }
}

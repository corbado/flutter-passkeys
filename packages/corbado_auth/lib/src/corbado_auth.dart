import 'dart:async';
import 'dart:convert';

import 'package:corbado_auth/src/services/session_storage/secure_storage.dart';
import 'package:corbado_auth/src/types/auth_state.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_auth/src/types/passkey_info.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:passkeys/authenticator/types.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/exceptions.dart';
import 'package:passkeys/relying_party_server/corbado/types/registration.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';
import 'package:passkeys/sign_in_handler.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth(this._projectID, {String? customDomain})
      : _storage = SecureStorage(),
        _customDomain = customDomain;

  /// Should be listened to to get updates to the User object
  /// (e.g. updates to the idToken, sign in, sign out, changes to user data).
  /// userChanges fires more often than authStateChanges.
  Stream<User?> get userChanges => _userStreamController.stream;

  /// Should be listened to to get updates to a user's auth state
  /// (e.g. sign in, sign out).
  /// This is a subset of userChanges.
  Stream<AuthState> get authStateChanges => _authStateStreamController.stream;

  /// Should be listened to to get updates to a user's passkeys.
  Stream<List<PasskeyInfo>> get passkeysChanges =>
      _passkeysStreamController.stream;

  /// Returns the current value of the user object.
  Future<User?> get currentUser => _userStreamController.stream.first;

  late PasskeyAuth<AuthRequest, AuthResponse> _passkeyAuth;

  late ApiClient _frontendAPIClient;

  final StreamController<User?> _userStreamController =
  StreamController<User?>();

  final StreamController<AuthState> _authStateStreamController =
  StreamController<AuthState>();

  final StreamController<List<PasskeyInfo>> _passkeysStreamController =
  StreamController();

  // Used to persist information (e.g. idToken and refreshToken) securely.
  final SecureStorage _storage;
  final String _projectID;
  final String? _customDomain;
  String? _refreshToken;
  final _preemptiveRefreshDuration = const Duration(seconds: 240);
  Timer? _refreshTimer;

  // sign up section
  EmailOTPState? _emailOTPState;

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init() async {
    final relyingPartyServer = CorbadoPasskeyBackend(
      _projectID,
      customDomain: _customDomain,
    );
    await relyingPartyServer.init();

    _passkeyAuth = PasskeyAuth(relyingPartyServer);
    _frontendAPIClient = await relyingPartyServer.buildClient();

    try {
      final passkeysSupported = await _passkeyAuth.isSupported();
      if (!passkeysSupported) {
        debugPrint('passkeys are not supported on this device');
      }

      final maybeUser = await _storage.getUser();
      if (maybeUser == null) {
        _userStreamController.add(null);
        _authStateStreamController.add(AuthState.None);
        return;
      }

      final maybeRefreshToken = await _storage.getRefreshToken();
      await _postSignIn(maybeUser, maybeRefreshToken);
      await refreshToken();
    } catch (e) {
      debugPrint(e.toString());
      _userStreamController.add(null);
      _authStateStreamController.add(AuthState.None);
    }
  }

  /// Signs up a user by registering a new passkey (using the passkeys package).
  Future<void> registerWithPasskey({
    required String email,
    String fullName = '',
  }) async {
    final response = await _passkeyAuth
        .registerWithEmail(AuthRequest(email, username: fullName));
    // user has not finished the registration
    if (response == null) {
      return;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);
  }

  /// Signs up a user by sending out an email OTP (one-time password)
  /// Calling this method only initiates the OTP.
  /// When the user has provided the code he received by email completeEmailCode
  /// must be called to finish the sign up.
  Future<void> registerWithEmailCode({
    required String email,
    String fullName = '',
  }) async {
    try {
      final req = EmailCodeRegisterStartReq(email: email, username: fullName);
      final res =
      await UsersApi(_frontendAPIClient).emailCodeRegisterStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailLinkRegisterStart', '');
      }

      _emailOTPState = EmailOTPState(EmailOTPFlow.SignUp, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeRegisterStart',
        e.message ?? '',
      );
    }
  }

  /// Completes an email OTP transaction.
  /// This can either be a sign up or a sign in.
  Future<String?> completeEmailCode({
    required String code,
    bool askForPasskeyAppend = false,
  }) async {
    if (_emailOTPState == null) {
      return 'No OTP process has been started. Please start one first before you submit a code.';
    }

    final req =
    EmailCodeConfirmReq(emailCodeID: _emailOTPState!.token, code: code);
    try {
      final res =
      await UsersApi(_frontendAPIClient).emailCodeConfirmWithHttpInfo(req);
      final authResponse = await AuthResponse.fromHttpResponse(res);

      final user = User.fromIdToken(authResponse.token);
      final publishAuthState = !askForPasskeyAppend;
      await _postSignIn(
        user,
        authResponse.refreshToken,
        publishAuthState: publishAuthState,
      );
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeConfirm',
        e.message ?? '',
      );
    }

    return null;
  }

  /// Create a passkey for a user that is already signed in.
  /// This method can be called after a user has signed up using email OTP.
  Future<String?> appendPasskey() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('User must be logged in');
    }

    final PassKeyStartRsp? resStart;
    try {
      _frontendAPIClient.addDefaultHeader(
        'cookie',
        'cbo_long_session=$refreshToken',
      );
      resStart =
      await UsersApi(_frontendAPIClient).passKeyAppendStart(EmptyReq());
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendStart',
        e.message ?? '',
      );
    }

    try {
      final json = jsonDecode(resStart!.data.challenge) as Map<String, dynamic>;
      final resAuthenticator = await _registerPasskey(json);
      final signedChallenge = jsonEncode(
        CorbadoRegisterSignedChallengeRequest(
          id: resAuthenticator.id,
          rawId: resAuthenticator.rawId,
          response: CorbadoRegisterSignedChallengeRequestResponse(
            clientDataJSON: resAuthenticator.clientDataJSON,
            attestationObject: resAuthenticator.attestationObject,
          ),
        ).toJson(),
      );
      try {
        final reqFinish = PassKeyFinishReq(signedChallenge: signedChallenge);
        await UsersApi(_frontendAPIClient).passKeyAppendFinish(reqFinish);
      } on ApiException catch (e) {
        throw ExceptionFactory.fromBackendMessage(
          'passKeyAppendFinish',
          e.message ?? '',
        );
      }

      await _loadPasskeys();
      return null;
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'cancelled':
          throw PasskeyAuthCancelledException();
        default:
          rethrow;
      }
    } on Exception {
      rethrow;
    }
  }

  /// Finish a user sign up.
  /// This must be called to signal that the sign up processed has been finished
  /// Usually this method is called when a user is finished with appending a
  /// passkey (either because he has completed the procedure or he skipped it).
  void finishSignUp() {
    _authStateStreamController.add(AuthState.SignedIn);
  }

  /// Init a user sign in using email OTP.
  /// Similarly to registerWithEmailCode a email code will be sent to the user.
  /// This code must then be provided by calling completeEmailCode.
  Future<void> signInWithEmailCode({
    required String email,
  }) async {
    try {
      final req = EmailCodeLoginStartReq(username: email);
      final res = await UsersApi(_frontendAPIClient).emailCodeLoginStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailCodeLoginStart', '');
      }

      _emailOTPState =
          EmailOTPState(EmailOTPFlow.SignIn, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeLoginStart',
        e.message ?? '',
      );
    }
  }

  /// Signs in a user relying on a passkey.
  /// This is the recommended way to do sign in with passkeys as the user does
  /// not have to remember his username.
  ///
  /// This method should be called when the sign in page is loaded.
  /// It returns a SignInHandler.
  /// As soon as the user focuses the username input field for sign in,
  /// this SignInHandler should be completed by calling .complete() on it.
  /// Now the user gets a list of all available passkeys.
  /// As soon as he selects one and provides his biometrics he is logged in.
  Future<SignInHandler> autocompletedSignInWithPasskey() async {
    return _passkeyAuth.authenticateWithAutocompletion(
      request: const AuthRequest(''),
      callback: (response) async {
        final user = User.fromIdToken(response.token);
        await _postSignIn(user, response.refreshToken);
      },
    );
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<void> signInWithPasskey({required String email}) async {
    final response =
    await _passkeyAuth.authenticateWithEmail(AuthRequest(email));
    // user has not finished the authentication
    if (response == null) {
      return;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);
  }

  Future<void> deletePasskey(String credentialID) async {
    try {
      final idToken = (await _storage.getUser())?.idToken;
      if (_refreshToken == null) {
        throw Exception('missing _refreshToken');
      }

      _frontendAPIClient.addDefaultHeader(
          'cookie', 'cbo_long_session=$_refreshToken');
      final resStart = await UsersApi(_frontendAPIClient)
          .currentUserPassKeyDelete(credentialID);
      await _loadPasskeys();
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'currentUserPassKeyDelete',
        e.message ?? '',
      );
    }
  }

  Future<RegisterResponseType> _registerPasskey(
      Map<String, dynamic> json,) async {
    final r = CorbadoRegisterChallenge.fromJson(json)
        .toRegisterInitResponse();
    final challenge = r.challenge;
    final user = UserType(
      displayName: r.user.displayName,
      name: r.user.name,
      id: r.user.id,
    );
    final rp = RelyingPartyType(name: r.rp.name, id: r.rp.id);
    final authSelectionType = AuthenticatorSelectionType(
      authenticatorAttachment: r.authenticatorSelection
          .authenticatorAttachment,
      requireResidentKey: r.authenticatorSelection.requireResidentKey,
      residentKey: r.authenticatorSelection.residentKey,
      userVerification: r.authenticatorSelection.userVerification,
    );

    return _passkeyAuth.authenticator.register(
      challenge,
      rp,
      user,
      authSelectionType,
      r.pubKeyCredParams
          ?.map(
            (e) =>
            PubKeyCredParamType(
              alg: e.alg,
              type: e.type,
            ),
      )
          .cast<PubKeyCredParamType>()
          .toList(),
      r.timeout,
      r.attestation,
    );
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<void> _loadPasskeys() async {
    _frontendAPIClient.addDefaultHeader(
      'cookie',
      'cbo_long_session=$_refreshToken',
    );
    final response = await UsersApi(_frontendAPIClient).currentUserPassKeyGet();
    if (response == null) {
      return;
    }

    final passkeys =
    response.data.passkeys.map(PasskeyInfo.fromResponse).toList();

    _passkeysStreamController.sink.add(passkeys);
  }

  /// Refresh the current idToken.
  /// This requires a valid refreshToken that has been obtained during signIn
  /// or signUp.
  Future<User> refreshToken() async {
    if (_refreshToken == null) {
      throw Exception('Stopped refreshToken: missing refresh token.');
    }

    _frontendAPIClient.addDefaultHeader(
      'cookie',
      'cbo_long_session=$_refreshToken',
    );
    final response =
    await SessionsApi(_frontendAPIClient).sessionRefresh(EmptyReq());
    if (response == null || response.shortSession == null) {
      throw Exception('Stopped refreshToken: missing token in response.');
    }

    final user = User.fromIdToken(response.shortSession!.value);
    await _storage.setUser(user);
    _userStreamController.add(user);

    return user;
  }

  Future<void> _postSignIn(User user,
      String? refreshToken, {
        bool publishAuthState = true,
      }) async {
    await _storage.setUser(user);

    if (refreshToken != null) {
      await _storage.setRefreshToken(refreshToken);
      _refreshToken = refreshToken;
      _scheduleRefreshRoutine(user);
    }

    _userStreamController.add(user);
    if (publishAuthState) _authStateStreamController.add(AuthState.SignedIn);

    await _loadPasskeys();
  }

  void _scheduleRefreshRoutine(User user) {
    // if another refresh has already been scheduled we stop that one
    // this is not expected => if it occurs there is a problem with the code
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      _refreshTimer!.cancel();
    }

    _refreshTimer = Timer(_getWaitDurationForNextRefresh(user), () async {
      try {
        final user = await refreshToken();
        _scheduleRefreshRoutine(user);
      } catch (e) {
        await Future.delayed(const Duration(seconds: 10));
        debugPrint(e.toString());
        _scheduleRefreshRoutine(user);
      }
    });
  }

  Duration _getWaitDurationForNextRefresh(User user) {
    final now = (DateTime
        .now()
        .millisecondsSinceEpoch / 1000).round();

    // is token already timed out?
    if (user.decoded.exp < now) {
      return const Duration(seconds: 60);
    }

    final lifetime = Duration(seconds: user.decoded.exp - now);
    final wait = lifetime - _preemptiveRefreshDuration;

    return wait;
  }

  /// Sign the user out.
  /// Removed all state from persistent storage.
  Future<void> signOut() async {
    await _storage.clear();
    _refreshTimer?.cancel();

    _authStateStreamController.add(AuthState.None);
    _userStreamController.add(null);
    _passkeysStreamController.add([]);
  }
}

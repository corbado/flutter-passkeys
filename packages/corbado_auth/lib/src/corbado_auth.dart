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

/// The entrypoint for the Cobardo Auth SDK.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth(this._projectID) {
    _storage = SecureStorage();
  }

  ///
  late PasskeyAuth<AuthRequest, AuthResponse> _passkeyAuth;

  late ApiClient _client;

  /// Should be listened to to get all updates to the User object
  /// (e.g. updates to the idToken, sign in, sign out, changes to user data).
  final StreamController<User?> _userStreamController =
      StreamController<User?>();

  /// Should be listened to to get auth events
  /// (e.g. sign in, sign out)
  final StreamController<User?> _authStateStreamController =
      StreamController<User?>();

  final StreamController<AuthState> _authStateNewStreamController =
      StreamController<AuthState>();

  final StreamController<List<PasskeyInfo>> _passkeysStreamController =
      StreamController();

  Stream<User?> get userChanges => _userStreamController.stream;

  Stream<User?> get authStateChanges => _authStateStreamController.stream;

  Stream<AuthState> get authStateNewChanges =>
      _authStateNewStreamController.stream;

  Stream<List<PasskeyInfo>> get passkeysChanges =>
      _passkeysStreamController.stream;

  /// Returns the current value of the user object.
  Future<User?> get currentUser => _userStreamController.stream.first;

  /// Used to persist information (e.g. idToken and refreshToken) securely.
  late SecureStorage _storage;

  final String _projectID;

  String? _refreshToken;

  final _preemptiveRefreshDuration = const Duration(seconds: 240);

  Timer? _refreshTimer;

  // sign up section
  EmailOTPState? _emailOTPState;

  /// Sets up the userStream.
  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init() async {
    final relyingPartyServer = CorbadoPasskeyBackend(_projectID);
    await relyingPartyServer.init();
    _passkeyAuth = PasskeyAuth(relyingPartyServer);
    _client = await relyingPartyServer.buildClient(_projectID);

    try {
      final passkeysSupported = await _passkeyAuth.isSupported();
      if (!passkeysSupported) {
        debugPrint('passkeys are not supported on this device');
      }

      final maybeUser = await _storage.getUser();
      if (maybeUser == null) {
        _userStreamController.add(null);
        _authStateStreamController.add(null);
        _authStateNewStreamController.add(AuthState.None);
        return;
      }

      final maybeRefreshToken = await _storage.getRefreshToken();
      await _postSignIn(maybeUser, maybeRefreshToken);
      await refreshToken();
    } catch (e) {
      debugPrint(e.toString());
      _userStreamController.add(null);
      _authStateNewStreamController.add(AuthState.None);
      return _authStateStreamController.add(null);
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
      return null;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);
  }

  Future<void> registerWithEmailCode({
    required String email,
    String fullName = '',
  }) async {
    try {
      final req = EmailCodeRegisterStartReq(email: email, username: fullName);
      final res = await UsersApi(_client).emailCodeRegisterStart(req);
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

  Future<String?> completeEmailCode({
    required String code,
  }) async {
    if (_emailOTPState == null) {
      return 'No OTP process has been started. Please start one first before you submit a code.';
    }

    final req =
        EmailCodeConfirmReq(emailCodeID: _emailOTPState!.token, code: code);
    try {
      final res = await UsersApi(_client).emailCodeConfirm(req);
      if (res == null) {
        throw UnexpectedBackendException('emailLinkConfirm', '');
      }

      final user = User.fromIdToken(res.data.shortSession!.value);
      switch (_emailOTPState!.flow) {
        case EmailOTPFlow.SignIn:
          await _postSignIn(user, res.data.longSession);
        case EmailOTPFlow.SignUp:
          await _postSignIn(user, res.data.longSession,
              publishAuthState: false);
      }
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
          'emailCodeConfirm', e.message ?? '');
    }

    return null;
  }

  Future<String?> appendPasskey() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('User must be logged in');
    }

    final PassKeyStartRsp? resStart;
    try {
      _client.addDefaultHeader('cookie', 'cbo_long_session=$refreshToken');
      resStart = await UsersApi(_client).passKeyAppendStart(EmptyReq());
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendStart',
        e.message ?? '',
      );
    }

    final json = jsonDecode(resStart!.data.challenge) as Map<String, dynamic>;
    final r = CorbadoRegisterChallenge.fromJson(json).toRegisterInitResponse();
    final challenge = r.challenge;
    final user = UserType(
      displayName: r.user.displayName,
      name: r.user.name,
      id: r.user.id,
    );
    final rp = RelyingPartyType(name: r.rp.name, id: r.rp.id);
    final authSelectionType = AuthenticatorSelectionType(
      authenticatorAttachment: r.authenticatorSelection.authenticatorAttachment,
      requireResidentKey: r.authenticatorSelection.requireResidentKey,
      residentKey: r.authenticatorSelection.residentKey,
      userVerification: r.authenticatorSelection.userVerification,
    );

    final resAuthenticator = await _passkeyAuth.authenticator.register(
      challenge,
      rp,
      user,
      authSelectionType,
      r.pubKeyCredParams
          ?.map(
            (e) => PubKeyCredParamType(
              alg: e.alg,
              type: e.type,
            ),
          )
          .cast<PubKeyCredParamType>()
          .toList(),
      r.timeout,
      r.attestation,
    );

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
      await UsersApi(_client).passKeyAppendFinish(reqFinish);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendFinish',
        e.message ?? '',
      );
    }

    _authStateNewStreamController.add(AuthState.SignedIn);
    return null;
  }

  void finishSignUp() {
    _authStateNewStreamController.add(AuthState.SignedIn);
  }

  Future<void> signInWithEmailCode({
    required String email,
  }) async {
    try {
      final req = EmailCodeLoginStartReq(username: email);
      final res = await UsersApi(_client).emailCodeLoginStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailCodeLoginStart', '');
      }

      _emailOTPState = EmailOTPState(EmailOTPFlow.SignIn, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeLoginStart',
        e.message ?? '',
      );
    }
  }

  /// Signs in a user relying on a passkey.
  Future<void> signInWithPasskey({required String email}) async {
    final response =
        await _passkeyAuth.authenticateWithEmail(AuthRequest(email));
    // user has not finished the authentication
    if (response == null) {
      return null;
    }

    final user = User.fromIdToken(response.token);
    await _postSignIn(user, response.refreshToken);
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<void> _loadPasskeys() async {
    _client.addDefaultHeader('cookie', 'cbo_long_session=$_refreshToken');
    final response = await UsersApi(_client).currentUserPassKeyGet();
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

    _client.addDefaultHeader('cookie', 'cbo_long_session=$_refreshToken');
    final response = await SessionsApi(_client).sessionRefresh(EmptyReq());
    if (response == null || response.shortSession == null) {
      throw Exception('Stopped refreshToken: missing token in response.');
    }

    final user = User.fromIdToken(response.shortSession!.value);
    await _storage.setUser(user);
    _userStreamController.add(user);

    return user;
  }

  Future<void> _postSignIn(
    User user,
    String? refreshToken, {
    bool publishAuthState = true,
  }) async {
    await _storage.setUser(user);

    if (refreshToken != null) {
      await _storage.setRefreshToken(refreshToken);
      _refreshToken = refreshToken;
      _scheduleRefreshRoutine(user);
    }

    _authStateStreamController.add(user);
    _userStreamController.add(user);
    if (publishAuthState) _authStateNewStreamController.add(AuthState.SignedIn);

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
        await Future.delayed(Duration(seconds: 10));
        debugPrint(e.toString());
        _scheduleRefreshRoutine(user);
      }
    });
  }

  Duration _getWaitDurationForNextRefresh(User user) {
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();

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

    _authStateStreamController.add(null);
    _authStateNewStreamController.add(AuthState.None);
    _userStreamController.add(null);
    _passkeysStreamController.add([]);
  }
}

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/session/session.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_auth/src/types/exceptions/exceptions.dart';
import 'package:corbado_auth/src/types/webauthn/registration.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth extends CustomCorbadoAuth {
  /// Constructor
  CorbadoAuth();

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

  final StreamController<User?> _userStreamController =
      StreamController<User?>();

  final StreamController<AuthState> _authStateStreamController =
      StreamController<AuthState>();

  final StreamController<List<PasskeyInfo>> _passkeysStreamController =
      StreamController();

  late final SessionService _sessionService;
  EmailOTPState? _emailOTPState;

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init(String projectId, {String? customDomain}) async {
    await super.init(projectId, customDomain: customDomain);
    _sessionService =
        _buildSessionService(super.corbadoService.frontendAPIClient);

    try {
      final maybeUser = await _sessionService.init();
      if (maybeUser == null) {
        _userStreamController.add(null);
        _authStateStreamController.add(AuthState.None);
        return;
      }

      await _postSignIn(maybeUser);
    } catch (e) {
      debugPrint(e.toString());
      _userStreamController.add(null);
      _authStateStreamController.add(AuthState.None);
    }
  }

  /// Signs up a user by registering a new passkey (using the passkeys package).
  Future<void> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    final r = await customSignUpWithPasskey(email: email, fullName: fullName);
    final user = User.fromIdToken(r.token);

    await _postSignIn(user);
    await _updateSession(user, refreshToken: r.refreshToken);
  }

  /// Signs up a user by sending out an email OTP (one-time password)
  /// Calling this method only initiates the OTP.
  /// When the user has provided the code he received by email completeEmailCode
  /// must be called to finish the sign up.
  Future<void> startSignUpWithEmailCode({
    required String email,
    String fullName = '',
  }) async {
    _emailOTPState = await customStartSignUpWithEmailCode(email: email);
  }

  /// Completes an email OTP transaction.
  /// This can either be a sign up or a sign in.
  Future<void> finishEmailCode({
    required String code,
  }) async {
    if (_emailOTPState == null) {
      throw NoOTPChallengeStartedException();
    }

    final r = await corbadoService.completeEmailCode(
      _emailOTPState!.token,
      code,
    );

    final user = User.fromIdToken(r.token);
    await _postSignIn(user);
    await _updateSession(user, refreshToken: r.refreshToken);
  }

  /// Create a passkey for a user that is already signed in.
  /// This method can be called after a user has signed up using email OTP.
  Future<String?> appendPasskey() async {
    final refreshToken = await _sessionService.getRefreshToken();
    final res1 = await corbadoService.startAppendPasskey(token: refreshToken);
    final platformReq = res1.toPlatformType();
    final platformResponse = await passkeyAuthenticator.register(platformReq);
    final req2 =
        FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);
    await corbadoService.finishAppendPasskey(req2, token: refreshToken);

    await _loadPasskeys();
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
  Future<void> startLoginWithEmailCode({
    required String email,
  }) async {
    _emailOTPState = await customStartLoginWithEmailCode(email: email);
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
  Future<void> autocompletedLoginWithPasskey() async {
    final r = await super.customAutocompletedLoginWithPasskey();
    final user = User.fromIdToken(r.token);
    await _updateSession(user, refreshToken: r.refreshToken);
    await _postSignIn(user);
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<void> loginWithPasskey({required String email}) async {
    final r = await super.customLoginWithPasskey(email: email);
    final user = User.fromIdToken(r.token);
    await _updateSession(user, refreshToken: r.refreshToken);
    await _postSignIn(user);
  }

  /// Deletes a passkey by its credentialID.
  Future<void> deletePasskey(String credentialID) async {
    final refreshToken = await _sessionService.getRefreshToken();
    await corbadoService.deletePasskey(credentialID, token: refreshToken);
    await _loadPasskeys();
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<void> _loadPasskeys() async {
    final refreshToken = await _sessionService.getRefreshToken();
    final passkeys = await corbadoService.getPasskeys(token: refreshToken);

    _passkeysStreamController.sink.add(passkeys);
  }

  Future<void> _postSignIn(
    User user, {
    bool publishAuthState = true,
  }) async {
    _userStreamController.add(user);
    if (publishAuthState) _authStateStreamController.add(AuthState.SignedIn);

    await _loadPasskeys();
  }

  Future<void> _updateSession(User user, {String? refreshToken}) async {
    await _sessionService.setUser(user);

    if (refreshToken != null) {
      await _sessionService.setRefreshToken(refreshToken);
    }
  }

  /// Sign the user out.
  /// Removed all state from persistent storage.
  Future<void> signOut() async {
    await _sessionService.clear();

    _authStateStreamController.add(AuthState.None);
    _userStreamController.add(null);
    _passkeysStreamController.add([]);
  }

  static SessionService _buildSessionService(ApiClient frontendAPIClient) {
    StorageService storageService;
    if (kIsWeb) {
      storageService = WebStorageService();
    } else {
      storageService = NativeStorageService();
    }

    return SessionService(storageService, frontendAPIClient);
  }
}

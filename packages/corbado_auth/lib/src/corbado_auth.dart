import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/session/session.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth({CorbadoAuthConfig config = DefaultCorbadoAuthConfig})
      : _config = config;

  /// Should be listened to to get updates to the User object
  /// (e.g. updates to the idToken, sign in, sign out, changes to user data).
  /// userChanges fires more often than authStateChanges.
  Stream<User?> get userChanges => _sessionService.userChanges.distinct();

  /// Should be listened to to get updates to a user's auth state
  /// (e.g. sign in, sign out).
  /// This is a subset of userChanges.
  Stream<AuthState> get authStateChanges =>
      _sessionService.authStateChanges.distinct();

  /// Should be listened to to get updates to a user's passkeys.
  Stream<List<PasskeyInfo>> get passkeysChanges =>
      _passkeysStreamController.stream.distinct();

  /// Returns the current value of the user object.
  Future<User?> get currentUser => _sessionService.userChanges.first;

  final StreamController<List<PasskeyInfo>> _passkeysStreamController =
      StreamController();
  final CustomCorbadoAuth _inner = CustomCorbadoAuth();
  final CorbadoAuthConfig _config;

  late final SessionService _sessionService;
  EmailOTPState? _emailOTPState;

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init(String projectId, {String? customDomain}) async {
    await _inner.init(projectId, customDomain: customDomain);
    _sessionService = _buildSessionService(
      _inner.corbadoService.frontendAPIClient,
    );

    try {
      final maybeUser = await _sessionService.init();
      if (maybeUser == null) {
        await signOut();
        return;
      }

      await _loadPasskeys();
    } catch (e) {
      await signOut();
      debugPrint(e.toString());
    }
  }

  /// Signs up a user by registering a new passkey (using the passkeys package).
  Future<void> signUpWithPasskey({
    required String email,
    String? fullName,
  }) async {
    final r = await _inner.signUpWithPasskey(email: email, fullName: fullName);
    final user = User.fromIdToken(r.token);

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
    _emailOTPState = await _inner.startSignUpWithEmailCode(
      email: email,
      fullName: fullName,
    );
  }

  /// Completes an email OTP transaction.
  /// This can either be a sign up or a sign in.
  Future<void> finishEmailCode({
    required String code,
  }) async {
    if (_emailOTPState == null) {
      throw NoOTPChallengeStartedException();
    }

    final r = await _inner.corbadoService.completeEmailCode(
      _emailOTPState!.token,
      code,
    );

    final user = User.fromIdToken(r.token);
    await _updateSession(user, refreshToken: r.refreshToken);
  }

  /// Create a passkey for a user that is already signed in.
  /// This method can be called after a user has signed up using email OTP.
  Future<String?> appendPasskey() async {
    final refreshToken = await _sessionService.getRefreshToken();
    final res1 =
        await _inner.corbadoService.startAppendPasskey(token: refreshToken);
    final platformReq = res1.toPlatformType();
    final platformResponse =
        await _inner.passkeyAuthenticator.register(platformReq);
    final req2 =
        FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);
    await _inner.corbadoService.finishAppendPasskey(req2, token: refreshToken);

    finishPasskeyAppendProcess();

    await _loadPasskeys();

    return null;
  }

  /// This method should be called to abort an ongoing passkey append process.
  void finishPasskeyAppendProcess() {
    _sessionService.finishPasskeyAppendProcess();
  }

  Future<void> cancelAuthenticatorOperation() {
    return _inner.passkeyAuthenticator.cancelCurrentAuthenticatorOperation();
  }

  /// Init a user sign in using email OTP.
  /// Similarly to registerWithEmailCode a email code will be sent to the user.
  /// This code must then be provided by calling completeEmailCode.
  Future<void> startLoginWithEmailCode({
    required String email,
  }) async {
    _emailOTPState = await _inner.startLoginWithEmailCode(email: email);
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
    final r = await _inner.autocompletedLoginWithPasskey();
    final user = User.fromIdToken(r.token);
    await _updateSession(user, refreshToken: r.refreshToken);
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<void> loginWithPasskey({required String email}) async {
    final r = await _inner.loginWithPasskey(email: email);
    final user = User.fromIdToken(r.token);
    await _updateSession(user, refreshToken: r.refreshToken);
  }

  /// Deletes a passkey by its credentialID.
  Future<void> deletePasskey(String credentialID) async {
    final refreshToken = await _sessionService.getRefreshToken();
    await _inner.corbadoService
        .deletePasskey(credentialID, token: refreshToken);
    await _loadPasskeys();
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<List<PasskeyInfo>> _loadPasskeys(
      {String? explicitRefreshToken}) async {
    final refreshToken =
        explicitRefreshToken ?? await _sessionService.getRefreshToken();
    final passkeys =
        await _inner.corbadoService.getPasskeys(token: refreshToken);

    _passkeysStreamController.sink.add(passkeys);

    return passkeys;
  }

  Future<void> _updateSession(User user, {String? refreshToken}) async {
    final passkeys = await _loadPasskeys(explicitRefreshToken: refreshToken);
    var askForPasskeyAppend = false;
    if (passkeys.isEmpty && _config.askForPasskeyAppend) {
      askForPasskeyAppend = true;
    }

    await _sessionService.setUser(
      user,
      askForPasskeyAppend: askForPasskeyAppend,
    );

    if (refreshToken != null) {
      await _sessionService.setRefreshToken(user, refreshToken);
    }
  }

  /// Explicitly trigger a token refresh.
  /// This can be useful when there has been a change to the user's data that is
  /// part of the idToken.
  Future<void> refreshToken() {
    return _sessionService.explicitlyTriggerTokenRefresh();
  }

  /// Sign the user out.
  /// Removed all state from persistent storage.
  Future<void> signOut() async {
    await _sessionService.signOut();

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

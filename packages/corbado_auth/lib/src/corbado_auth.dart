import 'dart:async';
import 'dart:convert';

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/corbado/corbado_native.dart';
import 'package:corbado_auth/src/services/corbado/corbado_web.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_auth/src/types/auth_state.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_auth/src/types/passkey_info.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator/types.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/exceptions.dart';
import 'package:passkeys/relying_party_server/corbado/types/registration.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth(
    this._projectID, {
    @Deprecated('customDomain no longer needs to be set') String? customDomain,
  }) : _storageService = _buildStorageService();

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
  final StorageService _storageService;
  late CorbadoService _corbadoService;
  final String _projectID;
  final _preemptiveRefreshDuration = const Duration(seconds: 240);
  Timer? _refreshTimer;

  // sign up section
  EmailOTPState? _emailOTPState;

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init() async {
    final relyingPartyServer = CorbadoPasskeyBackend(_projectID);
    await relyingPartyServer.init();

    _corbadoService = _buildCorbadoService(_storageService);
    _passkeyAuth = PasskeyAuth(relyingPartyServer);
    _frontendAPIClient = await relyingPartyServer.buildClient();
    _corbadoService.init(_frontendAPIClient, _passkeyAuth);

    try {
      final passkeysSupported = await _passkeyAuth.isSupported();
      if (!passkeysSupported) {
        debugPrint('passkeys are not supported on this device');
      }

      final maybeUser = await _storageService.getUser();
      if (maybeUser == null) {
        _userStreamController.add(null);
        _authStateStreamController.add(AuthState.None);
        return;
      }

      await _postSignIn(maybeUser);
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
    final user = await _corbadoService.signUpWithPasskey(email, fullName);
    await _postSignIn(user);

    return;
  }

  /// Signs up a user by sending out an email OTP (one-time password)
  /// Calling this method only initiates the OTP.
  /// When the user has provided the code he received by email completeEmailCode
  /// must be called to finish the sign up.
  Future<void> registerWithEmailCode({
    required String email,
    String fullName = '',
  }) async {
    _emailOTPState = await _corbadoService.signUpWithEmailCode(
      email,
      fullName,
    );
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

    final user =
        await _corbadoService.completeEmailCode(_emailOTPState!.token, code);
    final publishAuthState = !askForPasskeyAppend;
    await _postSignIn(user, publishAuthState: publishAuthState);

    return null;
  }

  /// Create a passkey for a user that is already signed in.
  /// This method can be called after a user has signed up using email OTP.
  Future<String?> appendPasskey() async {
    final challenge = await _corbadoService.startPasskeyAppend();

    final json = jsonDecode(challenge) as Map<String, dynamic>;
    late RegisterResponseType resAuthenticator;
    resAuthenticator = await _registerPasskey(json);
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
    _emailOTPState = await _corbadoService.loginWithEmailCode(email);
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
    final user = await _corbadoService.loginWithPasskey('', conditional: true);
    await _postSignIn(user);
  }

  /// Signs in a user relying on a passkey.
  /// This is an alternative to autocompletedSignInWithPasskey.
  /// It should be called when the user explicitly wants to type in a username.
  Future<void> loginWithPasskey({required String email}) async {
    final user = await _corbadoService.loginWithPasskey(email);
    await _postSignIn(user);
  }

  /// Deletes a passkey by its credentialID.
  Future<void> deletePasskey(String credentialID) async {
    await _corbadoService.deletePasskey(credentialID);
    await _loadPasskeys();
  }

  Future<RegisterResponseType> _registerPasskey(
    Map<String, dynamic> json,
  ) async {
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

    return _passkeyAuth.authenticator.register(
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
  }

  /// Load all passkeys that are available to the currently logged in user.
  Future<void> _loadPasskeys() async {
    final passkeys = await _corbadoService.getPasskeys();

    _passkeysStreamController.sink.add(passkeys);
  }

  /// Refresh the current idToken.
  /// This requires a valid refreshToken that has been obtained during signIn
  /// or signUp.
  Future<User> refreshToken() async {
    final user = await _corbadoService.refreshToken();
    _userStreamController.add(user);

    return user;
  }

  Future<void> _postSignIn(
    User user, {
    bool publishAuthState = true,
  }) async {
    _scheduleRefreshRoutine(user);

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
        await Future.delayed(const Duration(seconds: 10), () {});
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
    await _storageService.clear();
    _refreshTimer?.cancel();

    _authStateStreamController.add(AuthState.None);
    _userStreamController.add(null);
    _passkeysStreamController.add([]);
  }

  static StorageService _buildStorageService() {
    if (kIsWeb) {
      return WebStorageService();
    } else {
      return NativeStorageService();
    }
  }

  static CorbadoService _buildCorbadoService(StorageService storageService) {
    if (kIsWeb) {
      return WebCorbadoService(storageService, );
    } else {
      return NativeCorbadoService(storageService);
    }
  }
}

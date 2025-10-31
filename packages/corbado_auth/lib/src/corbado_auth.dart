import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/corbado/corbado_stub.dart'
    if (dart.library.html) 'package:corbado_auth/src/services/corbado/corbado_web.dart'
    if (dart.library.io) 'package:corbado_auth/src/services/corbado/corbado_native.dart';
import 'package:corbado_auth/src/services/session/session.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth();

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

  // Returns the currently used projectId
  String get projectId => _projectId;

  // Returns the currently used RPid
  late final Future<String?> _rpIdFuture =
      _sessionService.rpIdChanges.firstWhere((value) => value != null);

  Future<String?> get rpId => _rpIdFuture;

  Stream<ComponentWithData> get componentWithDataStream =>
      _processHandler.componentWithDataStream;

  final StreamController<List<PasskeyInfo>> _passkeysStreamController =
      StreamController();

  late ProcessHandler _processHandler;
  late CorbadoService _corbadoService;
  late final SessionService _sessionService;
  late final String _projectId;
  bool _isInitialized = false;

  Future<void> initProcessHandler() async {
    if (_isInitialized) {
      return;
    }

    _isInitialized = true;

    final res = await _corbadoService.initAuthProcess();

    if(res.common.environment != 'dev'){
      TelemetryService.instance.disableTelemetry();
    }

    TelemetryService.instance.logPackageMetadata();

    await _sessionService.setFrontEndApiUrl(res.common.frontendApiUrl);

    _processHandler.updateBlockFromServer(res);
  }

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init({
    required String projectId,
    @deprecated String? customDomain,
    bool? debugMode,
    bool? telemetryDisabled,
    bool? telemetryDebugModeEnabled,
  }) async {
    final passkeyAuthenticator = PasskeyAuthenticator(debugMode: debugMode);
    _corbadoService = await createClient(projectId,
        passkeyAuthenticator: passkeyAuthenticator, customDomain: customDomain);
    _sessionService = _buildSessionService(
      projectId,
      _corbadoService.frontendAPIClient,
    );

    _projectId = projectId;

      TelemetryService.init(
        projectId: projectId,
        debugMode: telemetryDebugModeEnabled,
        isDoctorEnabled: debugMode ?? false,
        isEnabled: telemetryDisabled != true,
      );


    final frontEndApiUrl = await _sessionService.getFrontEndApiUrl();

    if (frontEndApiUrl != null) {
      _corbadoService.frontendAPIClient.dio.options.baseUrl = frontEndApiUrl;
    }

    _processHandler = ProcessHandler(
      corbadoService: _corbadoService,
      onLoggedIn: (String shortSession, String? longSession) async {
        await _sessionService.setUser(User.fromIdToken(shortSession));
        await _sessionService.setRefreshToken(longSession);
        await _loadPasskeys();
      },
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

  /// Load all passkeys that are available to the currently logged in user.
  Future<List<PasskeyInfo>> _loadPasskeys(
      {String? explicitRefreshToken}) async {
    final refreshToken =
        explicitRefreshToken ?? await _sessionService.getRefreshToken();
    final passkeys =
        await _corbadoService.sessionListPasskeys(token: refreshToken);
    final mapped = passkeys.map((p) => PasskeyInfo.fromResponse(p)).toList();

    _passkeysStreamController.sink.add(mapped);

    return mapped;
  }

  /// Explicitly trigger a token refresh.
  /// This can be useful when there has been a change to the user's data that is
  /// part of the idToken.
  Future<void> refreshUser() {
    return _sessionService.explicitlyTriggerTokenRefresh();
  }

  /// Sign the user out.
  /// Removed all state from persistent storage.
  Future<void> signOut() async {
    await _sessionService.signOut();

    _passkeysStreamController.add([]);
    
    _isInitialized = false;
  }

  /// Create a new passkey for an existing and logged in user
  Future<void> appendPasskey() async {
    await _corbadoService.sessionAppendPasskey();

    await _loadPasskeys();
  }

  /// Create an existing passkey for a logged in user
  Future<void> deletePasskey({required String credentialID}) async {
    await _corbadoService.sessionDeletePasskeys(credentialID: credentialID);

    await _loadPasskeys();
  }

  /// Change the user's full name.
  Future<void> changeUsername({required String fullName}) async {
    await _corbadoService.sessionUpdateUser(fullname: fullName);

    await refreshUser();
  }

  static SessionService _buildSessionService(
    String projectId,
    CorbadoFrontendApiClient frontendAPIClient,
  ) {
    StorageService storageService;
    if (kIsWeb) {
      storageService = WebStorageService(projectId);
    } else {
      storageService = NativeStorageService(projectId);
    }

    return SessionService(storageService, frontendAPIClient);
  }
}

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/session/session.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/services/storage/storage_native.dart';
import 'package:corbado_auth/src/services/storage/storage_web.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:passkeys/authenticator.dart';

import 'package:corbado_auth/src/services/corbado/corbado_stub.dart'
    if (dart.library.html) 'package:corbado_auth/src/services/corbado/corbado_web.dart'
    if (dart.library.io) 'package:corbado_auth/src/services/corbado/corbado_native.dart';

import 'types/screen_names.dart';

abstract class CorbadoComponent<T> {
  Widget build(BuildContext context, T data);
}

class CorbadoComponentData {}

class ComponentWithData {
  final ScreenNames screenName;
  final Block block;

  ComponentWithData(this.screenName, this.block);
}

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CorbadoAuth {
  /// Constructor
  CorbadoAuth({CorbadoAuthConfig config = DefaultCorbadoAuthConfig}) : passkeyAuthenticator = PasskeyAuthenticator();

  /// Should be listened to to get updates to the User object
  /// (e.g. updates to the idToken, sign in, sign out, changes to user data).
  /// userChanges fires more often than authStateChanges.
  Stream<User?> get userChanges => _sessionService.userChanges.distinct();

  /// Should be listened to to get updates to a user's auth state
  /// (e.g. sign in, sign out).
  /// This is a subset of userChanges.
  Stream<AuthState> get authStateChanges => _sessionService.authStateChanges.distinct();

  /// Should be listened to to get updates to a user's passkeys.
  Stream<List<PasskeyInfo>> get passkeysChanges => _passkeysStreamController.stream.distinct();

  /// Returns the current value of the user object.
  Future<User?> get currentUser => _sessionService.userChanges.first;

  Stream<ComponentWithData> get componentWithDataStream => _processHandler.componentWithDataStream;

  final StreamController<List<PasskeyInfo>> _passkeysStreamController = StreamController();

  late ProcessHandler _processHandler;
  final PasskeyAuthenticator passkeyAuthenticator;
  late CorbadoService _corbadoService;
  late final SessionService _sessionService;

  Future<void> initProcessHandler() async {
    final res = await _corbadoService.initAuthProcess();
    _processHandler.updateBlockFromServer(res);
  }

  /// Tries to get the user object from secure storage (this only works if
  /// the user has already signed in before and then closed the app).
  Future<void> init({required String projectId, required void Function() onLoggedIn, String? customDomain}) async {
    _corbadoService = await createClient(projectId, customDomain: customDomain);
    _sessionService = _buildSessionService(
      _corbadoService.frontendAPIClient,
    );
    _processHandler = ProcessHandler(
        corbadoService: _corbadoService,
        sessionService: _sessionService,
        passkeyAuthenticator: passkeyAuthenticator,
        onLoggedIn: onLoggedIn);

    try {
      final maybeUser = await _sessionService.init();
      if (maybeUser == null) {
        await signOut();
        return;
      }
    } catch (e) {
      await signOut();
      debugPrint(e.toString());
    }
  }

  Future<void> _updateSession(User user, {String? refreshToken}) async {
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

  static SessionService _buildSessionService(CorbadoFrontendApiClient frontendAPIClient) {
    StorageService storageService;
    if (kIsWeb) {
      storageService = WebStorageService();
    } else {
      storageService = NativeStorageService();
    }

    return SessionService(storageService, frontendAPIClient);
  }
}

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';

class SessionService {
  final StorageService _storageService;
  final ApiClient frontendAPIClient;

  Stream<User?> get userChanges => _userStreamController.stream;

  Stream<AuthState> get authStateChanges => _authStateStreamController.stream;

  final StreamController<User?> _userStreamController =
      StreamController<User?>();

  final StreamController<AuthState> _authStateStreamController =
      StreamController<AuthState>();
  final _preemptiveRefreshDuration = const Duration(seconds: 60);
  Timer? _refreshTimer;

  SessionService(this._storageService, this.frontendAPIClient);

  Future<User?> init() async {
    await _handleRefreshRequest();

    final user = await getUser();
    if (user == null) {
      return null;
    }

    // if token is invalid we try to refresh it
    if (!user.hasValidToken()) {
      return null;
    }

    // if token is valid we schedule a refresh
    _scheduleRefreshRoutine(user);
    _userStreamController.add(user);
    _authStateStreamController.add(AuthState.SignedIn);

    return user;
  }

  Future<String?> getRefreshToken() {
    return _storageService.getRefreshToken();
  }

  Future<void> setRefreshToken(String value) {
    return _storageService.setRefreshToken(value);
  }

  Future<User?> getUser() {
    return _storageService.getUser();
  }

  Future<void> setUser(User value, {bool askForPasskeyAppend = false}) {
    _userStreamController.add(value);

    final authState = askForPasskeyAppend
        ? AuthState.AskForPasskeyAppend
        : AuthState.SignedIn;

    _authStateStreamController.add(authState);

    return _storageService.setUser(value);
  }

  Future<void> signOut() async {
    _refreshTimer?.cancel();
    _userStreamController.add(null);
    _authStateStreamController.add(AuthState.None);
    await _storageService.clear();
  }

  Future<void> explicitlyTriggerTokenRefresh() => _refreshToken();

  void _scheduleRefreshRoutine(User user) {
    // if another refresh has already been scheduled we stop that one
    // this is not expected => if it occurs there is a problem with the code
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      _refreshTimer!.cancel();
    }

    _refreshTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _handleRefreshRequest();
    });
  }

  bool _isValidWithBuffer(User user, Duration buffer) {
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    final lifetime = Duration(seconds: user.decoded.exp - now);

    return !(lifetime - buffer).isNegative;
  }

  Future<void> _handleRefreshRequest() async {
    final maybeUser = await getUser();
    if (maybeUser == null) {
      debugPrint('Stopped token refresh: missing user.');
      return;
    }

    if (_isValidWithBuffer(maybeUser, _preemptiveRefreshDuration)) {
      debugPrint('Stopped token refresh: token is still valid');
      return;
    }

    await _refreshToken();
  }

  Future<User> _refreshToken() async {
    final refreshToken = await _storageService.getRefreshToken();
    if (kIsWeb) {
      // for web, setting the Authorization header is optional because there
      // can be a HTTPOnly cookie set
      if (refreshToken != null) {
        frontendAPIClient.addDefaultHeader(
          'Authorization',
          'Bearer $refreshToken',
        );
      }
    } else {
      if (refreshToken == null) {
        throw Exception('Stopped token refresh: missing refreshToken.');
      }

      frontendAPIClient.addDefaultHeader(
        'Authorization',
        'Bearer $refreshToken',
      );
    }

    final response =
        await SessionsApi(frontendAPIClient).sessionRefresh(EmptyReq());
    if (response == null || response.shortSession == null) {
      throw Exception('Stopped refreshToken: missing token in response.');
    }

    final user = User.fromIdToken(response.shortSession!.value);
    await setUser(user);

    return user;
  }

  void finishPasskeyAppendProcess() {
    _authStateStreamController.add(AuthState.SignedIn);
  }
}

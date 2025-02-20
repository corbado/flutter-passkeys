import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';

class SessionService {
  final StorageService _storageService;
  final CorbadoFrontendApiClient frontendAPIClient;

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
    final baseUrl = await getFrontEndApiUrl();

    if (baseUrl != null) {
      frontendAPIClient.dio.options.baseUrl = baseUrl;
    }

    await _handleRefreshRequest();

    final user = await getUser();
    if (user == null) {
      return null;
    }

    final refreshToken = await getRefreshToken();

    if (!user.hasValidToken() || refreshToken == null) {
      return null;
    }

    frontendAPIClient.dio.options.headers['Authorization'] = 'Bearer $refreshToken';

    // if token is valid we schedule a refresh
    _scheduleRefreshRoutine();
    _userStreamController.add(user);
    _authStateStreamController.add(AuthState.SignedIn);

    return user;
  }

  Future<String?> getRefreshToken() {
    return _storageService.getRefreshToken();
  }

  Future<void> setRefreshToken(String? value) async {
    if (value != null) {
      frontendAPIClient.dio.options.headers['Authorization'] = 'Bearer $value';
      await _storageService.setRefreshToken(value);
    }

    _scheduleRefreshRoutine();
  }

  Future<User?> getUser() {
    return _storageService.getUser();
  }

  Future<void> setUser(User value) {
    _userStreamController.add(value);
    _authStateStreamController.add(AuthState.SignedIn);

    return _storageService.setUser(value);
  }

  Future<String?> getFrontEndApiUrl() {
    return _storageService.getFrontEndApiUrl();
  }

  Future<void> setFrontEndApiUrl(String value) {
    return _storageService.setFrontEndApiUrl(value);
  }

  Future<void> signOut() async {
    _refreshTimer?.cancel();
    _userStreamController.add(null);
    _authStateStreamController.add(AuthState.None);
    await _storageService.clear();
  }

  Future<void> explicitlyTriggerTokenRefresh() => _refreshToken();

  void _scheduleRefreshRoutine() {
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

    debugPrint('refreshed token');
    await _refreshToken();
  }

  Future<User> _refreshToken() async {
    final refreshToken = await _storageService.getRefreshToken();
    if (kIsWeb) {
      // for web, setting the Authorization header is optional because there
      // can be a HTTPOnly cookie set
      if (refreshToken != null) {
        frontendAPIClient.dio.options.headers['Authorization'] = 'Bearer $refreshToken';
      }
    } else {
      if (refreshToken == null) {
        throw Exception('Stopped token refresh: missing refreshToken.');
      }

      frontendAPIClient.dio.options.headers['Authorization'] = 'Bearer $refreshToken';
    }

    final response = await frontendAPIClient.getUsersApi().currentUserSessionRefresh();
    if (response.data == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final user = User.fromIdToken(response.data!.shortSession);
    await setUser(user);

    return user;
  }

  void finishPasskeyAppendProcess() {
    _authStateStreamController.add(AuthState.SignedIn);
  }
}
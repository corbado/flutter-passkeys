import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: only_throw_errors

/// Manages the user session, including token refresh and auth state streams.
class SessionService {
  /// Creates a [SessionService] backed by the given storage service and
  /// frontend API client.
  SessionService(this._storageService, this.frontendAPIClient);
  final StorageService _storageService;

  /// The client used to communicate with the Corbado frontend API.
  final CorbadoFrontendApiClient frontendAPIClient;

  /// Emits the current user whenever it changes.
  Stream<User?> get userChanges => _userStreamController.stream;

  /// Emits the authentication state whenever it changes.
  Stream<AuthState> get authStateChanges => _authStateStreamController.stream;

  /// Emits the relying party id whenever it changes.
  Stream<String?> get rpIdChanges => _rpIdStreamController.stream;

  final StreamController<User?> _userStreamController =
      StreamController<User?>();

  final StreamController<AuthState> _authStateStreamController =
      StreamController<AuthState>();

  final StreamController<String?> _rpIdStreamController =
      StreamController<String?>();

  final _preemptiveRefreshDuration = const Duration(seconds: 60);
  Timer? _refreshTimer;

  /// Initializes the session, restoring the user and scheduling token refresh.
  Future<User?> init() async {
    await _handleRefreshRequest();

    final user = await getUser();
    if (user == null) {
      return null;
    }

    final refreshToken = await getRefreshToken();

    if (!user.hasValidToken()) {
      return null;
    }

    if (refreshToken != null) {
      frontendAPIClient.dio.options.headers['Authorization'] =
          'Bearer $refreshToken';
    }

    // if token is valid we schedule a refresh
    _scheduleRefreshRoutine();
    _userStreamController.add(user);
    _authStateStreamController.add(AuthState.SignedIn);

    return user;
  }

  /// Returns the stored refresh token if it has been set.
  Future<String?> getRefreshToken() {
    return _storageService.getRefreshToken();
  }

  /// Stores the refresh token and schedules a token refresh.
  Future<void> setRefreshToken(String? value) async {
    if (value != null) {
      frontendAPIClient.dio.options.headers['Authorization'] = 'Bearer $value';
      await _storageService.setRefreshToken(value);
    }

    _scheduleRefreshRoutine();
  }

  /// Returns the stored user if it has been set.
  Future<User?> getUser() {
    return _storageService.getUser();
  }

  /// Stores the user and updates the user and auth state streams.
  Future<void> setUser(User value) {
    _userStreamController.add(value);
    _authStateStreamController.add(AuthState.SignedIn);

    return _storageService.setUser(value);
  }

  /// Returns the stored front-end API URL if it has been set.
  Future<String?> getFrontEndApiUrl() {
    return _storageService.getFrontEndApiUrl();
  }

  /// Stores the front-end API URL and updates the API client base URL.
  Future<void> setFrontEndApiUrl(String? value) async {
    if (value != null) {
      frontendAPIClient.dio.options.baseUrl = value;

      _rpIdStreamController.add(value);

      return _storageService.setFrontEndApiUrl(value);
    }

    return;
  }

  /// Signs the user out, clearing stored data and stopping token refresh.
  Future<void> signOut() async {
    _refreshTimer?.cancel();
    _userStreamController.add(null);
    _authStateStreamController.add(AuthState.None);
    await _storageService.clear();
  }

  /// Explicitly triggers a token refresh.
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
        frontendAPIClient.dio.options.headers['Authorization'] =
            'Bearer $refreshToken';
      }
    } else {
      if (refreshToken == null) {
        throw Exception('Stopped token refresh: missing refreshToken.');
      }

      frontendAPIClient.dio.options.headers['Authorization'] =
          'Bearer $refreshToken';
    }

    final response = await frontendAPIClient
        .getUsersApi()
        .currentUserSessionRefresh();
    if (response.data == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final user = User.fromIdToken(response.data!.shortSession);
    await setUser(user);

    return user;
  }

  /// Marks the passkey append process as finished and updates the auth state.
  void finishPasskeyAppendProcess() {
    _authStateStreamController.add(AuthState.SignedIn);
  }
}

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:flutter/foundation.dart';

class SessionService {
  final StorageService _storageService;
  final ApiClient frontendAPIClient;

  final _preemptiveRefreshDuration = const Duration(seconds: 240);
  Timer? _refreshTimer;

  SessionService(this._storageService, this.frontendAPIClient);

  Future<User?> init() async {
    final maybeUser = await _storageService.getUser();
    if (maybeUser != null) {
      _scheduleRefreshRoutine(maybeUser);
    }

    return maybeUser;
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

  Future<void> setUser(User value) {
    return _storageService.setUser(value);
  }

  Future<void> clear() async {
    _refreshTimer?.cancel();
    await _storageService.clear();
  }

  void _scheduleRefreshRoutine(User user) {
    // if another refresh has already been scheduled we stop that one
    // this is not expected => if it occurs there is a problem with the code
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      _refreshTimer!.cancel();
    }

    _refreshTimer = Timer(_getWaitDurationForNextRefresh(user), () async {
      try {
        final user = await _refreshToken();
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

    return User.fromIdToken(response.shortSession!.value);
  }
}

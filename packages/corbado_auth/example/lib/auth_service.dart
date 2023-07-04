import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:passkeys/backend/types/exceptions.dart';

enum AuthState { Initializing, LoggedIn, LoggedOut }

class AuthService with ChangeNotifier {
  final CorbadoAuth _auth = getIt<CorbadoAuth>();

  User? _user;
  AuthState _authState = AuthState.Initializing;
  late StreamSubscription _userStreamSub;

  User? get user => _user;

  AuthState get authState => _authState;

  init() async {
    await _auth.init();

    _userStreamSub = _auth.userStream.listen((event) {
      if (event == null) {
        _authState = AuthState.LoggedOut;
      } else {
        _authState = AuthState.LoggedIn;
      }

      _user = event;
      notifyListeners();
    });
  }

  Future<String?> register({required String email}) async {
    try {
      final maybeError = await _auth.registerWithPasskey(email: email);
      return maybeError;
    } on UnexpectedBackendException catch (e) {
      debugPrint(e.toString());
      return 'An unexpected error happened during registration. Please try again later.';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signIn({required String email}) {
    return _auth.signInWithPasskey(email: email);
  }

  Future<void> refreshToken() {
    return _auth.refreshToken();
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  void dispose() {
    _userStreamSub.cancel();
    super.dispose();
  }
}
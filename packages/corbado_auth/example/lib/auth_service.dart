import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:corbado_auth/src/types/user.dart';

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

  Future<void> register({required String email}) {
    return _auth.registerWithPasskey(email: email);
  }

  Future<void> signIn({required String email}) {
    return _auth.signInWithPasskey(email: email);
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
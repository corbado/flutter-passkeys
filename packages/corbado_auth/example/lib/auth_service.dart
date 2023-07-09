import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:passkeys/relying_party_server/types/exceptions.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState { Initializing, LoggedIn, LoggedOut }

class AuthService with ChangeNotifier {
  final CorbadoAuth _auth = getIt<CorbadoAuth>();

  User? _user;
  AuthState _authState = AuthState.Initializing;
  late StreamSubscription _userStreamSub;

  User? get user => _user;

  BehaviorSubject<User?> get userSteam => _auth.userStream;

  AuthState get authState => _authState;

  init() async {
    _userStreamSub = _auth.userStream.listen((event) {
      if (event == null) {
        _authState = AuthState.LoggedOut;
      } else {
        _authState = AuthState.LoggedIn;
      }

      _user = event;
      notifyListeners();
    });

    await _auth.init();
  }

  Future<String?> register({required String email}) async {
    try {
      final maybeError =
          await _auth.registerWithPasskey(email: email, fullName: email);
      return maybeError;
    } on ValidationException catch (e) {
      return 'validation error: ${e.toString()}';
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

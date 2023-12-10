@JS()
library bundle;

import 'package:js/js.dart';

@JS('PasskeyAuthenticator.init')
external void init();

@JS('PasskeyAuthenticator.register')
external Future<String> authenticatorRegister(Object options);

@JS('PasskeyAuthenticator.login')
external Future<String> authenticatorLogin(Object options);

@JS('PasskeyAuthenticator.cancelCurrentAuthenticatorOperation')
external Future<String> authenticatorCancel();

@JS()
library bundle;

import 'package:js/js.dart';

@JS('PasskeyAuthenticator.register')
external Future<String> authenticatorRegister(Object options);

@JS('PasskeyAuthenticator.login')
external Future<String> authenticatorLogin(Object options);

@JS()
class CredentialCreationOptions {
  external CredentialCreationOptions(Object publicKey);
}

@JS()
class PublicKeyCredentialCreationOptions {
  external PublicKeyCredentialCreationOptions(
      PublicKeyCredentialRpEntity rp, User user, String challenge);
}

@JS()
class PublicKeyCredentialRpEntity {
  external PublicKeyCredentialRpEntity(String id, String name);
}

@JS()
class User {
  external User(String id, String name, String displayName);
}

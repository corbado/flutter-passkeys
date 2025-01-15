@JS()
library bundle;

import 'dart:js_interop';

@JS('PasskeyAuthenticator.init')
external void init();

@JS('PasskeyAuthenticator.register')
external JSPromise<JSString> authenticatorRegister(JSString options);

@JS('PasskeyAuthenticator.login')
external JSPromise<JSString> authenticatorLogin(JSString options);

@JS('PasskeyAuthenticator.cancelCurrentAuthenticatorOperation')
external JSPromise<JSString> authenticatorCancel();

@JS('PasskeyAuthenticator.isUserVerifyingPlatformAuthenticatorAvailable')
external JSPromise<JSBoolean?> isUserVerifyingPlatformAuthenticatorAvailable();

@JS('PasskeyAuthenticator.isConditionalMediationAvailable')
external JSPromise<JSBoolean?> isConditionalMediationAvailable();

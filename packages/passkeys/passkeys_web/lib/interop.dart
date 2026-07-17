@JS()
library bundle;

import 'dart:js_interop';

/// Initializes the Passkeys Web JS authenticator.
@JS('PasskeyAuthenticator.init')
external void init();

/// Registers a new passkey using the serialized JSON [options].
@JS('PasskeyAuthenticator.register')
external JSPromise<JSString> authenticatorRegister(JSString options);

/// Authenticates with an existing passkey using the serialized JSON [options].
@JS('PasskeyAuthenticator.login')
external JSPromise<JSString> authenticatorLogin(JSString options);

/// Cancels the currently running authenticator operation.
@JS('PasskeyAuthenticator.cancelCurrentAuthenticatorOperation')
external JSVoid authenticatorCancel();

/// Whether a user-verifying platform authenticator is available.
@JS('PasskeyAuthenticator.isUserVerifyingPlatformAuthenticatorAvailable')
external JSPromise<JSBoolean?> isUserVerifyingPlatformAuthenticatorAvailable();

/// Whether conditional mediation (passkey autofill) is available.
@JS('PasskeyAuthenticator.isConditionalMediationAvailable')
external JSPromise<JSBoolean?> isConditionalMediationAvailable();

/// Whether the current browser supports passkeys.
@JS('PasskeyAuthenticator.hasPasskeySupport')
external JSBoolean hasPasskeySupport();

/// The global `PublicKeyCredential` interface. Used to feature-detect the
/// WebAuthn Signal API static methods before calling them.
@JS('PublicKeyCredential')
external JSObject? get publicKeyCredential;

/// Signals that a credential is no longer recognized by the relying party.
@JS('PublicKeyCredential.signalUnknownCredential')
external JSPromise<JSAny?> signalUnknownCredentialJS(JSObject options);

/// Signals the complete set of credentials the relying party still accepts.
@JS('PublicKeyCredential.signalAllAcceptedCredentials')
external JSPromise<JSAny?> signalAllAcceptedCredentialsJS(JSObject options);

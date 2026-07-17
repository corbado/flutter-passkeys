import 'dart:js_interop';

@JS('PasskeyAuthenticator')
external JSAny? get _passkeyAuthenticator;

/// Whether the passkeys web SDK (`bundle.js`) is loaded, detected by the
/// presence of the global `PasskeyAuthenticator` object.
bool isPasskeysWebScriptLoaded() => _passkeyAuthenticator.isDefinedAndNotNull;

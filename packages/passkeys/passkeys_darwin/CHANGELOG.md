## 0.4.2+2

 - **FIX**(passkeys_darwin): map no-credentials-available regardless of device locale ([#271](https://github.com/corbado/flutter-passkeys/issues/271)). ([7414c54a](https://github.com/corbado/flutter-passkeys/commit/7414c54a24ddde979bc2d64d19b28a52065fc8ca))
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)). ([f8abd40c](https://github.com/corbado/flutter-passkeys/commit/f8abd40c119c4d5c22a02250a42bdda008a9c42a))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

## 0.4.1+1

 - Update a dependency to the latest release.

## 0.4.1

 - Update a dependency to the latest release.

## 0.4.0

- Adds Swift Package Manager (SwiftPM) support for iOS and macOS. CocoaPods continues to work in parallel.

## 0.3.0

- Passes `Attestation` and `ResidentKey` params to Security Key Register Handler
- Makes the returned `UserID` optional from the authentication response as it is optional to return it from the authenticator

## 0.2.0

- Fixes conditional UI bug when dealing with Security Keys.

## 0.1.0

- Initial open source release.
- Turn `passkeys_ios` into the new `passkeys_darwin` containing support for macOS

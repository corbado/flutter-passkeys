## 0.4.1

 - **FEAT**(passkeys_darwin): add SwiftPM support. ([23fd8ac4](https://github.com/corbado/flutter-passkeys/commit/23fd8ac46208746fd83a2161de3f4482c12fcb7d))

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

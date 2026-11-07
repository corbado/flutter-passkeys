## 0.4.8

 - **FIX**(passkeys_darwin): add FlutterFramework SwiftPM dependency, require Flutter 3.41 ([#337](https://github.com/corbado/flutter-passkeys/issues/337)). ([beb9528a](https://github.com/corbado/flutter-passkeys/commit/beb9528ae45aedc932ead3b3c834a65791f0c3bb))
 - **NOTE**: requires Dart 3.11 / Flutter 3.41 or later (also for CocoaPods builds). Apps on older Flutter versions keep resolving the previous release.

## 0.4.7

 - **FEAT**(passkeys): support conditional passkey creation ([#324](https://github.com/corbado/flutter-passkeys/issues/324)). ([e0fa3b50](https://github.com/corbado/flutter-passkeys/commit/e0fa3b5061d40e9268b35f8e2952e6ce2970bf60))

## 0.4.6

 - **FIX**(passkeys_darwin): declare a privacy manifest for Apple platforms ([#317](https://github.com/corbado/flutter-passkeys/issues/317)). ([90a2af97](https://github.com/corbado/flutter-passkeys/commit/90a2af9788333df5f00670fed4a9233b59e398e6))

## 0.4.5

 - **FIX**(passkeys): declare the meta dependency required by Pigeon generated code ([#313](https://github.com/corbado/flutter-passkeys/issues/313)). ([e1f12615](https://github.com/corbado/flutter-passkeys/commit/e1f126157ef1498ff563d9c4e8622eddd16a1a50))

## 0.4.4

 - **REFACTOR**(passkeys): regenerate Pigeon bindings with Pigeon 26.3.4 ([#306](https://github.com/corbado/flutter-passkeys/issues/306)). ([aaa15472](https://github.com/corbado/flutter-passkeys/commit/aaa15472b4fa4f0ca4842508232506403033bc6e))
 - **FIX**(passkeys_darwin): add canBeSecurityKey to authenticate ([#310](https://github.com/corbado/flutter-passkeys/issues/310)). ([c66a16eb](https://github.com/corbado/flutter-passkeys/commit/c66a16eba8a51400bfa8bb52e40c97098b8b7aa0))
 - **FIX**(passkeys_darwin): forward userVerification preference to AuthenticationServices ([#309](https://github.com/corbado/flutter-passkeys/issues/309)). ([0dc05c95](https://github.com/corbado/flutter-passkeys/commit/0dc05c95dffc3d7c679f70863784e05757bff1a6))

## 0.4.3+3

 - **FIX**(passkeys_darwin): compile out Signal API on Xcode older than 26.2 ([#289](https://github.com/corbado/flutter-passkeys/issues/289)). ([3731dc07](https://github.com/corbado/flutter-passkeys/commit/3731dc07755001735daef9e1b2a61ad718b1d26f))

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

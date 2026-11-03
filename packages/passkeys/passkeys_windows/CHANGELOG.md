## 0.1.6

 - **FIX**(passkeys_windows): hash client data with SHA-256, not SHA-512 ([#319](https://github.com/corbado/flutter-passkeys/issues/319)). ([70a9de98](https://github.com/corbado/flutter-passkeys/commit/70a9de9897d9fa42d383e3bf4979ea62d13956d5))
 - **FEAT**(passkeys): support conditional passkey creation ([#324](https://github.com/corbado/flutter-passkeys/issues/324)). ([e0fa3b50](https://github.com/corbado/flutter-passkeys/commit/e0fa3b5061d40e9268b35f8e2952e6ce2970bf60))

## 0.1.5

 - **FIX**(passkeys): declare the meta dependency required by Pigeon generated code ([#313](https://github.com/corbado/flutter-passkeys/issues/313)). ([e1f12615](https://github.com/corbado/flutter-passkeys/commit/e1f126157ef1498ff563d9c4e8622eddd16a1a50))

## 0.1.4

 - **REFACTOR**(passkeys): regenerate Pigeon bindings with Pigeon 26.3.4 ([#306](https://github.com/corbado/flutter-passkeys/issues/306)). ([aaa15472](https://github.com/corbado/flutter-passkeys/commit/aaa15472b4fa4f0ca4842508232506403033bc6e))
 - **FIX**(passkeys_windows): keep WebAuthn prompts in foreground ([#303](https://github.com/corbado/flutter-passkeys/issues/303)). ([b9638d00](https://github.com/corbado/flutter-passkeys/commit/b9638d0014b778cd5ac0b65b2a73e3dc66abbd8c))

## 0.1.3+2

 - **FIX**(passkeys_windows): prevent crash on window close and use-after-free in Register ([#261](https://github.com/corbado/flutter-passkeys/issues/261)). ([92018cd4](https://github.com/corbado/flutter-passkeys/commit/92018cd4b6d800a4496e2d1301c4f13efce999e3))
 - **FEAT**(passkeys_windows): add PRF extension support ([#276](https://github.com/corbado/flutter-passkeys/issues/276)). ([d8dadfc1](https://github.com/corbado/flutter-passkeys/commit/d8dadfc1239857d2773477e12844a0bb13683f62))
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)). ([d9b028ff](https://github.com/corbado/flutter-passkeys/commit/d9b028ff9af7a2239fd89639604dc77355771968))

## 0.1.2+1

 - Update a dependency to the latest release.

## 0.1.2

 - Update a dependency to the latest release.

## 0.1.1

- Fix Base64URL encoding truncation in Windows WebAuthn helper

## 0.1.0

- Initial release of Windows platform implementation
- Support for Windows Hello (biometric and PIN authentication)
- Support for FIDO2 security keys
- WebAuthn API integration for Windows 10 (1903+) and Windows 11
- Passkey registration (MakeCredential)
- Passkey authentication (GetAssertion)
- Availability checking for platform authenticators
- Operation cancellation support

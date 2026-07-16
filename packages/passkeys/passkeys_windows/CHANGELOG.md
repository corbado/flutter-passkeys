## 0.1.3+2

 - **FIX**(passkeys_windows): prevent crash on window close and use-after-free in Register ([#261](https://github.com/corbado/flutter-passkeys/issues/261)).
 - **FEAT**(passkeys_windows): add PRF extension support ([#276](https://github.com/corbado/flutter-passkeys/issues/276)).
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)).

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

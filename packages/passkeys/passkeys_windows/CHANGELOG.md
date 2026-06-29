## 0.1.2

 - **FIX**: check if last char if null terminator before exclude. ([726f6ea2](https://github.com/corbado/flutter-passkeys/commit/726f6ea2e682ba90ea6f770cb9642b187eaecbd9))
 - **FEAT**(passkeys_windows): add windows implementation. ([99f9b8ff](https://github.com/corbado/flutter-passkeys/commit/99f9b8ff333fe448b06769532de51c3612d858a2))

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

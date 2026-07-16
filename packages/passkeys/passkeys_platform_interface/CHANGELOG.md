## 2.9.0

 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).

## 2.8.0

 - **FIX**(passkeys_platform_interface): default optional authenticatorSelection fields ([#254](https://github.com/corbado/flutter-passkeys/issues/254)). ([5f410f67](https://github.com/corbado/flutter-passkeys/commit/5f410f670be7d6c08f0d6236c13a102b6cc29f0c))
 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))
 - **FEAT**(passkeys_platform_interface): add windows availability type. ([7f68c446](https://github.com/corbado/flutter-passkeys/commit/7f68c446f69d23ab6615b961687bd0e4e167aaa4))

## 2.7.0

 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))

## 2.6.0
* Adds support for Serliazable JSON Strings.

## 2.5.0
* Adds support for Windows interface.

## 2.4.0
* Made authSelectionType optional.

## 2.3.1
* Fixed Exception when trying to register while `authenticatorAttachment` is null on Safari or IOS device.

## 2.3.0
* Added `transports` to RegistrationResponse

## 2.2.1
* Fixes bug with new added types

## 2.2.0
* Added `hasPasskeySupport` to `AvailabilityType`
* Separate `AvailabilityType` for each supported platform

## 2.1.0
* Added getAvailability().
* Added preferImmediatelyAvailableCredentials.

## 2.0.1
* Added excludeCredentials to RegisterRequestType

## 2.0.0
* Stable release for v2
* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Grouped parameters of register and authenticate methods (RegisterRequestType and
  AuthenticateRequestType)

## 2.0.0-dev.2
* Version bump

## 2.0.0-dev.1

* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Grouped parameters of register and authenticate methods (RegisterRequestType and
  AuthenticateRequestType)

## 1.2.0

* Deprecate getFacetID.

## 1.2.0

* Added userHandle to AuthenticateResponseType.

## 1.1.0

* Added userHandle to AuthenticateResponseType.

## 1.0.0

* Better comments. Stable release.

## 0.1.0

* Initial open source release.

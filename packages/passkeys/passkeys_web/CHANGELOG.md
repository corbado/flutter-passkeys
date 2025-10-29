## 2.8.0
* Fixed Attestation not being passed correctly to the register function
* Fixed potential JSValue not being string exception

## 2.7.0
* Made `authSelectionType` optional.
* Added new `suppressedError`.

## 2.6.0
* Added passkey JS bundle check to ensure the passkey JS bundle is loaded before initializing the PasskeyAuthenticator.

## 2.5.1
* Fixed a bug where `hybrid` transports causes login to fail.

## 2.5.0
* Fixed Exception when trying to register while `authenticatorAttachment` is null on Safari or IOS device. 

## 2.4.0
* Added `transports` to RegistrationResponse

## 2.3.0
* Added `hasPasskeySupport` to `AvailabilityType` to check if the platform supports passkeys.

## 2.2.0
* Added support for WebAssembly (Wasm)

## 2.1.0
* Added getAvailability() to check for isUserVerifyingPlatformAuthenticatorAvailable and isConditionalMediationAvailable.

## 2.0.2
* Version bump for js dependency.

## 2.0.1 
* Added excludeCredentials support

## 2.0.0 
* Stable open source release.

## 2.0.0-dev.2
* Typing fix for authenticate method in PasskeyWeb.

## 2.0.0-dev.1

* Initial open source release.

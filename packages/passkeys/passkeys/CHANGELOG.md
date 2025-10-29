## 2.16.0
* Fixes `Attestation` not being passed to the register function. (Web)
* Passes `Attestation` and `ResidentKey` params to Security Key Register Handler. (iOS & macOS)
* Handles empty `userID` returned by authenticators. (iOS & macOS)

## 2.15.1
* Fixes conditional ui failing because of security keys. (iOS)

## 2.15.0
* Adds support for macOS.

## 2.14.0
* Fixes doctor syncing issues on Web. (Web)
* Makes `authSelectionType` optional. (Android, iOS & Web)

## 2.13.0
* Fixes UIWindow unwrapping issue when building iOS app with Flutter 3.35.0+. (iOS)

## 2.12.0
* `hasPasskeySupport` now verifies that the Android API level is 28 or higher. (Android)
* Fixed an issue that occurred when running the app on Android devices without Google Play Services. (Android)

## 2.11.0
* Fixes handling of optional `transports` field in registration response when authenticators don't provide it. (Android & iOS)

## 2.10.0
* Added new PasskeyUnsuportedException to detect if OS is too outdated for passkeys. (Android)

## 2.9.0
* Added passkeys_doctor plugin to help with debugging passkey and configuration issues.
* Added passkey JS bundle check to ensure the passkey JS bundle is loaded before initializing the PasskeyAuthenticator. (Web)

## 2.8.2
* Fixed a bug where an empty `userHandle` returned by `authenticate` was not being handled correctly. (Android)

## 2.8.1
* Fixed issue with Base64Url encoded userIDs not being decoded correctly. (iOS)
* Improved exception handling for MalformedBase64Url.

## 2.8.0
* Adds new exceptions to help with debugging Base64 encoding issues.

## 2.7.1
* Fixed a bug where `hybrid` transports causes login to fail. (Web)

## 2.7.0
* Fixed Exception when trying to register while `authenticatorAttachment` is null on Safari or IOS device. (Web)
* Added support for external security keys (Yubikey) on iOS. (iOS)
* Added handling for timeouts in `authenticate` and `register` methods. (Android)

## 2.6.0
* Added `transports` to RegistrationResponse
* Fixes `hasPasskeySupport` in `getAvailability` (Android)

## 2.5.0
* Introduced `getAvailability` API: Enables checking for passkey support across platforms.
* Updated `androidx.credentials:credentials` to version 1.3.0 for improved compatibility. (Android)
* Resolved an issue on iOS 16.0+ where a `DeviceNotSupported` exception was incorrectly thrown on supported devices. (iOS)
* Added `hasPasskeySupport` to `AvailabilityType` to verify passkey support on web platforms. (Web)

## 2.4.0
* Added support for WebAssembly (Wasm) (Web)
* Added handling for `CreateCredentialNoCreateOptionException` when no viable creation options were found (Android)

## 2.3.0
* Improved fallback handling in `PasskeyAuthenticator.authenticate`.
* Added support for `preferImmediatelyAvailableCredentials` on Android.
* Fixed `requireResidentKey` mapping for 1Password compatibility.

## 2.2.0
* Added support for AGP 8.0 and newer (Android)
* Resolves a crash issue on iOS devices running versions below 16.0. (iOS)

## 2.1.0
* Added support for preferImmediatelyAvailableCredentials (Android and iOS)
* Added getAvailability (Flutter web only)

## 2.0.9
* Bump version of passkeys_web and corbado_frontend_api_client
* Removed dependencies to openapi_generator_annotations and openapi_generator

## 2.0.8
* Added NoCredentialsAvailableException to indicate that no credentials are available during a login (android)

## 2.0.7
* Bump version of passkeys_ios

## 2.0.6
* Bump version of passkeys_ios (make excludeCredentials only available for iOS 17.4 and above)

## 2.0.5
* Bump version of passkeys_android (proguard file is no longer needed)

## 2.0.4
* Map excludeCredentials error to typed exception

## 2.0.3
* Added excludeCredentials support

## 2.0.2
* Update docs

## 2.0.1
* Update docs

## 2.0.0
* Stable release for v2
* Added flutter_web support
* Updated conditional UI support for iOS (it is now triggered from the iOS keyboard)
* Updated the example to showcase conditional UI
* Removed the RelyingPartyServer interface and the Corbado implementation of it (this is now part of
  the corbado_auth package)
* Fix: Cancel any pending authenticator operation before register/login calls
* BREAKING CHANGE: Parameters of "authenticateWithAutocompletion" have changed
* BREAKING CHANGE: Removed getFacetID (no longer needed)
* BREAKING CHANGE: For conditional UI on iOS you now need to
  set `autofillHints: [AutofillHints.username]` for the TextField

## 2.0.0-dev.3
* Bump version of passkey_ios (fix userHandle issue)

## 2.0.0-dev.2
* Bump version of passkey_ios

## 2.0.0-dev.1

* Added flutter_web support
* Updated conditional UI support for iOS (it is now triggered from the iOS keyboard)
* Updated the example to showcase conditional UI
* Removed the RelyingPartyServer interface and the Corbado implementation of it (this is now part of
  the corbado_auth package)
* Fix: Cancel any pending authenticator operation before register/login calls
* BREAKING CHANGE: Parameters of "authenticateWithAutocompletion" have changed
* BREAKING CHANGE: Removed getFacetID (no longer needed)
* BREAKING CHANGE: For conditional UI on iOS you now need to
  set `autofillHints: [AutofillHints.username]` for the TextField

## 1.3.2

* Bump version for passkeys_android

## 1.3.1

* Bump versions for passkeys_ios, passkeys_android and passkeys_platform_interface

## 1.3.0

* Corbado: Deprecate the customDomain setting (this does not have to be configured to production
  projects)
* Corbado: Added new exception type (PasskeyAlreadyExistsException)
* Fix: Make sure that exceptions are awaited within the authenticator

## 1.2.1

* Improved exception handling for Android and iOS.

## 1.2.0

* Added autocomplete to sign in (authenticateWithAutocompletion).

## 1.1.0

* Added userHandle to AuthenticateResponseType.

## 1.0.3

* Fixed bug that happens when executing the Android example.
* Activate alternate mode for iOS (entitlements).

## 1.0.2

* Improved docs.

## 1.0.1

* Improved docs.
* Simplified example.
* Bump iOS version.

## 1.0.0

* Better comments. Stable release.

## 0.1.1

* Update image links in docs.

## 0.1.0

* Initial open source release.

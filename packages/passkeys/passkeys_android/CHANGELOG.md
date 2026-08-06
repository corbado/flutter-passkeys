## 2.13.0

 - **FIX**(passkeys_android): downgrade expected auth errors from Log.e to Log.d ([#273](https://github.com/corbado/flutter-passkeys/issues/273)). ([51f9b540](https://github.com/corbado/flutter-passkeys/commit/51f9b5400e143b26cba43c66bedd934f5be2c05b))
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)). ([f8abd40c](https://github.com/corbado/flutter-passkeys/commit/f8abd40c119c4d5c22a02250a42bdda008a9c42a))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

## 2.12.2

 - Update a dependency to the latest release.

## 2.12.1

 - Update a dependency to the latest release.

## 2.12.0
* Adds `NoCreateOptionException` handling for register flow.
* Unstubs `cancelCurrentAuthenticatorOperation` implementation.

## 2.11.0
* Makes `authSelectionType` optional.

## 2.10.0
* `hasPasskeySupport` now verifies that the Android API level is 28 or higher.
* Fixed an issue that occurred when running the app on Android devices without Google Play Services.

## 2.9.0
* Fixes handling of optional `transports` field in registration response when authenticators don't provide it

## 2.8.0
* Downgrades minSDKVersion from 28 to 23
* Adds new PasskeyUnsupportedException to handle when device has sdk version lower than 28
* Fixes some exception documentations

## 2.7.1
* Makes `userHandle` similar to the W3 specification.

## 2.7.0
* Implement `passkeys_platform_interface 2.3.1`
* Handles timeout exceptions

## 2.6.0
* Added `transports` to RegistrationResponse
* Fixes `hasPasskeySupport` in `getAvailability`

## 2.5.0
* Added `getAvailability` api to check for passkey support
* Upgrade `androidx.credentials:credentials` to 1.3.0

## 2.4.0
* Added handling for `CreateCredentialNoCreateOptionException` when no viable creation options were found 

## 2.3.0
* Fixed `requireResidentKey` mapping error (string instead of boolean) causing 1Password failures
* Added support for `preferImmediatelyAvailableCredentials`

## 2.2.0
* Added support for AGP 8.0 and newer

## 2.1.0
* Added support for preferImmediatelyAvailableCredentials

## 2.0.4
* Added NoCredentialsAvailableException to indicate that no credentials are available during a login

## 2.0.3
* Bump androidx.credentials:credentials to 1.2.0 => release builds will no work on Android 13 and below without custom proguard rules

## 2.0.2
* Map excludeCredentials error to typed exception

## 2.0.1
* Added excludeCredentials support

## 2.0.0

* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Adapted to new passkeys_platform_interface

## 2.0.0-dev.1

* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Adapted to new passkeys_platform_interface

## 1.2.1

* Catch more situations when a user interrupts biometrics ceremony (e.g. providing his fingerprint).

## 1.2.0

* Bump passkeys_platform_interface version.

## 1.1.2

* Catch native Android exceptions when user is not signed in to Google account.

## 1.1.1

* Removed unnecessary logs
* Catch CancellationExceptions from CredentialManager

## 1.1.0

* Added userHandle to AuthenticateResponseType.

## 1.0.0

* Better comments. Stable release.

## 0.1.0

* Initial open source release.

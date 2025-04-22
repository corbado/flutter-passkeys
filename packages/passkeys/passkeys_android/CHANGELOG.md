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

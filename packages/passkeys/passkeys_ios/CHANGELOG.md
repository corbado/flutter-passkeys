## 2.7.0
* Fixes handling of optional `transports` field in registration response when authenticators don't provide it

## 2.6.1
* Fixed issue with Base64Url encoded userIDs not being decoded correctly.

## 2.6.0
* Added external security keys support (Yubikeys)
* Handles new Security Key timeout exception

## 2.5.0
* Added `transports` to RegistrationResponse

## 2.4.0

* Added `getAvailability` api to check for passkey support
* Fixes issue with iOS 16.0 and above where the `DeviceNotSupported` exception was thrown when the device was supported

## 2.3.0

* Fixed an issue where iOS treated `.preferImmediatelyAvailableCredentials` as always enabled, causing improper behavior

## 2.2.0

* Added a new DeviceNotSupported exception to handle cases where the iOS version is lower than 16.0

## 2.1.0

* Added support for preferImmediatelyAvailableCredentials

## 2.0.3

* Make excludeCredentials only available for iOS 17.4 and above

## 2.0.2

* Map excludeCredentials error to typed exception

## 2.0.1

* Added excludeCredentials support

## 2.0.0

* Fixed issue with userHandle that prevented synced passkeys from working in some situations.
* Changed conditional UI (use performAutoFillAssistedRequests)
* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Adapted to new passkeys_platform_interface

## 2.0.0-dev.3

* Fixed issue with userHandle that prevented synced passkeys from working in some situations.

## 2.0.0-dev.2

* Fixes to conditionalUI on iOS

## 2.0.0-dev.1

* Changed conditional UI (use performAutoFillAssistedRequests)
* Removed getFacetID (no longer needed)
* Added cancelCurrentAuthenticatorOperation
* Adapted to new passkeys_platform_interface

## 1.2.0

* Bump passkeys_platform_interface version.

## 1.1.1

* Improved exception handling.

## 1.1.0

* Added userHandle to AuthenticateResponseType.

## 1.0.2

* Fixed typo that breaks iOS build.

## 1.0.1

* Improved error handling.

## 1.0.0

* Better comments. Stable release.

## 0.1.0

* Initial open source release.

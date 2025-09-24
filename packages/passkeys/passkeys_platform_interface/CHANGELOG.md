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

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

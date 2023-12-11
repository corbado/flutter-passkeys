## 2.0.0-dev.1

* Added flutter_web support
* Updated conditional UI support for iOS (it is now triggered from the iOS keyboard)
* Removed getFacetID (no longer needed)
* Fix: Cancel any pending authenticator operation before register/login calls
* BREAKING CHANGE: Parameters of "authenticateWithAutocompletion" have changed
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

* Initial Open Source release.

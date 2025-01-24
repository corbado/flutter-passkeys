## 3.1.0
* Updates passkeys dependency to 2.5.0
* Added `getAvailability` api to check for passkey support

## 3.0.0
* Switch to Corbado Frontend API v2.
* Added CorbadoAuthComponent
* Bump version of passkeys, corbado_frontend_api_client, passkeys_platform_interface, passkeys_web, passkey_android and passkeys_ios
* BREAKING CHANGE: Removed CustomCorbadoAuth

## 2.0.8
* Bump version of passkeys and corbado_frontend_api_client

## 2.0.7
* Bump version of passkeys

## 2.0.6
* Bump version of passkeys_ios (make excludeCredentials only available for iOS 17.4 and above)

## 2.0.5
* Bump version of passkeys_android (proguard file is no longer needed)

## 2.0.4
* Map excludeCredentials error to typed exception

## 2.0.3
* Added excludeCredentials support

## 2.0.2
* Added ConditionalUiUnconfirmedCredential to handle unconfirmed accounts during conditional UI.

## 2.0.1
* Update docs

## 2.0.0
* Stable release for v2
* Added support for flutter web
* Added CustomCorbadoAuth for developers who want to use their own session management
* BREAKING CHANGE: Renamed CorbadoAuth's methods to be consistent with our other SDKs

## 2.0.0-dev.3
* Bump passkeys + corbado_auth version
* Feat: Change customDomain parameter (now allows specifying the protocol also)
* Fix: startSignUpWithEmailCode now accepts the fullName parameter

## 2.0.0-dev.2
* Various fixes to corbado_auth

## 2.0.0-dev.1
* Added support for flutter web
* Added CustomCorbadoAuth for developers who want to use their own session management
* BREAKING CHANGE: Renamed CorbadoAuth's methods to be consistent with our other SDKs

## 1.2.1
* Bump version for passkeys

## 1.2.0
* Deprecate the customDomain setting (this does not have to be configured to production projects)
* Bump passkeys and flutter_keychain version

## 1.1.1
* Bump passkeys version

## 1.1.0
* Added email OTP for sign up and sign in.
* Added autocomplete for passkeys.
* Added appendPasskey and deletePasskey.
* Allow using custom domains (CNAME to the frontend API).
* Added autocomplete to the example.
* Start using riverpod in the example.

## 1.0.1

* Fix broken import from passkeys package
* Update docs

## 1.0.0

* Better comments. Stable release.

## 0.1.1

* Update image links in docs.

## 0.1.0

* Initial Open Source release.

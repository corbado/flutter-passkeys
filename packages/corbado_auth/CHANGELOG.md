## 3.7.1
* Fix init call triggering twice.

## 3.7.0
* Bump up passkeys version to 2.13.0.

## 3.6.0
* Bump up passkeys version to 2.9.0.
* Added support for passkeys doctor tool.
* Added telemetry support to better understand how our package is being used by developers. Find more [here](https://docs.corbado.com/corbado-complete/other/telemetry)

## 3.5.2
* Fixes Conditional Login not triggering (on iOS).

## 3.5.1
* Exposes the current `projectId` & `rpId`.

## 3.5.0
* Moved away from `flutter_keychain` to `flutter_secure_storage`.
* Makes storage project specific.

## 3.4.1
* Added persisting of `clientEnvHandle` to fix issues with passkeys intelligence.

## 3.4.0
* Deprecated `customDomain` and replaced with `frontendApiUrl` coming from the backend instead.
* Fixed a bug where reloading the page when logged in to a Production Project logs you out.

## 3.3.1
* Bump up version of passkeys to 2.7.1.

## 3.3.0
* Added Edit Email integration and screen when verifying Email.
* Added Full name to the sign-up flow when it is enabled in the console.
* Fixed issue with conditional UI never showing.
* Added support for editing user full name.
* Fixed `CorbadoError` not being exported from the package.

## 3.2.2
* Bump version of passkeys to 2.7.0.

## 3.2.1
* Fixes Platform.version exception on Web.

## 3.2.0
* Added `X-Corbado-SDK` header to all requests.

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

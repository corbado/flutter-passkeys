## 1.5.0

 - **FIX**: use flutter.compileSdkVersion instead of hardcoded 35 in passkeys_doctor. ([e8cbc7bb](https://github.com/corbado/flutter-passkeys/commit/e8cbc7bb5c87f7e95808effd27d883be7539e247))
 - **FIX**(passkeys_doctor): remove unused passkeys_ios dependency. ([81631cbf](https://github.com/corbado/flutter-passkeys/commit/81631cbf44c43a0a35aa0d7ee6589350f8f7bc56))
 - **FIX**(passkeys_doctor): widen device_info_plus upper bound to <14.0.0. ([d261caf1](https://github.com/corbado/flutter-passkeys/commit/d261caf17668b0ce628c4d94d4eef32307f9fb84))
 - **FIX**(passkeys_doctor): widen device_info_plus constraint to allow ^12.0.0. ([06687a63](https://github.com/corbado/flutter-passkeys/commit/06687a63301fd025846bdc90e7982aa0433d16a9))
 - **FEAT**(passkeys_doctor): widen package_info_plus to >=9.0.0 <11.0.0. ([2659a25d](https://github.com/corbado/flutter-passkeys/commit/2659a25d94250d32e3b600caf34ddf4580a1e20e))

## 1.4.1

* Uses `flutter.compileSdkVersion` instead of a hardcoded `compileSdk = 35` in the Android `build.gradle`, so the package inherits the host project's compile SDK. Fixes build failures alongside plugins that now require `compileSdk >= 36` (e.g. `device_info_plus`). See https://github.com/corbado/flutter-passkeys/issues/245.

## 1.4.0

* Widens `package_info_plus` constraint to `>=9.0.0 <11.0.0` to unblock consumers on `package_info_plus` 10.x. The only call site (`PackageInfo.fromPlatform().packageName`) is API-stable across the 9 → 10 bump. Unblocks downstream apps that need `share_plus 13.x` / `win32 ^6.0.1`. See https://github.com/corbado/flutter-passkeys/issues/240.
* Removes the unused `passkeys_ios` dependency (the package was renamed to `passkeys_darwin` and was never imported here).

## 1.3.1

* Widens `device_info_plus` constraint to `>=11.2.0 <14.0.0` to unblock consumers on `device_info_plus` 12.x.

## 1.3.0

* Updates `package_info_plus` dependency to `^9.0.0`.

## 1.2.0

* Fixes a bug where conditional UI abortion on Web is considered as a PlatformAuthenticationCancellation Exception.

## 1.1.0

* Addes new `PasskeyUnsupportedException` documentation.

## 1.0.0

* Initial open source stable release.

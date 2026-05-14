## 1.4.0

* Widens `package_info_plus` constraint to `>=9.0.0 <11.0.0` to unblock consumers on `package_info_plus` 10.x. The only call site (`PackageInfo.fromPlatform().packageName`) is API-stable across the 9 → 10 bump. Unblocks downstream apps that need `share_plus 13.x` / `win32 ^6.0.1`. See https://github.com/corbado/flutter-passkeys/issues/240.

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

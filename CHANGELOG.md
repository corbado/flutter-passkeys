# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2026-06-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`passkeys` - `v2.21.0`](#passkeys---v2210)
 - [`passkeys_darwin` - `v0.4.1`](#passkeys_darwin---v041)
 - [`passkeys_doctor` - `v1.5.0`](#passkeys_doctor---v150)
 - [`passkeys_platform_interface` - `v2.7.0`](#passkeys_platform_interface---v270)
 - [`passkeys_web` - `v2.9.1`](#passkeys_web---v291)
 - [`passkeys_windows` - `v0.1.2`](#passkeys_windows---v012)
 - [`corbado_auth` - `v3.7.2`](#corbado_auth---v372)
 - [`corbado_auth_firebase` - `v2.0.6`](#corbado_auth_firebase---v206)
 - [`passkeys_android` - `v2.12.1`](#passkeys_android---v2121)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `corbado_auth` - `v3.7.2`
 - `corbado_auth_firebase` - `v2.0.6`
 - `passkeys_android` - `v2.12.1`

---

#### `passkeys` - `v2.21.0`

 - **FIX**(README): correct support table formatting and update Windows support status. ([f0aad796](https://github.com/corbado/flutter-passkeys/commit/f0aad796ee4bf538f9df52407462cf4a19d92a09))
 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))
 - **FEAT**(example): add windows platform. ([1148fcf9](https://github.com/corbado/flutter-passkeys/commit/1148fcf981dab0c9ff0707f33c67fe87d4d09c5a))
 - **FEAT**(passkeys_windows): add windows implementation. ([99f9b8ff](https://github.com/corbado/flutter-passkeys/commit/99f9b8ff333fe448b06769532de51c3612d858a2))
 - **FEAT**(passkeys): add get availability type for windows. ([f51ffb09](https://github.com/corbado/flutter-passkeys/commit/f51ffb0947280cec824038b4936387e09b81de22))

#### `passkeys_darwin` - `v0.4.1`

 - **FEAT**(passkeys_darwin): add SwiftPM support. ([23fd8ac4](https://github.com/corbado/flutter-passkeys/commit/23fd8ac46208746fd83a2161de3f4482c12fcb7d))

#### `passkeys_doctor` - `v1.5.0`

 - **FIX**: use flutter.compileSdkVersion instead of hardcoded 35 in passkeys_doctor. ([e8cbc7bb](https://github.com/corbado/flutter-passkeys/commit/e8cbc7bb5c87f7e95808effd27d883be7539e247))
 - **FIX**(passkeys_doctor): remove unused passkeys_ios dependency. ([81631cbf](https://github.com/corbado/flutter-passkeys/commit/81631cbf44c43a0a35aa0d7ee6589350f8f7bc56))
 - **FIX**(passkeys_doctor): widen device_info_plus upper bound to <14.0.0. ([d261caf1](https://github.com/corbado/flutter-passkeys/commit/d261caf17668b0ce628c4d94d4eef32307f9fb84))
 - **FIX**(passkeys_doctor): widen device_info_plus constraint to allow ^12.0.0. ([06687a63](https://github.com/corbado/flutter-passkeys/commit/06687a63301fd025846bdc90e7982aa0433d16a9))
 - **FEAT**(passkeys_doctor): widen package_info_plus to >=9.0.0 <11.0.0. ([2659a25d](https://github.com/corbado/flutter-passkeys/commit/2659a25d94250d32e3b600caf34ddf4580a1e20e))

#### `passkeys_platform_interface` - `v2.7.0`

 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))
 - **FEAT**(passkeys_platform_interface): add windows availability type. ([7f68c446](https://github.com/corbado/flutter-passkeys/commit/7f68c446f69d23ab6615b961687bd0e4e167aaa4))

#### `passkeys_web` - `v2.9.1`

 - **FIX**: Avoid JSValue is not a String exception when building wasm. ([515172e5](https://github.com/corbado/flutter-passkeys/commit/515172e5d40b1ae82042d7d58f0d265c5e16e9ae))

#### `passkeys_windows` - `v0.1.2`

 - **FIX**: check if last char if null terminator before exclude. ([726f6ea2](https://github.com/corbado/flutter-passkeys/commit/726f6ea2e682ba90ea6f770cb9642b187eaecbd9))
 - **FEAT**(passkeys_windows): add windows implementation. ([99f9b8ff](https://github.com/corbado/flutter-passkeys/commit/99f9b8ff333fe448b06769532de51c3612d858a2))


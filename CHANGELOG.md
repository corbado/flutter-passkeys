# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2026-07-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`corbado_auth` - `v3.8.0`](#corbado_auth---v380)
 - [`corbado_auth_firebase` - `v2.0.8`](#corbado_auth_firebase---v208)
 - [`corbado_frontend_api_client` - `v2.2.1`](#corbado_frontend_api_client---v221)
 - [`passkeys` - `v2.22.0`](#passkeys---v2220)
 - [`passkeys_android` - `v2.13.0`](#passkeys_android---v2130)
 - [`passkeys_darwin` - `v0.4.2+2`](#passkeys_darwin---v0422)
 - [`passkeys_platform_interface` - `v2.9.0`](#passkeys_platform_interface---v290)
 - [`passkeys_web` - `v2.10.0`](#passkeys_web---v2100)
 - [`passkeys_windows` - `v0.1.3+2`](#passkeys_windows---v0132)
 - [`passkeys_doctor` - `v1.5.2`](#passkeys_doctor---v152)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `passkeys_doctor` - `v1.5.2`

---

#### `corbado_auth` - `v3.8.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)).
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).

#### `corbado_auth_firebase` - `v2.0.8`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)).
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)).
 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)).
 - **DOCS**: Remove comment about corbado_auth_firebase being broken ([#272](https://github.com/corbado/flutter-passkeys/issues/272)).

#### `corbado_frontend_api_client` - `v2.2.1`

 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)).

#### `passkeys` - `v2.22.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)).
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)).
 - **FIX**(passkeys_darwin): map no-credentials-available regardless of device locale ([#271](https://github.com/corbado/flutter-passkeys/issues/271)).
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys_web): add PRF extension support ([#274](https://github.com/corbado/flutter-passkeys/issues/274)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)).
 - **DOCS**(passkeys): document the PRF extension ([#275](https://github.com/corbado/flutter-passkeys/issues/275)).

#### `passkeys_android` - `v2.13.0`

 - **FIX**(passkeys_android): downgrade expected auth errors from Log.e to Log.d ([#273](https://github.com/corbado/flutter-passkeys/issues/273)).
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).

#### `passkeys_darwin` - `v0.4.2+2`

 - **FIX**(passkeys_darwin): map no-credentials-available regardless of device locale ([#271](https://github.com/corbado/flutter-passkeys/issues/271)).
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).

#### `passkeys_platform_interface` - `v2.9.0`

 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)).

#### `passkeys_web` - `v2.10.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)).
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)).
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)).
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)).
 - **FEAT**(passkeys_web): add PRF extension support ([#274](https://github.com/corbado/flutter-passkeys/issues/274)).

#### `passkeys_windows` - `v0.1.3+2`

 - **FIX**(passkeys_windows): prevent crash on window close and use-after-free in Register ([#261](https://github.com/corbado/flutter-passkeys/issues/261)).
 - **FEAT**(passkeys_windows): add PRF extension support ([#276](https://github.com/corbado/flutter-passkeys/issues/276)).
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)).


## 2026-07-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`passkeys` - `v2.21.1`](#passkeys---v2211)
 - [`passkeys_platform_interface` - `v2.8.0`](#passkeys_platform_interface---v280)
 - [`corbado_auth_firebase` - `v2.0.7`](#corbado_auth_firebase---v207)
 - [`corbado_auth` - `v3.7.3`](#corbado_auth---v373)
 - [`passkeys_darwin` - `v0.4.1+1`](#passkeys_darwin---v0411)
 - [`passkeys_android` - `v2.12.2`](#passkeys_android---v2122)
 - [`passkeys_windows` - `v0.1.2+1`](#passkeys_windows---v0121)
 - [`passkeys_web` - `v2.9.2`](#passkeys_web---v292)
 - [`passkeys_doctor` - `v1.5.1`](#passkeys_doctor---v151)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `corbado_auth_firebase` - `v2.0.7`
 - `corbado_auth` - `v3.7.3`
 - `passkeys_darwin` - `v0.4.1+1`
 - `passkeys_android` - `v2.12.2`
 - `passkeys_windows` - `v0.1.2+1`
 - `passkeys_web` - `v2.9.2`
 - `passkeys_doctor` - `v1.5.1`

---

#### `passkeys` - `v2.21.1`

 - **DOCS**(passkeys): document Android Digital Asset Links setup ([#256](https://github.com/corbado/flutter-passkeys/issues/256)). ([1777f145](https://github.com/corbado/flutter-passkeys/commit/1777f1451fc4a650deb1768cc2910237d8cca2db))

#### `passkeys_platform_interface` - `v2.8.0`

 - **FIX**(passkeys_platform_interface): default optional authenticatorSelection fields ([#254](https://github.com/corbado/flutter-passkeys/issues/254)). ([5f410f67](https://github.com/corbado/flutter-passkeys/commit/5f410f670be7d6c08f0d6236c13a102b6cc29f0c))
 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))
 - **FEAT**(passkeys_platform_interface): add windows availability type. ([7f68c446](https://github.com/corbado/flutter-passkeys/commit/7f68c446f69d23ab6615b961687bd0e4e167aaa4))


## 2026-06-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`passkeys` - `v2.21.0`](#passkeys---v2210)
 - [`passkeys_platform_interface` - `v2.7.0`](#passkeys_platform_interface---v270)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `passkeys_android` - `v2.12.1`
 - `passkeys_darwin` - `v0.4.1`
 - `passkeys_doctor` - `v1.5.0`
 - `passkeys_web` - `v2.9.1`
 - `passkeys_windows` - `v0.1.2`
 - `corbado_auth` - `v3.7.2`
 - `corbado_auth_firebase` - `v2.0.6`

---

#### `passkeys` - `v2.21.0`

 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))

#### `passkeys_platform_interface` - `v2.7.0`

 - **FEAT**: add PasskeyAuthenticatorInterface implemented by PasskeyAuthenticator ([#247](https://github.com/corbado/flutter-passkeys/issues/247)). ([bcc028fc](https://github.com/corbado/flutter-passkeys/commit/bcc028fc94c8875ed3240b8ebf76755f16dcc7ac))


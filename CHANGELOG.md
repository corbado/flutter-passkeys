# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2026-07-17

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
 - [`passkeys_doctor` - `v1.6.0`](#passkeys_doctor---v160)
 - [`passkeys_platform_interface` - `v2.9.0`](#passkeys_platform_interface---v290)
 - [`passkeys_web` - `v2.10.0`](#passkeys_web---v2100)
 - [`passkeys_windows` - `v0.1.3+2`](#passkeys_windows---v0132)

---

#### `corbado_auth` - `v3.8.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)). ([60312bd3](https://github.com/corbado/flutter-passkeys/commit/60312bd32b3435147341396b4a2210608aa1ff51))
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)). ([7a1bd0de](https://github.com/corbado/flutter-passkeys/commit/7a1bd0de58f594fe423d80f15dfc98568b34df7c))
 - **FIX**(corbado_auth): keep SDK version in sync from a single source ([#286](https://github.com/corbado/flutter-passkeys/issues/286)). ([8688f1d5](https://github.com/corbado/flutter-passkeys/commit/8688f1d5b0f83dca9c57f0b1b2883e6f658c3098))
 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)). ([d22c2a74](https://github.com/corbado/flutter-passkeys/commit/d22c2a740e5f3768bc08cdc4b64e688cd9aee1d8))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

#### `corbado_auth_firebase` - `v2.0.8`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)). ([60312bd3](https://github.com/corbado/flutter-passkeys/commit/60312bd32b3435147341396b4a2210608aa1ff51))
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)). ([7a1bd0de](https://github.com/corbado/flutter-passkeys/commit/7a1bd0de58f594fe423d80f15dfc98568b34df7c))
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)). ([ffe1d76f](https://github.com/corbado/flutter-passkeys/commit/ffe1d76fec67dd6a5dfa3731fc912e89d50fd44b))
 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)). ([d22c2a74](https://github.com/corbado/flutter-passkeys/commit/d22c2a740e5f3768bc08cdc4b64e688cd9aee1d8))
 - **DOCS**: Remove comment about corbado_auth_firebase being broken ([#272](https://github.com/corbado/flutter-passkeys/issues/272)). ([6a41dff7](https://github.com/corbado/flutter-passkeys/commit/6a41dff7decd1cb050b8ef547366ff1eb56c3262))

#### `corbado_frontend_api_client` - `v2.2.1`

 - **FIX**(corbado_auth_firebase): repair compile error and resolve analyzer issues ([#253](https://github.com/corbado/flutter-passkeys/issues/253)). ([d22c2a74](https://github.com/corbado/flutter-passkeys/commit/d22c2a740e5f3768bc08cdc4b64e688cd9aee1d8))

#### `passkeys` - `v2.22.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)). ([60312bd3](https://github.com/corbado/flutter-passkeys/commit/60312bd32b3435147341396b4a2210608aa1ff51))
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)). ([7a1bd0de](https://github.com/corbado/flutter-passkeys/commit/7a1bd0de58f594fe423d80f15dfc98568b34df7c))
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)). ([ffe1d76f](https://github.com/corbado/flutter-passkeys/commit/ffe1d76fec67dd6a5dfa3731fc912e89d50fd44b))
 - **FIX**(passkeys_darwin): map no-credentials-available regardless of device locale ([#271](https://github.com/corbado/flutter-passkeys/issues/271)). ([7414c54a](https://github.com/corbado/flutter-passkeys/commit/7414c54a24ddde979bc2d64d19b28a52065fc8ca))
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)). ([f8abd40c](https://github.com/corbado/flutter-passkeys/commit/f8abd40c119c4d5c22a02250a42bdda008a9c42a))
 - **FEAT**(passkeys_doctor): add web/macOS/Windows checks and only run doctor in debug mode ([#284](https://github.com/corbado/flutter-passkeys/issues/284)). ([5cf5c8b7](https://github.com/corbado/flutter-passkeys/commit/5cf5c8b755dffbe550f2879e605d5254100a5e0c))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys_web): add PRF extension support ([#274](https://github.com/corbado/flutter-passkeys/issues/274)). ([4f63d7ed](https://github.com/corbado/flutter-passkeys/commit/4f63d7ed9b6a19b7aac5527e0df1e24dd2662c23))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)). ([d9b028ff](https://github.com/corbado/flutter-passkeys/commit/d9b028ff9af7a2239fd89639604dc77355771968))
 - **DOCS**(passkeys): document the PRF extension ([#275](https://github.com/corbado/flutter-passkeys/issues/275)). ([ff009bad](https://github.com/corbado/flutter-passkeys/commit/ff009baddc05f73049f60fc454e58a642416a742))

#### `passkeys_android` - `v2.13.0`

 - **FIX**(passkeys_android): downgrade expected auth errors from Log.e to Log.d ([#273](https://github.com/corbado/flutter-passkeys/issues/273)). ([51f9b540](https://github.com/corbado/flutter-passkeys/commit/51f9b5400e143b26cba43c66bedd934f5be2c05b))
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)). ([f8abd40c](https://github.com/corbado/flutter-passkeys/commit/f8abd40c119c4d5c22a02250a42bdda008a9c42a))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

#### `passkeys_darwin` - `v0.4.2+2`

 - **FIX**(passkeys_darwin): map no-credentials-available regardless of device locale ([#271](https://github.com/corbado/flutter-passkeys/issues/271)). ([7414c54a](https://github.com/corbado/flutter-passkeys/commit/7414c54a24ddde979bc2d64d19b28a52065fc8ca))
 - **FIX**: improve error handling for excludeCredentials on iOS 26 and Android 16+ ([#237](https://github.com/corbado/flutter-passkeys/issues/237)). ([f8abd40c](https://github.com/corbado/flutter-passkeys/commit/f8abd40c119c4d5c22a02250a42bdda008a9c42a))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

#### `passkeys_doctor` - `v1.6.0`

 - **FEAT**(passkeys_doctor): add web/macOS/Windows checks and only run doctor in debug mode ([#284](https://github.com/corbado/flutter-passkeys/issues/284)). ([5cf5c8b7](https://github.com/corbado/flutter-passkeys/commit/5cf5c8b755dffbe550f2879e605d5254100a5e0c))
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)). ([d9b028ff](https://github.com/corbado/flutter-passkeys/commit/d9b028ff9af7a2239fd89639604dc77355771968))

#### `passkeys_platform_interface` - `v2.9.0`

 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)). ([7a1bd0de](https://github.com/corbado/flutter-passkeys/commit/7a1bd0de58f594fe423d80f15dfc98568b34df7c))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys): add PRF support for iOS and Android ([#263](https://github.com/corbado/flutter-passkeys/issues/263)). ([906a5069](https://github.com/corbado/flutter-passkeys/commit/906a5069583f76a6b05813b3cc8ab3418e984b11))

#### `passkeys_web` - `v2.10.0`

 - **REFACTOR**: clean up analysis lints and refine auth exception types ([#282](https://github.com/corbado/flutter-passkeys/issues/282)). ([60312bd3](https://github.com/corbado/flutter-passkeys/commit/60312bd32b3435147341396b4a2210608aa1ff51))
 - **REFACTOR**: adopt Dart 3.9 features and migrate the example integration tests to patrol ([#268](https://github.com/corbado/flutter-passkeys/issues/268)). ([7a1bd0de](https://github.com/corbado/flutter-passkeys/commit/7a1bd0de58f594fe423d80f15dfc98568b34df7c))
 - **FIX**: resolve Dependabot security alerts in npm dependencies ([#277](https://github.com/corbado/flutter-passkeys/issues/277)). ([ffe1d76f](https://github.com/corbado/flutter-passkeys/commit/ffe1d76fec67dd6a5dfa3731fc912e89d50fd44b))
 - **FEAT**(passkeys): expose WebAuthn Signal API ([#279](https://github.com/corbado/flutter-passkeys/issues/279)). ([c91ccc8e](https://github.com/corbado/flutter-passkeys/commit/c91ccc8e8021f65eeff42640f120d4a321df1426))
 - **FEAT**(passkeys_web): add PRF extension support ([#274](https://github.com/corbado/flutter-passkeys/issues/274)). ([4f63d7ed](https://github.com/corbado/flutter-passkeys/commit/4f63d7ed9b6a19b7aac5527e0df1e24dd2662c23))

#### `passkeys_windows` - `v0.1.3+2`

 - **FIX**(passkeys_windows): prevent crash on window close and use-after-free in Register ([#261](https://github.com/corbado/flutter-passkeys/issues/261)). ([92018cd4](https://github.com/corbado/flutter-passkeys/commit/92018cd4b6d800a4496e2d1301c4f13efce999e3))
 - **FEAT**(passkeys_windows): add PRF extension support ([#276](https://github.com/corbado/flutter-passkeys/issues/276)). ([d8dadfc1](https://github.com/corbado/flutter-passkeys/commit/d8dadfc1239857d2773477e12844a0bb13683f62))
 - **DOCS**: fix mistakes across package READMEs ([#281](https://github.com/corbado/flutter-passkeys/issues/281)). ([d9b028ff](https://github.com/corbado/flutter-passkeys/commit/d9b028ff9af7a2239fd89639604dc77355771968))


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


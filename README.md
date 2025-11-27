<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">

# Flutter passkeys

Flutter packages to enable passkey authentication (based on WebAuthn / FIDO2).

|             | Android            | iOS                | Linux | macOS              | Web                | Windows            |
| ----------- | ------------------ | ------------------ | ----- | ------------------ | ------------------ | ------------------ |
| **Support** | :white_check_mark: | :white_check_mark: | :x:   | :white_check_mark: | :white_check_mark: | :white_check_mark: |

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_sign_up.gif" alt="passkey-signup" height="500">

## Current list of packages

### 1. Passkeys

#### Description

A Flutter package that enables simple passkey authentication.
Currently Android and iOS are supported.

#### Features

- sign up and login users with passkeys
- connect your own relying party server or use pre-implemented ones

[Read more](./packages/passkeys/passkeys/README.md)

### 2. Corbado Auth

#### Description

A Flutter package that builds on the passkeys package.
It adds additional functionalities to make it simpler to use passkey authentication in your own Flutter app.

[![integration-guides](https://github.com/user-attachments/assets/7859201b-a345-4b68-b336-6e2edcc6577b)](https://app.corbado.com/integration-guides/flutter)

#### Features

- sign up and login users with passkeys
- connect Corbado as pre-implemented relying party server
- keep users logged in even if they close the app (automatic session refresh)

[Read more](./packages/corbado_auth/README.md)

### 3. Corbado Auth Firebase

A Flutter package that builds on the corbado_auth and the passkeys package.
It helps you to integrate passkey authentication into your Flutter app that uses Firebase as a backend.

> **Note:** This package is currently broken and will be fixed in the future. There is no specific ETA on when the fix will be available.

#### Features

- allow new users to sign up and log in using passkeys
- allow existing users (that you created with Firebase authentication) to setup a passkey and then log in with it
- email OTP codes as fallback mechanism for situations when passkeys can not be used (e.g. when a user logs in to a device where none of his passkeys is available)

[Read more](./packages/corbado_auth_firebase/README.md)

## Contributing

We're happy to receive your pull requests. For major changes, please open an issue first to discuss what you would like to change.

## Support

If you have questions, feedback or wishes regarding features, please reach out to us via [email](mailto:contact@corbado.com) or join our [passkeys community on Slack](https://join.slack.com/t/corbado/shared_invite/zt-1b7867yz8-V~Xr~ngmSGbt7IA~g16ZsQ).

## License

[BSD-3-clause](./LICENSE)

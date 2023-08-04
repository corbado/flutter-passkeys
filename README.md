# Flutter passkeys

Flutter packages to enable passkey authentication (based on WebAuthn / FIDO2).

|             | Android | iOS | Linux | macOS | Web | Windows |
|-------------|---------|-----|-------|-------|-----|---------|
| **Support** | yes     | yes | no    | no    | no  | no      |

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_sign_up.gif" alt="passkey-signup" height="500">

## Current list of packages

### 1. Passkeys
#### Description
A Flutter package that enables simple passkey authentication.
Currently Android and iOS are supported.

#### Features
* sign up and login users with passkeys
* connect your own relying party server or use pre-implemented ones

[Read more](./packages/passkeys/passkeys/README.md)

### 2. Corbado Auth 
#### Description
A Flutter package that builds on the passkeys package.
It adds additional functionalities to make it simpler to use passkey authentication in your own Flutter app.

#### Features
* sign up and login users with passkeys
* connect Corbado as pre-implemented relying party server
* keeping users logged in even if they close the app
* continuously updating a user's tokens (by default their lifetime is limited to 5 minutes)

[Read more](./packages/corbado_auth/README.md)


## Contributing
We're happy to receive your pull requests. For major changes, please open an issue first to discuss what you would like to change.

## Support
If you have questions, feedback or wishes regarding features, please reach out to us via [email](mailto:contact@corbado.com) or join our [passkeys community on Slack](https://join.slack.com/t/corbado/shared_invite/zt-1b7867yz8-V~Xr~ngmSGbt7IA~g16ZsQ).

## License
[BSD-3-clause](./LICENSE)

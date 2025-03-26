<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">

# Corbado Auth for Flutter

An authentication SDK to enable authentication through passkeys (based on WebAuthn / FIDO2).

[![integration-guides](https://github.com/user-attachments/assets/7859201b-a345-4b68-b336-6e2edcc6577b)](https://app.corbado.com/integration-guides/flutter)

Take a look at https://corbadoauth.flutter.corbado.io for a **live demo** (this is a Flutter web
deployment of the example on Vercel).

|             | Android            | iOS                | Linux | macOS | Web                | Windows |
| ----------- | ------------------ | ------------------ | ----- | ----- | ------------------ | ------- |
| **Support** | :white_check_mark: | :white_check_mark: | :x:   | :x:   | :white_check_mark: | :x:     |

## Features

- sign up and login users with passkeys on iOS, Android and Web by using Corbado as a relying party
  server
- login users with conditional UI
- emailOTP codes as fallback mechanism for situations when passkeys can not be used
- use Corbado's session management (keep user logged in even if he closes the app, automatic token
  refresh)

## Getting started

A Flutter package to enable authentication through passkeys.
Setting up passkey authentication requires you to have a backend that can act as a relying party.
As this is quite a bit of work, the Corbado team is at your service.
You can set up your relying party server just by creating and configuring your free Corbado project.
The Corbado Auth package helps you to integrate your Flutter app after you have set up your Corbado
project.
Additionally, it provides you with fallback mechanisms for situations when passkeys can not be
used (e.g. when an existing user logs in to a device where none of his passkeys is available) and
with session management.

So the goal of this package is to offer you a fully fledged authentication solution that you can use
when you want to build an app that utilizes passkeys.

**Note:** For an explanation on passkeys and the information flows between client, authenticator and
relying party, take a look at the [passkeys package](https://pub.dev/packages/passkeys).

## Integration guide and example

We’ve added a detailed [integration guide and example repository](https://github.com/corbado/example-passkeys-flutter) to help you get started quickly. It demonstrates how to build a full passkey-based authentication flow using this SDK.

> ⚠️ The example located in `/example` in this repo is for internal use only and is not intended for production use. Please refer to the external example repository linked above for a clean, production-ready implementation.

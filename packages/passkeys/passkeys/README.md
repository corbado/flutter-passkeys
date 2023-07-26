# passkeys

A Flutter package to enable authentication through passkeys (based on WebAuthn / FIDO2).

|             | Android | iOS | Linux | macOS | Web | Windows |
|-------------|---------|-----|-------|-------|-----|---------|
| **Support** | yes     | yes | no    | no    | no  | no      |


<img src="https://github.com/corbado/flutter-passkeys/assets/18458907/a132203f-4667-4bf1-9717-7b5761a2d2bd" style="width: 30%;" />
<img src="https://github.com/corbado/flutter-passkeys/assets/18458907/2bc01aa3-9ec3-4727-b41d-67e04323621e" style="width: 30%;" />


# Overview

1. [Usage](#1-usage)
2. [Introduction to passkeys](#2-introduction-to-passkeys)
3. [Challenges of default Flutter passkey implementation](#3-challenges-of-default-flutter-passkey-implementation)
4. [Use cases of this package](#4-use-cases-of-this-package)
    1. [Use case A: You just want to prototype with passkeys](#41-use-case-a-you-just-want-to-prototype-with-passkeys)
    2. [Use case B: You want to build an app using passkeys for authentication](#42-use-case-b-you-want-to-build-an-app-using-passkeys-for-authentication)
    3. [Use case C: You want to build an app using passkeys for authentication and Firebase as a backend](#43-use-case-c-you-want-to-build-an-app-using-passkeys-for-authentication-and-firebase-as-a-backend)
8. [Getting started](#5-getting-started)
    1. [iOS](#51-ios)
    2. [Android](#52-android)

## 1. Usage

To use this package, add `passkeys` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).
The best way to learn how you can set up passkeys in your Flutter app is to read the brief introduction below
and then take a look at the example of this package.
For a more elaborated example, you can also take a look at
the [`corbado_auth` package](https://pub.dev/packages/corbado_auth).

To start right away, you can use the following code (using Corbado as passkey backend provider, but you can use your own
passkey backend provider of course as well):

*main.dart:*

```dart
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/relying_party_server/corbado/types/shared.dart';

void main() async {
  final auth = PasskeyAuth(
    CorbadoPasskeyBackend(
      const String.fromEnvironment('CORBADO_PROJECT_ID'), // retrieve from https://app.corbado.com
    ),
  );

  final email = 'example@example.com';
  
  // Register
  final registerResponse = await auth.registerWithEmail(CorbadoRequest(email));
  print('Registration successful: ${registerResponse != null}');

  // Sign in
  final loginResponse = await auth.authenticateWithEmail(CorbadoRequest(email));
  print('Login successful: ${loginResponse != null}');
}

```

## 2. Introduction to passkeys

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/register_flow.png" style="width: 100%" alt="signup">

When it comes to understanding passkeys, there are three parties:

- the user of your Flutter app
- your Flutter app (installed on a device with e.g. Face ID or Touch ID)
- a relying party server (a backend where users' public keys will be stored)

To read more about the general flow of passkeys, please have look
at [our detailed explanation here](./doc/general_flow_of_passkeys.md).

## 3. Challenges of default Flutter passkey implementation

While passkeys are a more convenient and safer way for users to log into your app, there are two main problems to solve:

- to create the passkey during sign up and to use a passkey during login, the Flutter app has to interact with the
  platform (e.g. iOS or Android) => this problem is solved by this Flutter package
- you need a relying party server that is able to store public keys securely and create challenges => this problem is
  solved by services like [Corbado](https://corbado.com)

## 4. Use cases of this package

The _passkeys_ package enables you to sign up and log in users with passkeys.
It is not a full authentication SDK though.
A full authentication SDK additionally supports you with functionalities like:

- keeping a user logged in even if he closes the app
- continuously updating a user's tokens (usually their lifetime is limited), e.g. by using refreshTokens
- helping you to integrate your app with a backend (e.g. Firebase or a custom backend)

Keeping this in mind helps us to understand the following use cases:

### 4.1 Use case A: You just want to prototype with passkeys

In this use case, you can directly use this package.
Just set up the example and run it on your device.
If you like the experience with passkeys you might want to take a look at more advanced use cases afterwards.

### 4.2 Use case B: You want to build an app using passkeys for authentication

In this case, you will need the functionalities described previously (e.g. keeping the user logged in even when he
closes the app).
You can now either build your own authentication SDK.
When you build it, you can make use of this package.

Alternatively, you can just make use of the _corbado_auth_ package.
It supports all the mentioned functionalities.
Internally, it makes use of this passkeys package.
Additionally, it includes an advanced example on how to build an app with passkeys authentication.

### 4.3 Use case C: You want to build an app using passkeys for authentication and Firebase as a backend

In this case, you need to deploy a Firebase Extension.
We will open source an implementation for that (including an example) very soon.

## 5. Getting started

In the following example, we will use Corbado as a relying party server.
This gives you the advantage that you don't have to implement anything on your backend side to make passkey
authentication work.
If you wanted, you could implement your own relying party server.
For this example, we want to keep it simple though.
All you need to do is a bit of configuration in [Corbado's developer panel](https://app.corbado.com).

### 5.1 iOS

To set up your iOS app, please have a look at [our iOS guide](#51-ios).

### 5.2 Android

To set up your iOS app, please have a look at [our Android guide](#52-android).

## 6. Resources

- For a more detailed explanation on how to use this Flutter package and understand the underlying architecture, please
  take a look at the following [blog post](https://corbado.com/blog/flutter-passkeys-package).
- To give you a head start, you can use the [corbado_auth package](https://pub.dev/packages/corbado_auth) (which is also
  used in the examples) and serves as the bridge to a hosted relying party server that you can use out-of-the-box for
  free.

## 7. Support

If you have questions, feedback or wishes regarding features, please reach out to us
via [email](mailto:contact@corbado.com) or join our passkeys community
on [Slack](https://join.slack.com/t/corbado/shared_invite/zt-1b7867yz8-V~Xr~ngmSGbt7IA~g16ZsQ).

## 8. Contribute

If you want to contribute to make the Internet a safer by place by pushing passkeys as secure login method, feel free to
contribute by opening a pull request.

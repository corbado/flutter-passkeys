# passkeys

A Flutter package to enable authentication through passkeys (based on WebAuthn / FIDO2).

|             | Android | iOS | Linux | macOS | Web | Windows |
|-------------|---------|-----|-------|-------|-----|---------|
| **Support** | yes     | yes | no    | no    | no  | no      |


<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_sign_up.gif" alt="signup" height="500">

## Features

* register and sign in users with passkeys
* connect your own relying party server or use pre-implemented ones

## Getting started
The best way to learn how you can set up passkeys in your Flutter app is to read the brief introduction below and then take a look at the example of this package.

### Introduction

When it comes to understanding passkeys, there are three parties:

- the user of your Flutter app
- your Flutter app (installed on a device with e.g. Face ID or Touch ID)
- a relying party server (a backend where users' public keys will be stored)

<details>
<summary>More information on how these three parties interact with each other to make passkeys work</summary>

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/register_flow.png" style="width: 100%" alt="signup">

Like with traditional password-based authentication flows, a user has to sign up first, i.e. set up a passkey.
The flow is shown in the image above.

At first, the user will provide his email address to your app.
This email address will be sent to the relying party server.
You can implement that server yourself, or you can rely on prebuilt ones (e.g. provided by [Corbado](https://corbado.com)).
The relying party server's response will contain *publicKeyCredentialCreationOptions*.
It contains all information required by the user's device to set up a passkey.

Your app will now interact with your native device's OS (no worries, the actual work is abstracted by this Flutter package) to ask the user to set up a passkey.
All he has to do is to provide his biometrics once (e.g. via Face ID or Touch ID).
After this setup, a private key and a public key are created.
The private key is stored securely on the user's device.
The public key is sent to the relying party server.
For this to work, the app has to be associated with the relying party server.
This involves a bit of configuration in your app and on the relying party server (find more details below where we explain how to set up the example).
The relying party server will validate and store the public key.
Afterwards, it will respond with a success message (e.g. a JWT token).

From now on, the user can log into your app using this biometric information.
On each login, your app will ask the relying party server for a *challenge*.
The relying party server generates a challenge that must be signed with the private key.
To access that private key the app asks once again the user for his biometrics (another call to your native device's OS).
After the user has provided his biometrics (e.g. by putting his finger on the fingerprint reader), the challenge is signed and the signed challenge is sent to the relying party server.
Using the public key, it will validate the signed challenge and the server will answer with a success message (e.g. a JWT token).

</details>

### Example

To run the [example](https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/example/lib/main.dart) follow these steps:
* Clone the GitHub Repo `git clone git@github.com:corbado/flutter-passkeys.git`
* Go to the example directory and run the example app `cd packages/passkeys/passkeys/example` and `flutter run lib/main.dart`
* Register a new user by providing an email address and clicking *sign up*.
* After logging out you can sign in by providing the exact same email address again or sign up another user by providing a new one.

Find more explanations to this example and troubleshooting in the example's [readme](https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/example/README.md).

## Usage

To get an idea about how to use this package to register and sign in users take a look at the code below.
It has been extracted from the example of this package.
So to see this code in connection with a UI take a look at the example and run it on your machine.

```dart
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys_example/relying_party_server.dart';
 
_register() async {
  final auth = PasskeyAuth(SharedRelyingPartyServer());
  final registerResponse = await auth.registerWithEmail(const RpRequest(email: 'user@example.com'));
  print('Registration successful: ${registerResponse != null}');
}
```

```dart
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys_example/relying_party_server.dart';
 
_signIn() async {
  final auth = PasskeyAuth(SharedRelyingPartyServer());
  final signInResponse = await auth.authenticateWithEmail(const RpRequest(email: email));
  print('Sign in successful: ${signInResponse != null}');
}
```

We now want to quickly go through the most common use cases for Flutter developers when using passkeys. 
We will try to show how this package can help with each use case.
While use case 1 is a very basic one (exploration only) 2 and 3 show cases in which real apps are built.
Use case 4 and 5 are more advanced solutions that try to help you with building more complicated apps.

### 1. You just want to prototype with passkeys

You just want to see passkeys in action in a Flutter app?
Then the example of this package is the right point for you to start.
There is no configuration required and you can go through sign up and sign in flows on your simulator/emulator.

**Shortcomings:**
* You share a relying party server with the whole world. For an example this is ok but if you want to build your own app you need your own relying party server.
* You can not run the example on physical iOS devices but only on a simulator (for Android physical devices + emulators work)

### 2. You want to use passkeys for your app and you already have built your relying party server

If you already have a relying party server you just need to tell this package how to interact with it.
This is done by implementing the *RelyingPartyServer* interface.
Use that implementation to initialize the *PasskeyAuth* object.

```dart
import 'package:passkeys/passkey_auth.dart';
 
_signIn() async {
  final auth = PasskeyAuth(YourOwnRelyingPartyServer());
  final registerResponse = await auth.registerWithEmail(const RpRequest(email: 'user@example.com'));
  print('Registration successful: ${registerResponse != null}');
}
```

### 3. You want to use passkeys for your app but you don't want to build your own relying party server

To use passkeys in your own app you need a relying party server.
If you don't want to build one you can use already existing solutions.
To allow this package to integrate with a relying party server the *RelyingPartyServer* interface must be implemented for that particular server.

[Corbado](https://app.corbado.com) lets you set up a relying party server.
This package also comes with a ready to use implementation for the *RelyingPartyServer* interface that connects to your relying party server.
So, to save a bit of time and effort you can use Corbado as a relying party server. 
Find an example how to do this including a step by step guide [here]().

You can use every other SaaS provider that allows you to set up a relying party server though.
All you need to do is implement the *RelyingPartyServer* interface.

### 4. You want to build an app that supports more advanced use cases with passkeys

While this package allows you to use passkeys for authentication a few challenges remain unsolved, e.g.:
* App users don't want to sign in every time they open an app, so how can we keep them signed in?
* Not every device supports passkeys yet, how can we provide an alternative sign in for these users?
* A user might have used your app on another device and now try to sign in on a new one. His passkey is still on that old device, so how can we sign him in on the new one?

Solving these challenges goes beyond the scope of this package.
To address them, we have built another Flutter package: [corbado_auth](https://pub.dev/packages/corbado_auth).
For more information, check out its documentation and examples.

### 5. You want to use Firebase together with passkeys

Firebase is a great technology that helps you with building your app.
We are currently working on a solution that enables this package to be used together with Firebase Auth.


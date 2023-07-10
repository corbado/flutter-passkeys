# passkeys

A Flutter plugin to enable authentication through passkeys.

|             | Android | iOS | Linux | macOS | Web | Windows |
| ----------- | ------- | --- | ----- | ----- | --- | ------- |
| **Support** | yes     | yes | no    | no    | no  | no      |

## Usage

To use this plugin, add `passkeys` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).
The best way to learn how you can setup passkeys in your app is to read the brief introduction below
and then take a look at the example of this package.
For a more elaborated example you can also take a look at the corbado_auth package.

## Introduction to passkeys

tbd. (explain passkeys flow, using authenticator, relying party server and client => use an image here).

## Use cases of this package

The _passkeys_ package enables you to register and sign in users with passkeys.
It is not a full authentication SDK though.
An authentication SDK additionally supports you with functionalities like:

- keeping a user logged in even if he closes the app
- continuously updating a user's tokens (usually their lifetime is limited), e.g. by using refreshTokens
- helping you to integrate your app with a backend (e.g. Firebase or a custom backend)

Keeping this in mind helps us to understand the now following use cases.

### Use case 1: You just want to play a bit with passkeys and get to know them

In this case you can directly use this package.
Just setup the example and run it on your device.
If you like the experience with passkeys you might want to take a look at more advanced use cases afterwards.

### Use case 2: You want to build an app using passkeys for authentication

In this case you will need the functionalities described previously (e.g. keeping the user logged in even when he closes the app).
You can now either build your own authentication SDK.
When you build it you can make use of this package.

Or, you can just make use of the corbado_auth package.
It supports all of the mentioned functionalities.
Internally it makes use of this package.
Additionally, it includes an advanced example on how to build an app with passkeys authentication.

### Use case 3: You want to build an app using passkeys for authentication and firebase as a backend

tbd. (Firebase Extension)

## Configuration for the example

### iOS

#### 1. Setup Corbado project

Create a free Corbado project at https://corbado.com if you haven't got one yet.

#### 2. Setup an iOS app

Setup an iOS app at https://app.corbado.com/app/settings/credentials/native-apps by clicking "Add New".
You will need your **App ID Prefix** (e.g. `9RF9KY77B2`) and your **Bundle ID** (e.g. `com.corbado.passkeys`).

#### 3. Configure your iOS project

In your Xcode workspace, you need to configure the following settings:

- In `Signing & Capabilities` tab, add the `Associated Domains` capability and add the following domain: `applinks:{PROJECT_ID}.frontend.api.corbado.io`

#### 4. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=PROJECT_ID lib/main.dart`

### Android

#### 1. Setup Corbado project

Create a free Corbado project at https://corbado.com if you haven't got one yet.

#### 2. Setup an Android app

Setup an Android app at https://app.corbado.com/app/settings/credentials/native-apps by clicking "Add New".
You will need your **Package name** (e.g. `com.corbado.passkeys`) and your **App fingerprint** (e.g. `54:4C:94:2C:E9:...`).

#### 3. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=PROJECT_ID lib/main.dart`

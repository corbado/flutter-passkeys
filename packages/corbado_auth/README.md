# Corbado Auth for Flutter

## Getting started

A Flutter package to enable authentication through passkeys.
Setting up passkey authentication requires you to have a backend that can act as a relying party.
As this is quite a bit of work the Corbado team is at your service.
You can set up your relying party server just by creating and configuring your free Corbado project.
The Corbado Auth package helps you to integrate your app after you have set up your Corbado project.

This package offers the following functionalities:

- keeping a user logged in even if he closes the app
- continuously updating a user's tokens (by default their lifetime is limited to 5 minutes)

**Note:** For an explanation on passkeys and the information flows between client, authenticator and
relying party, take a look at the [passkeys package](https://pub.dev/packages/passkeys).

## Configuration to start the example project

These steps are required to run the example but you also need to follow them to create your own app.

### iOS

#### 1. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet. Select integration mode as `Web component`.

#### 2. Set up an iOS app

Setup an iOS app at https://app.corbado.com/app/settings/credentials/native-apps by clicking "Add New".
You will need your **App ID Prefix** (e.g. `9RF9KY77B2`) and your **Bundle ID** (e.g. `com.corbado.passkeys`). Corbado automatically creates an `apple-app-site-association` file for you at [https://{PROJECT_ID}.frontendapi.corbado.io/.well-known/apple-app-site-association], which is required for Universal Links to work.

#### 3. Configure your iOS project

- open the Runner Xcode
- In `Signing & Capabilities` tab add the `Associated Domains` capability and add the following domain: `applinks:{PROJECT_ID}.frontendapi.corbado.io`
- `Associated Domains` if necessary, should also be activated in your [Apple Developer](https://developer.apple.com) account. See [here](https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app) for more information.
- You can add the App Links to your project in developer mode, e.g. `applinks:{PROJECT_ID}.frontendapi.corbado.io?mode=developer`. This way the applinks are discovered immediately, and no waiting is required. In this case, the App Link capability should be activated in the developer settings on the testing device.

#### 4. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=PROJECT_ID lib/main.dart`

### Android

#### 1. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.

#### 2. Set up an Android app

Setup an Android app at https://app.corbado.com/app/settings/credentials/native-apps by clicking "Add New".
You will need your **Package name** (e.g. `com.corbado.passkeys`) and your **App fingerprint** (e.g. `54:4C:94:2C:E9:...`).

#### 3. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=PROJECT_ID lib/main.dart`

## A closer look at the example

After following the configuration steps above you can run the app.
The first screen you will see is the login page.
Here, you can create a new user account by providing an email address and clicking on 'sign up'.
After providing your fingerprint / face scan, a new passkey is created and stored on your device.

You will now be logged into the app and see the home page.
Your user info is represented by an id token that has been retrieved from the Corbado API during the sign up process.
You can view that token by clicking on "token details".
Here, you can observe how the token is refreshed automatically (its lifetime will increase once in a while).

You can also close and reopen the app.
You should still be logged in.

<img src="./docs/img/signup.jpeg" height="500" alt="signup">
<img src="./docs/img/signup_fingerprint.jpeg" height="500" alt="signup fingerpring">
<img src="./docs/img/home.jpeg" height="500" alt="home">
<img src="./docs/img/idtoken.jpeg" height="500" alt="id token">

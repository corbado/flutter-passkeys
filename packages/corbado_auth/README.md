<img width="1070" alt="GitHub Repo Cover" src="https://github.com/corbado/flutter-passkeys/blob/feature/flutter-web/.github/images/root_headline.png">

# Corbado Auth for Flutter

An authentication SDK to enable authentication through passkeys (based on WebAuthn / FIDO2).

Take a look at https://corbadoauth.demo.corbado.io for a live demo (this is a Flutter web deployment of the example on Vercel).

|             | Android            | iOS                | Linux | macOS | Web                | Windows |
|-------------|--------------------|--------------------|-------|-------|--------------------|---------|
| **Support** | :white_check_mark: | :white_check_mark: | :x:   | :x:   | :white_check_mark: | :x:     |

## Features

* sign up and login users with passkeys on iOS, Android and Web by using Corbado as a relying party
  server
* login users with conditional UI
* emailOTP codes as fallback mechanism for situations when passkeys can not be used
* use Corbado's session management (keep user logged in even if he closes the app, automatic token
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

## Preparations and configuration

These steps are required to run the example but you also need to follow them to create your own app.

### iOS

#### 1. Create an iOS app 

We need to establish trust between your iOS app and the relying party server.
Your app will be identified through your **Application Identifier Prefix** (e.g. `9RF9KY77B2`) and
your **Bundle Identifier** (e.g. `com.corbado.passkeys`).
You need an Apple developer account to set up both.
If you haven't got one yet, set up a new account.

**Note:** When creating your Bundle Identifier, make sure that the "Associated Domains" capability
is enabled.

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/bundleId.png" alt="xcode-associated-domains">

Open the example in Xcode now by opening `packages/passkeys/passkeys/example/ios`.
In *Runner* -> *Signing & Capabilites* enter your *Application Identifier Prefix* and your *Bundle
Identifier*.

#### 2. Set up your Corbado project

Create a free Corbado project at
the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No
existing users'.

#### 3. Configure your iOS app in Corbado

Make sure that under [*Settings* -> *User interface* -> *Identity
verification*](https://app.corbado.com/app/settings/userinterface) "Option 2: No verification
required" is selected. This should be set by default, when selecting 'Native / mobile app' in
the [previous step](#2-set-up-corbado-project).

Set up an iOS app at [*Settings* -> *Native
apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add New".
You will need your **Application Identifier Prefix** and your **Bundle Identifier** that we set up
in [step 1](#1-create-an-ios-app-and-configure-the-example-in-xcode).

Afterwards, your relying party server will host an `apple-app-site-association` file
at `https://{PROJECT_ID}}.frontendapi.corbado.io/.well-known/apple-app-site-association`.
This file will by downloaded by iOS when you install your app.
To tell iOS where to look for the file, we need the next step in our setup.

#### 4. Configure your iOS project

In your Xcode workspace, you need to configure the following settings:
In `Signing & Capabilities` tab, add the `Associated Domains` capability and add the following
domain: `webcredentials:{PROJECT_ID}.frontendapi.corbado.io`
Now, iOS knows where to download the `apple-app-site-association` file from.

If you forget about this step, the example will show you an error message
like `Your app is not associated with your relying party server. You have to add...`.
Your configuration inside Xcode should look something like in the screenshot below (you will have
your own Corbado project ID and a different Bundle Identifier).

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/passkeys_example_ios_associated_domains.png" height="250" alt="xcode-associated-domains">

#### 5. Start your example

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

If you want to run the example from your IDE, please make sure to either

- set the CORBADO_PROJECT_ID environment variable to your Corbado project ID
- replace `const String.fromEnvironment('CORBADO_PROJECT_ID')` directly in the example with your
  Corbado project ID

### Android

#### 1. Set up Corbado project

Create a free Corbado project at
the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No
existing users'.

After creating the project you will get a Corbado project ID (e.g. `pro-4268394291597054564`).
You will need it in the next steps.

#### 2. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

#### 3. Set up an Android app in Corbado

Setup an Android app at [*Settings* -> *Credentials* -> *Native
apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add new".
You will need your **Package name** (e.g. `com.corbado.corbadoauth.example`) and your **SHA-256
fingerprint** (e.g. `54:4C:94:2C:E9:...`).

The package name of your app is defined in *example/android/app/build.gradle* (applicationId).
Its default value for the example app is `com.corbado.corbadoauth.example`.

The easiest way to find your SHA-256 fingerprint is to look into the logs of the example app.
You will find a log message like `Fingerprint: 54:4C:94:2C:E9:...`.
Copy the full SHA-256 fingerprint and use it to set up the Android app in the Corbado developer
panel.

Alternatively, you can execute one of the following commands to obtain the SHA-256 fingerprint:

- macOS /
  Linux: `keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`
-

Windows: `keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android`

Now, you are fully set and you can start signing up with your first passkey in the example.

## A closer look at the example

After following the configuration steps above, you can run the app.
The first screen you will see is the login page.
Here, you can create a new user account by providing an email address and clicking on 'sign up'.
After providing your fingerprint / face scan, a new passkey is created and stored on your device.

You will now be logged into the app and see the home page.
Your user info is represented by an id token that has been retrieved from Corbado during the sign up
process.
You can view that token by clicking on "token details".
Here, you can observe how the token is refreshed automatically (its lifetime will increase once in a
while).

You can also close and reopen the app.
You should still be logged in.

<p float="left">
    <img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/signup.jpeg" height="500" alt="signup">
    <img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/signup_fingerprint.jpeg" height="500" alt="signup fingerpring">
    <img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/home.jpeg" height="500" alt="home">
    <img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/corbado_auth/doc/img/idtoken.jpeg" height="500" alt="id token">
</p>

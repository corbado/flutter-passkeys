# passkeys

A Flutter plugin to enable authentication through passkeys.

|             | Android | iOS | Linux | macOS | Web | Windows |
|-------------|---------|-----|-------|-------|-----|---------|
| **Support** | yes     | yes | no    | no    | no  | no      |

## Usage

To use this plugin, add `passkeys` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).
The best way to learn how you can set up passkeys in your Flutter app is to read the brief introduction below
and then take a look at the example of this package.
For a more elaborated example, you can also take a look at the `corbado_auth` package.

## Introduction to passkeys

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/register_flow.png" height="500" alt="signup">

When it comes to understanding passkeys, there are three parties:
- the user of your Flutter app
- your Flutter app (installed on a device with Face ID or Touch ID)
- a relying party server (a backend where users' public keys will be stored)

Like with traditional password-based authentication flows, a user has to sign up first, i.e. set up a passkey.
The flow is shown in the image above.

At first, the user will provide his email address to your app.
This email address will be sent to the relying party server.
You can implement that server yourself, or you can rely on prebuilt ones (e.g. provided by Corbado).
The relying party server's response will contain *publicKeyCredentialCreationOptions*.
It contains all information required by the user's device to set up a passkey.

Your app will now interact with your native device's OS (no worries, the actual work is abstracted by this Flutter package) to ask the user to set up a passkey.
All he has to do is to provide his biometrics once (e.g. via Face ID or Touch ID).
After this setup, a private key and a public key are created. 
The private key is stored securely on the user's device.
The public key is sent to the relying party server. 
For this to work, the app has to be associated with the relying party server. 
This involves a bit of configuration in your app and on the relying party server (find more details below where we explain how to set up the example). 
The relying party server will validate and store the private key.
Afterwards, it will respond with a success message (e.g. a JWT token). 

From now on, the user can log into your app using this biometric information.
On each login, your app will ask the relying party server for a *challenge*.
The relying party server generates this challenge using the public key that was stored during the sign up flow.
Therefore, this task can only be solved by someone who has access to the private key.
To solve the challenge, the app asks once again the user for his biometrics (another call to your native device's OS).
After the user has provided his biometrics (e.g. by putting his finger on the fingerprint reader), the challenge is signed and the signed challenge is sent to the relying party server.
If the signed challenge is correct, the server will answer with a success message (e.g. a JWT token).

While this is a more convenient and safe way for users to log into your app, there are two main problems to solve:
- to create the passkey during sign up and to sign the challenge during login, the app has to interact with the platform (e.g. iOS or Android) => this problem is solved by this Flutter package
- you need a relying party server that is able to store public keys securely and create challenges => this problem is solved by services like [Corbado](https://corbado.com)

## Use cases of this package

The _passkeys_ package enables you to sign up and log in users with passkeys.
It is not a full authentication SDK though.
A full authentication SDK additionally supports you with functionalities like:

- keeping a user logged in even if he closes the app
- continuously updating a user's tokens (usually their lifetime is limited), e.g. by using refreshTokens
- helping you to integrate your app with a backend (e.g. Firebase or a custom backend)

Keeping this in mind helps us to understand the following use cases:

### Use case A: You just want to prototype with passkeys

In this use case, you can directly use this package.
Just set up the example and run it on your device.
If you like the experience with passkeys you might want to take a look at more advanced use cases afterwards.

### Use case B: You want to build an app using passkeys for authentication

In this case, you will need the functionalities described previously (e.g. keeping the user logged in even when he closes the app).
You can now either build your own authentication SDK.
When you build it, you can make use of this package.

Alternatively, you can just make use of the _corbado_auth_ package.
It supports all the mentioned functionalities.
Internally, it makes use of this passkeys package.
Additionally, it includes an advanced example on how to build an app with passkeys authentication.

### Use case C: You want to build an app using passkeys for authentication and Firebase as a backend

In this case, you need to deploy a Firebase Extension.
We will open source an implementation for that (including an example) very soon.

## Configuration to set up the example

In the following example, we will use Corbado as a relying party server.
This gives you the advantage that you don't have to implement anything on your backend side to make passkey authentication work.
If you wanted, you could implement your own relying party server.
For this example, we want to keep it simple though.
All you need to do is a bit of configuration in [Corbado's developer panel](https://app.corbado.com).

### iOS

#### 1. Create an iOS app and configure the example in XCode

We need to establish trust between your iOS app and the relying party server.
Your app will be identified through your **Application Identifier Prefix** (e.g. `9RF9KY77B2`) and your **Bundle Identifier** (e.g. `com.corbado.passkeys`).
You need an Apple developer account to set up both.
If you haven't got one yet, set up a new account.

**Note:** When creating your Bundle Identifier, make sure that the "Associated Domains" capability is enabled.

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/bundleId.png" alt="xcode-associated-domains">

Open the example in Xcode now by opening `packages/passkeys/passkeys/example/ios`.
In *Runner* -> *Signing & Capabilites* enter your *Application Identifier Prefix* and your *Bundle Identifier*.

#### 2. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No existing users'.

#### 3. Set up an iOS app in Corbado

Make sure that under [*Settings* -> *User interface* -> *Identity verification*](https://app.corbado.com/app/settings/userinterface) "Option 2: No verification required" is selected. This should be set by default, when selecting 'Native / mobile app' in the [previous step](#2-set-up-corbado-project).

Set up an iOS app at [*Settings* -> *Credentials* -> *Native apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add New".
You will need your **Application Identifier Prefix** and your **Bundle Identifier** that we set up in [step 1](#1-create-an-ios-app-and-configure-the-example-in-xcode).

Afterwards, your relying party server will host an `apple-app-site-association` file at `https://{PROJECT_ID}}.frontendapi.corbado.io/.well-known/apple-app-site-association`.
This file will by downloaded by iOS when you install your app.
To tell iOS where to look for the file, we need the next step in our setup.

#### 4. Configure your iOS project

In your Xcode workspace, you need to configure the following settings:
In `Signing & Capabilities` tab, add the `Associated Domains` capability and add the following domain: `webcredentials:{PROJECT_ID}.frontendapi.corbado.io`
Now, iOS knows where to download the `apple-app-site-association` file from.

If you forget about this step, the example will show you an error message like `Your app is not associated with your relying party server. You have to add...`.
Your configuration inside Xcode should look something like in the screenshot below (you will have your own Corbado project ID and a different Bundle Identifier).

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/passkeys_example_ios_associated_domains.png" height="250" alt="xcode-associated-domains">

#### 5. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

Now you are fully set and you can start signing up with your first passkey in the example.

If you want to run the example from your IDE, please make sure to either
- set the CORBADO_PROJECT_ID environment variable to your Corbado project ID
- replace `const String.fromEnvironment('CORBADO_PROJECT_ID')` directly in the example with your Corbado project ID

### Android

#### 1. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No existing users'.

After creating the project you will get a Corbado project ID (e.g. `pro-4268394291597054564`).
You will need it in the next steps.

#### 2. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

#### 3. Set up an Android app in Corbado

Setup an Android app at [*Settings* -> *Credentials* -> *Native apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add new".
You will need your **Package name** (e.g. `com.corbado.corbadoauth.example`) and your **SHA-256 fingerprint** (e.g. `54:4C:94:2C:E9:...`).

The package name of your app is defined in *example/android/app/build.gradle* (applicationId).
Its default value for the example app is `com.corbado.corbadoauth.example`.

The easiest way to find your SHA-256 fingerprint is to look into the logs of the example app.
You will find a log message like `Fingerprint: 54:4C:94:2C:E9:...`.
Copy the full SHA-256 fingerprint and use it to set up the Android app in the Corbado developer panel.

Finally, you have to whitelist your app in the Corbado developer panel’s authorized origins. To do so, go to [“Settings” -> “Credentials” -> “Authorized Origins”](https://app.corbado.com/app/settings/credentials/authorized-origins) and click "Add new". 
For the *Name* field you can choose any value you like.
For the *Origin* field provide `android:apk-key-hash:<base64-encoded-app-fingerprint>` (e.g. `android:apk-key-hash:VEyULOkvasF9VsJd29ZecTKkDWJ-PvLkCagYn9BjqPs`).
The value for your app can also be found in the log messages of the example (`setting Origin of API requests to android:apk-key-hash:VEy...`).

Now, you are fully set and you can start signing up with your first passkey in the example.

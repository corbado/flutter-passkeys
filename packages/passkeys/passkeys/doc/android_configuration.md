# Android

1. [Set up Corbado project](#1-set-up-corbado-project)
2. [Set up an Android app in Corbado](#2-set-up-an-android-app-in-corbado)
3. [Start the example](#3-start-the-example)
4. [Troubleshooting](#4-troubleshooting)

## 1. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't
got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No existing users'.

After creating the project you will get a Corbado project ID (e.g. `pro-4268394291597054564`).
You will need it in the next steps.

## 2. Set up an Android app in Corbado

Set up an Android app at [*Settings* -> *Credentials* -> *Native
apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add new".
You will need your **Package name** (e.g. `com.corbado.corbadoauth.example`) and your **SHA-256 fingerprint** (
e.g. `54:4C:94:2C:E9:...`).

The package name of your app is defined in *example/android/app/build.gradle* (applicationId).
Its default value for the example app is `com.corbado.corbadoauth.example`.

To find your SHA-256 fingerprint, you can execute the following command:

- macOS /
  Linux: `keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`
-

Windows: `keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android`

Alternatively, you can look in to the logs of the running example app. You will find a log message
like `Fingerprint: 54:4C:94:2C:E9:...`.
Copy the full SHA-256 fingerprint and use it to set up the Android app in the Corbado developer panel.

## 3. Start the example

> **Note**
> You need to have a screen lock set up.
> Moreover, if you use a virtual Android device, it needs to have API 33 (Android 13).

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

Now, you are fully set and can start signing up with your first passkey in the example.

## 4. Troubleshooting

If you run the application in a virtual Android device, and it says that you can't create a passkey, you have to properly
set up a screen lock or biometrics on the device. To do so, open the settings, search for security settings and add a
PIN as well as a fingerprint as shown below (PIN is required for fingerprint):

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/troubleshooting-no-screen-lock.png?raw=true" style="width: 100%" alt="troubleshooting"/>

# Android

1. [Set up Corbado project](#1-set-up-corbado-project)
2. [Start the example](#2-start-the-example)
3. [Set up an Android app in Corbado](#3-set-up-an-android-app-in-corbado)
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

Alternatively, you can look in to the logs of the running example app.You will find a log message
like `Fingerprint: 54:4C:94:2C:E9:...`.
Copy the full SHA-256 fingerprint and use it to set up the Android app in the Corbado developer panel.

Finally, you have to whitelist your app in the Corbado developer panel’s authorized origins. To do so, go
to [“Settings” -> “Credentials” -> “Authorized Origins”](https://app.corbado.com/app/settings/credentials/authorized-origins)
and click "Add new".
For the *Name* field you can choose any value you like.
For the *Origin* field provide `android:apk-key-hash:<base64-encoded-app-fingerprint>` (
e.g. `android:apk-key-hash:VEyULOkvasF9VsJd29ZecTKkDWJ-PvLkCagYn9BjqPs`).

To find your base64 encoded app fingerprint, you can execute the following command:

- macOS /
  Linux: `keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore | openssl sha256 -binary | openssl base64`
-

Windows: `keytool -exportcert -alias androiddebugkey -keystore "\.android\debug.keystore” | openssl sha256 -binary | openssl base64`

Alternatively, the base64 encoded app fingerprint can also be found in the log messages of the
example (`setting Origin of API requests to android:apk-key-hash:VEy...`), after you've started the app with

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

TODO IMAGE
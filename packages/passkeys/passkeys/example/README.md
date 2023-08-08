# passkeys_example

This example demonstrates how to use the *passkeys* package.
We built it in a way to make it as easy to run as possible.

Therefore, we have set up a pre-configured instance of the relying party server using a [Corbado](https://app.corbado.com) project.

The great thing about this is that you don't need to set up or configure a backend to run the example.
Note, that you share this relying party server with all other users of the *passkeys* package that also run the example though.
Therefore, we clear user data nightly. 

## Troubleshooting

### Android

#### Error: Emulator requires enrolled biometrics to use passkeys

If you run the application in an emulator and it says that you can't create a passkey, you have to log into your Google account and properly
set up a screen lock or biometrics on the device. 

First, to log into your Google account, open settings, click on the icon in the top right and then on "Sign in to your Google Account".

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/troubleshooting-sign-in-to-google-account.png?raw=true" style="width: 100%" alt="troubleshooting_google_account"/>

Secondly, to set up the screen lock, open the settings, search for security settings and add a PIN as well as a fingerprint as shown below (PIN is required for fingerprint):

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/troubleshooting-no-screen-lock.png?raw=true" style="width: 100%" alt="troubleshooting_screen_lock"/>

#### Error: Emulator throws PlatformException
During our implementation and testing, we detected some bugs when using specific API versions / devices of Android emulator (physical devices worked at any time though). According to our testing, we could get the example up and running with a Pixel 7 device (API 33 or API 34) that comes with PlayStore Support.
| Device | API Version | PlayStore Support | PlayStore Update | Test result  |
|---|---|---|---|---|
| Pixel 6 | 33 | No | not required | Error |
| Pixel 6 | 34 | No | not required | Error |
| Pixel 7 | 33 | Yes | not required | Success |
| Pixel 7 | 34 | Yes | not required | Success |

We continuously update the package to make things work on more emulators, once there are patches by Google. In some forums (e.g. [here](https://stackoverflow.com/questions/71325279/missing-featurename-auth-api-credentials-begin-sign-in-version-6)), it was suggested to update the PlayStore, which didn't change the result during our tests.

Our recommendation if you run the example on an Android emulator is to follow these steps:
1. Start your Android emulator (preferrably: Pixel 7 with Android API 33 or API 34 - see table above).
2. Open the emulator's settings and sign into your Google account.
3. Stay in the settings and add a screen lock (optionally: add fingerprint).
4. Open Google Chrome and activate sync (see screenshot below).
5. Restart the emulator (don't just put the emulator in stand-by).
6. You can now run the example app on your Android emulator.

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/platformexception-android-emulator.png?raw=true" style="width: 100%" alt="android-emulator-platform-exception" />

### iOS

#### Error: Simulator requires enrolled biometrics to use passkeys

If you get an error like this during sign up or login, activate Face ID for your simulator.
This can be done under *Features* => *Face ID* by clicking on "Enrolled".

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_error_enrolled_biometrics.png" style="width: 50%" calt="ios_enrolled_biometrics">

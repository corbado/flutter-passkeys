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
During our implementation and testing, we detected some bugs when using specific API versions / devices of Android emulator (physical devices worked at any time though). 
To avoid these issues, make sure that you are using an emulator with the following traits:
- API version 33 or 34
- Play Store Support (indicated by the Google Play icon when you create a new emulator device)

We tested this example on:
- Pixel 7 Pro
- Pixel 7
- Pixel 6a
- Pixel 4

We continuously update the package to make things work on more emulators, once there are patches by Google. 

Our recommendation if you run the example on an Android emulator is to follow these steps:
1. Start your Android emulator (one of the emulators we mentioned above).
2. Open the emulator's settings and sign into your Google account.
3. Stay in the settings and add a screen lock and a fingerprint.
4. Update Google Play (Extended Controls => Google Play => Update).
5. Restart the emulator (cold boot).
6. You can now run the example app on your Android emulator.

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/platformexception-android-emulator.png?raw=true" style="width: 100%" alt="android-emulator-platform-exception" />

### iOS

#### Error: Simulator requires enrolled biometrics to use passkeys

If you get an error like this during sign up or login, activate Face ID for your simulator.
This can be done under *Features* => *Face ID* by clicking on "Enrolled".

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_error_enrolled_biometrics.png" style="width: 50%" calt="ios_enrolled_biometrics">

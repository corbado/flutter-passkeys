# passkeys_example

This example demonstrates how to use the *passkeys* package.
We built it in a way to make it as easy to run as possible.

Therefore, we have set up a pre-configured instance of the relying party server using a [Corbado](https://app.corbado.com) project.

The great thing about this is that you don't need to set up or configure a backend to run the example.
Note, that you share this relying party server with all other users of the *passkeys* package that also run the example though.
Therefore, we clear user data nightly. 

## Troubleshooting

### Android

#### Error: Simulator requires enrolled biometrics to use passkeys

If you run the application in an emulator and it says that you can't create a passkey, you have to log into your Google account and properly
set up a screen lock or biometrics on the device. 

First, to log into your Google account, open settings, click on the icon in the top right and then on "Sign in to your Google Account".

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/troubleshooting-sign-in-to-google-account.png?raw=true" style="width: 100%" alt="troubleshooting_google_account"/>

Secondly, to set up the screen lock, open the settings, search for security settings and add a PIN as well as a fingerprint as shown below (PIN is required for fingerprint):

<img src="https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/doc/troubleshooting-no-screen-lock.png?raw=true" style="width: 100%" alt="troubleshooting_screen_lock"/>

### iOS

#### Error: Simulator requires enrolled biometrics to use passkeys

If you get an error like this during sign up or login, activate Face ID for your simulator.
This can be done under *Features* => *Face ID* by clicking on "Enrolled".

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/ios_error_enrolled_biometrics.png" style="width: 50%" calt="ios_enrolled_biometrics">

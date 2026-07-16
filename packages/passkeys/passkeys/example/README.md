# passkeys_example

This example demonstrates how to use the *passkeys* package.
We built it in a way to make it as easy to run as possible.

Therefore, we have set up a pre-configured instance of the relying party server using
a [Corbado](https://app.corbado.com) project.

The great thing about this is that you don't need to set up or configure a backend to run the
example.
Note, that you share this relying party server with all other users of the *passkeys* package that
also run the example though.
Therefore, we clear user data nightly.

## Troubleshooting

If you have any problems running this example, make sure to check out the [troubleshooting section](https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/README.md#troubleshooting) of 
this packages main README.md file.

Additionally to that check out the following list of errors that can happen specifically when running this example.

### iOS

#### Warning: XCode shows "Team: Unknown Name"

To allow for an easy setup in the example we configure it with a development team id of "
0000000000".
This is not a real development team id but as the example is only run on Simulators (and therefore
no real app signing takes place) this is not a problem.
You can still build and run the example on a Simulator.
If you change the development team id you will get an error on sign up/sign in
because the relying party server in the example only trusts apps that have been built with a
development team id of "0000000000" and a Bundle Identifier of "com.corbado.passkeys.pub".

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/xcode-team-unknown-name.png" style="width: 50%" calt="ios_enrolled_biometrics">


### macOS

When running the example on macOS, you must configure code signing with your Apple Developer account in Xcode, otherwise the app will fail to build or run:

1. Open the macOS Runner project in Xcode (open `macos/Runner.xcworkspace`).
2. Go to the Runner target → Signing & Capabilities.
3. Select your Team (Apple ID) and ensure a unique Bundle Identifier.
4. Let Xcode manage signing (Enable "Automatically manage signing").

After setting your developer account, rebuild and run the app.


# How to run automatic tests of the example

The end to end tests are written with [patrol](https://pub.dev/packages/patrol) and live in
`integration_test/`.

## Requirements

Before running the tests, ensure you have the following setup:

- **patrol_cli** installed globally:
  ```sh
  dart pub global activate patrol_cli
  ```
- **iPhone Simulator** (configured in Xcode) and/or an **Android Emulator** with Google Play
  Services.
- **Google Account** (credentials available in 1Password).
- **Biometric Authentication**:
    - Set up a PIN code on the device.
    - Register a fingerprint / enroll a biometric on the device.

## Step-by-Step Guide

### 1. Set up the devices

1. Start an iOS Simulator from Xcode and/or an Android Emulator from Android Studio.
2. Log in with the Google Account (credentials available in 1Password).
3. Set up a **PIN code** and register a **fingerprint** under the device security settings.

### 2. Add the iOS UI test target (one time, iOS only)

patrol drives iOS through a native UI test target that must be created in Xcode:

1. Open `ios/Runner.xcworkspace` in Xcode.
2. Add a new **UI Testing Bundle** target named `RunnerUITests`.
3. Follow the current
   [patrol iOS setup guide](https://patrol.leancode.co/documentation/native/setup-ios) to wire up
   the target.

The Android instrumentation setup (the `androidTest` runner and the `build.gradle` changes) is
already included in this example.

### 3. Run the tests

From this directory, with a device running:

```sh
patrol test --target integration_test/passkeys_test.dart
```

To target a specific device, pass `--device <device-id>` (list them with `flutter devices`).

### 4. Notes on the passkey ceremonies

The tests in `integration_test/passkeys_test.dart` cover the deterministic Flutter UI flows.
The passkey registration and authentication ceremonies trigger the platform credential manager and
a biometric prompt. Confirming those prompts and matching a fingerprint / Face ID cannot be
expressed in patrol alone and requires device level biometric automation, for example:

```sh
adb emu finger touch 1
```

on Android, or an enrolled biometric on the iOS simulator combined with `$.native` taps on the
system dialog. Layer these steps on top of the provided tests when running on a configured device.

### 5. Clean Up (Optional)

- To clean the project:
  ```sh
  flutter clean
  ```
- To reset and reinstall dependencies:
  ```sh
  flutter pub get
  ```
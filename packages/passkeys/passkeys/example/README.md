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

From this directory, with a device running. `TEST_MODE=true` enables the on-screen test
configuration selector that the tests drive:

```sh
patrol test --target integration_test/passkeys_test.dart --dart-define=TEST_MODE=true
```

To target a specific device, pass `--device <device-id>` (list them with `flutter devices`).

### 4. What the tests cover

`integration_test/passkeys_test.dart` ports the previous Appium suite:

- **Navigation** — the app starts on the sign up page and moves between sign up and sign in.
- **Sign up / login configurations** — every platform specific configuration
  (`Default`, `5s Timeout`, `ExcludeCredentials`, `AllowCredentials`,
  `PreferImmediatelyAvailableCredentials`, …) is listed and selectable.
- **Login without a passkey** — shows the expected error.
- **Passkey ceremonies** — `default sign up` and `default login`.

### 5. Running the passkey ceremonies

The passkey registration and authentication ceremonies end in the platform credential manager and a
device credential / biometric prompt. patrol confirms the credential manager sheet and enters a
screen-lock PIN itself, but a biometric match (fingerprint / Face ID) still has to be injected from
the host. Two things make the ceremonies runnable without any change to patrol:

1. A screen-lock PIN so the credential manager can use a device credential:
   ```sh
   adb shell locksettings set-pin 1234
   ```
2. A host side fingerprint injector that runs while the ceremony is on screen:
   ```sh
   ( while true; do adb emu finger touch 1; sleep 2; done ) &
   ```

The ceremonies are skipped unless enabled with `--dart-define=RUN_CEREMONIES=true`:

```sh
adb shell locksettings set-pin 1234
( while true; do adb emu finger touch 1; sleep 2; done ) &
patrol test \
  --target integration_test/passkeys_test.dart \
  --dart-define=TEST_MODE=true \
  --dart-define=RUN_CEREMONIES=true
```

This is exactly what the `.github/workflows/integration-test.yml` CI job does on an Android
emulator. That job is currently non-gating, because a full ceremony also needs a configured
credential provider (a signed-in account) on the device.

### 6. Clean Up (Optional)

- To clean the project:
  ```sh
  flutter clean
  ```
- To reset and reinstall dependencies:
  ```sh
  flutter pub get
  ```
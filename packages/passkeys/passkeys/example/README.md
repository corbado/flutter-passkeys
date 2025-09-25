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

## Requirements

Before running the tests, ensure you have the following setup:

- **Appium** (installed globally with Flutter Plugin)
- **iPhone 16 Pro Simulator** (configured in Xcode)
- **Android Emulator with API 29** (Nexus 5 device setup in Android Studio)
- **Google Account** (credentials available in 1Password)
- **Biometric Authentication**:
    - Set up a PIN code on the Android device
    - Register a fingerprint on the Android device

## Step-by-Step Guide

### 1. Set Up the iOS Simulator

1. Open **Xcode**.
2. Navigate to **Xcode > Settings > Platforms** and ensure the latest iOS version is installed.
3. Open the **Simulator** app.
4. Select **iPhone 16 Pro** as the active simulator.
5. Ensure the simulator is running before proceeding.

### 2. Set Up the Android Emulator

1. Open **Android Studio**.
2. Navigate to **AVD Manager** (Android Virtual Device Manager).
3. Create a new device with the following specifications:
    - **Device:** Nexus 5
    - **API Level:** 29
    - **Google Play Services:** Enabled
4. Start the emulator and complete the setup.
5. Log in with the Google Account (credentials available in 1Password).
6. Set up a **PIN code**.
7. Register a **fingerprint** under device security settings. (You can use adb commands to simulate fingerprint authentication.)
```shell
    adb emu finger touch 1
```

### 3. Build and Install the Example App

1. Ensure all dependencies are installed:
   ```sh
   flutter pub get
   ```
2. Get Device ID for Android & iOS:
   ```sh
   flutter devices
   ```
3. Build and install the app on both devices:
   ```sh
   flutter build apk --debug --dart-define=TEST_MODE=true
   flutter install --device-id=<device-id>
   ```
   ```sh
   flutter build ios --simulator --dart-define=TEST_MODE=true
   flutter install --device-id=<device-id>
   ```

### 4. Install and run Appium

1. Install Appium globally:
   ```sh
   npm install -g appium
   ```

2. Install the drivers for Flutter
    ```sh
    appium driver install --source=npm appium-flutter-driver
    appium driver install uiautomator2
    appium driver install --source=npm appium-flutter-integration-driver
    ```

3. Start Appium on port 4567
    ```sh
    appium -p 4567
    ```
   
### 5. Run the Automated Tests

Make sure the emulators are running before executing the tests.

1. Install required Node.js dependencies:
   ```sh
   cd tests
   npm install
   ```
2. Run tests for Android:
   ```sh
   npm run test:android -- --deviceName=<device-id>
   ```
3. Run tests for iOS:
   ```sh
   npm run test:ios -- --deviceName=<device-id>
   ```

### 6. Notes

- Ensure emulators are running before executing tests.
- Restart the emulators if needed and re-run the tests.
- You will have to rebuild and reinstall the app if you make changes to the code and want to run the tests again.

### 7. Clean Up (Optional)

- To clean the project:
  ```sh
  flutter clean
  ```
- To reset and reinstall dependencies:
  ```sh
  flutter pub get
  ```

---

Follow these steps carefully to ensure a successful automated testing process.
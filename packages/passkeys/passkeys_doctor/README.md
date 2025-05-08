<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">

# Passkeys Doctor

This is an internal package and it is used inside of the passkeys package

## Usage

The doctor is unabled by default in the example.

Here is what the doctor checks for

### 1. RPID Validation

- Ensures RPID is properly formatted
- Verifies RPID is a valid domain

### 2.1. iOS-specific Checks

- 1. Fetches the AASA file from the RP
- 2. Checks for the presence of the app bundle in the AASA file
- 3. Checks if biometrics are enabled when on the simulator

### 2.2. Android-specific Checks

- 1. Fetches the assetlinks.json file from the RP & signing fingerprint from the app
- 2. Checks for the presence of the app bundle and correct fingerprint in the assetlinks.json file

### 2.3. Web-specific Checks

- 1. Ensures RPID matches current hostname
- 2. Validates existence of passkeys JS script

### 3. Error Handling

The doctor keeps track of errors and exceptions happening in the passkeys flows , give a description of it and suggestions on how to fix them.


> **Note:** The doctor can export the results from the exception and the checks through a result Stream that can be used in the UI as done in the example

## How to test:

### Testing RPID validation

1. Hardcode a wrong format RPID in the example app (local_relying_party.dart) (exp: `https://flutter.corbado.io/` instead of `flutter.corbado.io`)
2. Build and run the app on any platform
3. Start passkey registration -> It should fail and the doctor should tell you that the RPID is not a valid domain
4. Change the RPID back to `flutter.corbado.io`
5. Restart passkey registration -> It should succeed and the doctor should tell you that the RPID is valid.

### Testing AASA file

1. Open developer panel and go to project `pro-9666724605626755378`
2. Go to native apps > iOS
3. Find the app with bundle `com.corbado.passkeys.pub` and app identifier prefix `0000000000` either change its value or remove it all together (make sure to add it back after the test)
4. Build the app and run it on iOS simulator
5. Start passkey registration -> It should fail and the doctor should tell you that the AASA file is missing the correct bundle.
6. Add the app bundle back to the AASA file
7. Restart the passkey registration -> It should succeed and the doctor should tell you that the AASA file is correct.

### Testing Assetlinks.json

1. Open developer panel and go to project `pro-9666724605626755378`
2. Go to native apps > Android
3. Find the app with bundle `com.corbado.passkeys.pub` and fingerprint `F8:90:4E:9A:99:01:71:75:25:38:D5:36:16:2D:B3:65:EB:41:51:D4:53:9A:72:BC:4B:56:C5:16:43:62:E2:C0` and remove it
4. Build the app and run it on Android emulator
5. Start passkey registration -> It should fail and the doctor should tell you that the assetlinks.json file is missing the correct bundle.
6. Add the app bundle and fingerprint back to the assetlinks.json file through the developer panel
7. Restart the passkey registration -> It should succeed and the doctor should tell you that the assetlinks.json file is correct.

### Testing Fingerprint for Android

1. Open developer panel and go to project `pro-9666724605626755378`
2. Go to native apps > Android
3. Find the app with bundle `com.corbado.passkeys.pub` and fingerprint `F8:90:4E:9A:99:01:71:75:25:38:D5:36:16:2D:B3:65:EB:41:51:D4:53:9A:72:BC:4B:56:C5:16:43:62:E2:C0` and change the fingerprint to something else
4. Build the app and run it on Android emulator
5. Start passkey registration -> It should fail and the doctor should tell you that the assetlinks.json file is missing the correct fingerprint.
6. Change the fingerprint back through the developer panel
7. Restart the passkey registration -> It should succeed and the doctor should tell you that the assetlinks.json file is correct.

### Testing Web

1. Hardcode an RPID different than `localhost` in local_relying_party.dart
2. Build and run the app on web
3. Start passkey registration -> It should fail and the doctor should tell you that the RPID is not a valid domain
4. Change the RPID back to `localhost`
5. Restart passkey registration -> It should succeed and the doctor should tell you that the RPID is valid.

### Testing JS script

1. Remove the passkeys JS script from the `web/index.html` file
2. Build and run the app on web
3. The app will fail to load and the doctor will tell you that the passkeys JS script is missing
4. Add the passkeys JS script back to the `web/index.html` file
5. Rebuild and Restart the app -> The app should start.

### Check for AASA CDN Caching

1. Disable Associated Domains Development in your physical device
2. Remove the app bundle from the RPID AASA file
3. Build and run the app on your physical device
4. Try to create a passkey -> it should fail , the doctor should also tell you that the AASA is missing the correct bundle
5. Add the app bundle to the RPID AASA file
6. Rerun/rebuild the app and try to register a passkey it will fail but this time the doctor should be aware that the AASA file is correct and suggest that the issue is actually caching related.

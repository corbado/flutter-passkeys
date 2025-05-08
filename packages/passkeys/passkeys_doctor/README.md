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

## How to test edge cases

### Check for AASA CDN Caching

1. Disable Associated Domains Development in your physical device
2. Remove the app bundle from the RPID AASA file
3. Build and run the app on your physical device
4. Try to create a passkey and it should fail , the doctor should also tell you that the AASA is missing the correct bundle
5. Add the app bundle to the RPID AASA file
6. Rerun/rebuild the app and try to register a passkey it will fail but this time the doctor should be aware that the AASA file is correct and suggest that the issue is actually caching related.

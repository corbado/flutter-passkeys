<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">

# Passkeys Doctor

This is an internal package and it is used inside of the passkeys package

## How to test edge cases

### Check for AASA CDN Caching

1. Disable Associated Domains Development in your physical device
2. Remove the app bundle from the RPID AASA file
3. Build and run the app on your physical device
4. Try to create a passkey and it should fail , the doctor should also tell you that the AASA is missing the correct bundle
5. Add the app bundle to the RPID AASA file
6. Rerun/rebuild the app and try to register a passkey it will fail but this time the doctor should be aware that the AASA file is correct and suggest that the issue is actually caching related.

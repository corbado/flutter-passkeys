import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../../passkeys_doctor.dart';

class ExceptionInfo {
  final String title;
  final String description;
  final List<String> platforms;
  final List<String> suggestions;

  const ExceptionInfo({
    required this.title,
    required this.description,
    required this.platforms,
    required this.suggestions,
  });
}

const Map<String, ExceptionInfo> exceptionInfos = {
  'cancelled': ExceptionInfo(
    title: 'PasskeyAuthCancelledException',
    description: 'Thrown when the user cancels the passkey flow.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Allow the user to start the flow again.'],
  ),
  'exclude-credentials-match': ExceptionInfo(
    title: 'ExcludeCredentialsCanNotBeRegisteredException',
    description:
        'Thrown when the user tries to register but one of the excluded credentials matches an existing one.',
    platforms: ['Android'],
    suggestions: [
      'Inform the user that the credential already exists.',
      'Allow the user to proceed with authentication instead of registration.',
    ],
  ),
  'android-missing-google-sign-in': ExceptionInfo(
    title: 'MissingGoogleSignInException',
    description:
        'Thrown when the user tries to register or authenticate but isn’t signed in to a Google account on their device.',
    platforms: ['Android'],
    suggestions: [
      'Ask the user to sign in to their Google account first.',
      'Use a fallback method (e.g. login via email OTP).',
    ],
  ),
  'android-sync-account-not-available': ExceptionInfo(
    title: 'SyncAccountNotAvailableException',
    description:
        'Thrown when the passkey cannot be retrieved from the sync provider (e.g., on an Android emulator).',
    platforms: ['Android'],
    suggestions: [
      'Make sure the emulator has Google Play Services integrated.',
      'Cold-boot your emulator and ensure the user is signed in to Google.',
    ],
  ),
  'domain-not-associated': ExceptionInfo(
    title: 'DomainNotAssociatedException',
    description:
        'Thrown when your app’s domain isn’t correctly associated with the relying party id (missing or mismatching Digital Asset Links or AASA file).',
    platforms: ['Android', 'iOS'],
    suggestions: [
      'Android: make sure https://<rp-id>/.well-known/assetlinks.json lists your package name and the SHA-256 fingerprint of the certificate the running build is signed with. Debug, upload and Play App Signing certificates have different fingerprints.',
      'iOS: check our docs on https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/ios/configure-device',
    ],
  ),
  'deviceNotSupported': ExceptionInfo(
    title: 'DeviceNotSupportedException',
    description: 'Thrown when the device does not support passkeys.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Update the device OS to a version that supports passkeys.'],
  ),
  'android-timeout': ExceptionInfo(
    title: 'TimeoutException',
    description: 'Thrown when the operation times out.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Ask the user to try again.'],
  ),
  'ios-security-key-timeout': ExceptionInfo(
    title: 'TimeoutException',
    description: 'Thrown when the operation times out.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Ask the user to try again.'],
  ),
  'no-credentials-available': ExceptionInfo(
    title: 'NoCredentialsAvailableException',
    description:
        'Thrown when the user has no credentials available for the authenticator.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Use a fallback method (e.g. login via email OTP).'],
  ),
  'android-no-credential': ExceptionInfo(
    title: 'NoCredentialsAvailableException',
    description:
        'Thrown when the user has no credentials available for the authenticator.',
    platforms: ['Android', 'iOS'],
    suggestions: ['Use a fallback method (e.g. login via email OTP).'],
  ),
  'android-no-create-option': ExceptionInfo(
    title: 'NoCreateOptionException',
    description:
        'Thrown when no viable creation options were found for the given CreateCredentialRequest.',
    platforms: ['Android'],
    suggestions: [
      'Use a fallback method (e.g. redirect the user to the device settings).',
      'Ask the user to enable passkeys in the device settings.',
    ],
  ),
  'not-eligible': ExceptionInfo(
    title: 'ConditionalCreateNotEligibleException',
    description:
        'Thrown by a conditional (automatic) create when the platform decides not to create a passkey. No UI was shown.',
    platforms: ['Android', 'iOS', 'macOS', 'Web'],
    suggestions: [
      'Treat it as "nothing happened".',
      'If you want a passkey, fall back to an ordinary create.',
    ],
  ),
  'conditional-create-unsupported': ExceptionInfo(
    title: 'ConditionalCreateUnsupportedException',
    description:
        'Thrown when a conditional (automatic) create is requested on a platform or OS version that does not support it.',
    platforms: ['Android', 'iOS', 'macOS', 'Web', 'Windows'],
    suggestions: ['Fall back to an ordinary create.'],
  ),
  'malformed-base64-url-challenge': ExceptionInfo(
    title: 'MalformedBase64UrlChallenge',
    description:
        'Thrown when the challenge is not a valid Base64URL-encoded string.',
    platforms: ['Android', 'iOS', 'Web'],
    suggestions: [
      'Make sure that the challenge is a valid Base64URL-encoded string without padding.',
    ],
  ),
  'malformed-base64-url-credential-id': ExceptionInfo(
    title: 'MalformedBase64UrlCredentialID',
    description:
        'Thrown when a credential ID is not a valid Base64URL-encoded string.',
    platforms: ['Android', 'iOS', 'Web'],
    suggestions: [
      'Make sure that the credential ID is a valid Base64URL-encoded string without padding.',
    ],
  ),
  'malformed-base64-url-user-id': ExceptionInfo(
    title: 'MalformedBase64UrlUserID',
    description:
        'Thrown when the user ID is not a valid Base64URL-encoded string.',
    platforms: ['Android', 'iOS', 'Web'],
    suggestions: [
      'Make sure that the user ID is a valid Base64URL-encoded string.',
    ],
  ),
  'failed': ExceptionInfo(
    title: 'FailedException',
    description:
        'Thrown when the operation fails. This is expected on IOS simulator when trying to trigger Conditional Login',
    platforms: ['iOS'],
    suggestions: [],
  ),
  'android-passkey-unsupported': ExceptionInfo(
    title: 'PasskeyUnsupportedException',
    description:
        'Thrown when the Android device does not support passkeys due to missing hardware or software capabilities. (minimal sdk version is 28)',
    platforms: ['Android'],
    suggestions: [
      'Ensure the device meets the minimum requirements for passkey support.',
      'Update the device OS to the latest version.',
      'Check if Google Play Services are up to date.',
    ],
  ),
};

Future<ExceptionInfo> getExceptionInfo(
  PlatformException error,
  List<Checkpoint> checkpoints,
) async {
  if (error.code == 'android-sync-account-not-available') {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.isPhysicalDevice) {
      return const ExceptionInfo(
        title: 'SyncAccountNotAvailableException',
        description:
            'This issue should not happen on a physical device. Please contact the package authors.',
        platforms: ['Android'],
        suggestions: [],
      );
    }
  }

  if (error.code == 'domain-not-associated' &&
      checkpoints.any(
        (cp) => cp.name.contains('AASA') && cp.type == CheckpointType.success,
      )) {
    return const ExceptionInfo(
      title: 'DomainNotAssociatedException',
      description:
          'In your case it is caused by Apple CDN caching of the AASA file; check docs for the `?mode=developer` parameter.',
      platforms: ['iOS'],
      suggestions: [
        'Clear any CDN caches or use the `?mode=developer` flag, see https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/ios/overview#aasa-file-caching-and-the-%3Fmode%3Ddeveloper-parameter',
      ],
    );
  }

  // Standard lookup
  if (exceptionInfos.containsKey(error.code)) {
    return exceptionInfos[error.code]!;
  }

  // Unhandled authenticator exceptions
  if (error.code.startsWith('android-unhandled') ||
      error.code.startsWith('ios-unhandled')) {
    return ExceptionInfo(
      title: 'UnhandledAuthenticatorException',
      description:
          'Thrown when an authenticator-thrown exception isn’t handled by this package (code: ${error.code}).',
      platforms: ['Android', 'iOS'],
      suggestions: ['Report this exception to the package authors.'],
    );
  }

  // Fallback
  return ExceptionInfo(
    title: error.code,
    description: 'No additional info available.',
    platforms: [],
    suggestions: [],
  );
}

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';
import 'package:passkeys_doctor/src/types/result.dart';

class Logger {
  final Stream<Result> _stream;
  late final StreamSubscription<Result> _sub;

  Logger(this._stream) {
    print('--------------------Doctor--------------------');
    print('Doctor started');
    print('Starting any passkey operation will trigger a check');
    print('----------------------------------------------');

    _sub = _stream.listen(
      (result) {
        _print(result);
      },
      onDone: () {
        print('Doctor is done');
      },
      onError: (error) {
        print('Doctor is having issues: $error');
      },
    );
  }

  void _print(Result result) async {
    print('--------------------Doctor--------------------');
    print('Checkpoints:');
    for (var checkpoint in result.checkpoints) {
      String checkbox;

      switch (checkpoint.type) {
        case CheckpointType.success:
          checkbox = '[✔]';
          break;
        case CheckpointType.warning:
          checkbox = '[!]';
          break;
        case CheckpointType.error:
          checkbox = '[✖]';
          break;
      }

      print(' $checkbox ${checkpoint.name}: ${checkpoint.description}');
    }
    if (result.exception != null) {
      await _printException(result.exception!, result.checkpoints);
    }
    print('----------------------------------------------');
  }

  Future<void> dispose() async {
    await _sub.cancel();
  }

  Future<void> _printException(
      PlatformException error, List<Checkpoint> checkpointList) async {
    print('Latest Exception:');

    switch (error.code) {
      case 'cancelled':
        print(
            ' PasskeyAuthCancelledException: Thrown when the user cancels the passkey flow.');
        print(' Platforms: Android, iOS');
        print(' Suggestions:');
        print('  • Allow the user to start the flow again.');
        break;

      case 'exclude-credentials-match':
        print(
            ' ExcludeCredentialsCanNotBeRegisteredException: Thrown when the user tries to register but one of the excluded credentials matches an existing one.');
        print(' Platforms: Android');
        print(' Suggestions:');
        print('  • Ask the user to sign in to their Google account first.');
        print('  • Use a fallback method (e.g. login via email OTP).');
        break;

      case 'android-missing-google-sign-in':
        print(
            ' MissingGoogleSignInException: Thrown when the user tries to register or authenticate but isn’t signed in to a Google account on their device.');
        print(' Platforms: Android');
        print(' Suggestions:');
        print('  • Ask the user to sign in to their Google account first.');
        print('  • Use a fallback method (e.g. login via email OTP).');
        break;

      case 'android-sync-account-not-available':
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        if (androidInfo.isPhysicalDevice) {
          print(
              ' SyncAccountNotAvailableException: This issue should not happen on a physical device. Please contact the package authors.');
          break;
        }

        print(
            ' SyncAccountNotAvailableException: Thrown when the passkey cannot be retrieved from the sync provider (e.g., on an Android emulator).');
        print(' Platforms: Android');
        print(' Suggestions:');
        print(
            '  • Make sure the emulator has Google Play Services integrated.');
        print(
            '  • Cold-boot your emulator and ensure the user is signed in to Google.');
        break;

      case 'domain-not-associated':
        if (checkpointList.any((Checkpoint checkpoint) {
          return checkpoint.name.contains("AASA") &&
              checkpoint.type == CheckpointType.success;
        })) {
          print(
              ' DomainNotAssociatedException: Thrown when your app’s domain isn’t correctly associated (no Digital Asset Links or AASA file). In your case it is caused by apple CDN Caching when dealing with AASA files. For more information check https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/ios/overview#aasa-file-caching-and-the-%3Fmode%3Ddeveloper-parameter');
          print(' Platforms: iOS');
          print(' Suggestions:');
          print(
              '  • Check our docs on https://docs.corbado.com/corbado-complete/frontend-integration/flutter/run-on-physical-device/ios/configure-device and ');
          break;
        }

        print(
            ' DomainNotAssociatedException: Thrown when your app’s domain isn’t correctly associated (no Digital Asset Links or AASA file).');
        print(' Platforms: Android, iOS');
        print(' Suggestions:');
        print(
            '  • Verify your domain association setup (assetlinks.json / apple-app-site-association).');
        break;

      case 'deviceNotSupported':
        print(
            ' DeviceNotSupportedException: Thrown when the device does not support passkeys.');
        print(' Platforms: Android, iOS');
        print(' Suggestions:');
        print('  • Update the device OS to a version that supports passkeys.');
        break;

      case 'android-timeout':
      case 'ios-security-key-timeout':
        print(' TimeoutException: Thrown when the operation times out.');
        print(' Platforms: Android, iOS');
        print(' Suggestions:');
        print('  • Ask the user to try again.');
        break;

      case 'no-credentials-available':
      case 'android-no-credential':
        print(
            ' NoCredentialsAvailableException: Thrown when the user has no credentials available for the authenticator.');
        print(' Platforms: Android, iOS');
        print(' Suggestions:');
        print('  • Use a fallback method (e.g. login via email OTP).');
        break;

      case 'android-no-create-option':
        print(
            ' NoCreateOptionException: Thrown when no viable creation options were found for the given CreateCredentialRequest.');
        print(' Platforms: Android');
        print(' Suggestions:');
        print(
            '  • Use a fallback method (e.g. redirect the user to the device settings).');
        print('  • Ask the user to enable passkeys in the device settings.');
        break;

      case 'malformed-base64-url-challenge':
        print(
            ' MalformedBase64UrlChallenge: Thrown when the challenge is not a valid Base64URL-encoded string.');
        print(' Platforms: Android, iOS, Web');
        print(' Suggestions:');
        print(
            '  • Make sure that the challenge is a valid Base64URL-encoded string without padding.');
        break;

      case 'malformed-base64-url-credential-id':
        print(
            ' MalformedBase64UrlCredentialID: Thrown when a credential ID is not a valid Base64URL-encoded string.');
        print(' Platforms: Android, iOS, Web');
        print(' Suggestions:');
        print(
            '  • Make sure that the credential ID is a valid Base64URL-encoded string without padding.');
        break;

      case 'malformed-base64-url-user-id':
        print(
            ' MalformedBase64UrlUserID: Thrown when the user ID is not a valid Base64URL-encoded string.');
        print(' Platforms: Android, iOS, Web');
        print(' Suggestions:');
        print(
            '  • Make sure that the user ID is a valid Base64URL-encoded string.');
        break;

      case 'failed':
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        if (!iosDeviceInfo.isPhysicalDevice) {
          print(
              ' FailedException: Thrown when the operation fails. This is expected on IOS simulator when trying to trigger Conditional Login');
          print(' Platforms: iOS');
          break;
        }

      default:
        if (error.code.startsWith('android-unhandled') ||
            error.code.startsWith('ios-unhandled')) {
          print(
              ' UnhandledAuthenticatorException: Thrown when an authenticator-thrown exception isn’t handled by this package.');
          print(' Platforms: Android, iOS');
          print(' Suggestions:');
          print(
              '  • Report this exception to the package authors (code: ${error.code}).');
        }
    }
  }
}

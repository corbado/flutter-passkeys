import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/main.dart';
import 'package:patrol/patrol.dart';

// End to end tests, ported from the previous Appium (JavaScript) suite.
//
// They fall into two categories:
//
// 1. Deterministic flows that patrol can drive and assert on its own: the app
//    launches, navigation, the test configuration selector and the error that
//    is shown when logging in without a registered passkey.
//
// 2. The passkey ceremonies (registration and authentication). These always
//    end in a platform biometric prompt (fingerprint / Face ID). Matching that
//    prompt cannot be driven from patrol; it needs device level tooling such
//    as `adb emu finger touch 1` on Android or a simulated biometric match on
//    the iOS simulator. These tests drive the flow up to that point and are
//    skipped by default (see [_skipBiometricCeremony]). Wire the host side
//    biometric step into [_completePlatformAuthenticator] to enable them.

/// Whether the app was built with `--dart-define=TEST_MODE=true`. The on-screen
/// test configuration selector is only rendered in that mode, so the
/// configuration tests are skipped without it.
const _testMode = bool.fromEnvironment('TEST_MODE');

/// See the file level comment: the biometric prompt cannot be matched from
/// patrol, so ceremonies that must succeed are skipped by default.
const _skipBiometricCeremony = true;

List<Configuration> get _signUpConfigurations =>
    Platform.isIOS ? SIGNUP_IOS_CONFIGURATIONS : SIGNUP_ANDROID_CONFIGURATIONS;

List<Configuration> get _loginConfigurations =>
    Platform.isIOS ? LOGIN_IOS_CONFIGURATIONS : LOGIN_ANDROID_CONFIGURATIONS;

Future<void> _pumpApp(PatrolIntegrationTester $) =>
    $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));

void main() {
  group('navigation', () {
    patrolTest('starts on the sign up page', ($) async {
      await _pumpApp($);

      expect($('Tired of passwords?'), findsOneWidget);
      expect($(const Key('email-field')), findsOneWidget);
      expect($(const Key('sign-up-button')), findsOneWidget);
    });

    patrolTest('moves between the sign up and sign in pages', ($) async {
      await _pumpApp($);

      await $(const Key('go-to-login-button')).tap();
      expect($(const Key('sign-in-button')), findsOneWidget);

      await $(const Key('go-to-sign-up-button')).tap();
      expect($(const Key('sign-up-button')), findsOneWidget);
    });
  });

  group('sign up', () {
    patrolTest(
      'offers every sign up configuration',
      ($) async {
        await _pumpApp($);
        await $(const Key('test-selector')).tap();

        for (final configuration in _signUpConfigurations) {
          expect($(configuration.name), findsWidgets);
        }
      },
      skip: !_testMode,
    );

    patrolTest(
      'each sign up configuration can be selected',
      ($) async {
        await _pumpApp($);

        for (final configuration in _signUpConfigurations) {
          await $(const Key('test-selector')).tap();
          await $(configuration.name).tap();
          expect($(configuration.name), findsWidgets);
        }
      },
      skip: !_testMode,
    );

    patrolTest(
      'default sign up creates a passkey and opens the profile',
      ($) async {
        await _pumpApp($);

        await $(const Key('email-field')).enterText('test+signup@example.com');
        await $(const Key('sign-up-button')).tap();
        await _completePlatformAuthenticator($);

        expect($(const Key('welcome-text')), findsOneWidget);
        await $(const Key('sign-out-button')).tap();
      },
      skip: _skipBiometricCeremony,
    );
  });

  group('login', () {
    patrolTest(
      'offers every login configuration',
      ($) async {
        await _pumpApp($);
        await $(const Key('go-to-login-button')).tap();
        await $(const Key('test-selector')).tap();

        for (final configuration in _loginConfigurations) {
          expect($(configuration.name), findsWidgets);
        }
      },
      skip: !_testMode,
    );

    patrolTest('shows an error when logging in without a passkey', ($) async {
      await _pumpApp($);
      await $(const Key('go-to-login-button')).tap();

      await $(const Key('email-field')).enterText('unknown@example.com');
      await $(const Key('sign-in-button')).tap();

      expect($(const Key('error-text-login')), findsOneWidget);
      expect($(find.textContaining('does not exist')), findsOneWidget);
    });

    patrolTest(
      'default login authenticates an existing passkey',
      ($) async {
        await _pumpApp($);

        // A credential must exist first, so register before authenticating.
        await $(const Key('email-field')).enterText('test+login@example.com');
        await $(const Key('sign-up-button')).tap();
        await _completePlatformAuthenticator($);
        await $(const Key('sign-out-button')).tap();

        await $(const Key('go-to-login-button')).tap();
        await $(const Key('email-field')).enterText('test+login@example.com');
        await $(const Key('sign-in-button')).tap();
        await _completePlatformAuthenticator($);

        expect($(const Key('welcome-text')), findsOneWidget);
      },
      skip: _skipBiometricCeremony,
    );
  });
}

/// Confirms the platform credential manager sheet and the biometric prompt that
/// end every passkey ceremony.
///
/// patrol can interact with the credential manager sheet, but the biometric
/// match itself must be injected from the host (see [_skipBiometricCeremony]).
/// Add that host side step here, for example `adb emu finger touch 1` on an
/// Android emulator, to enable the biometric tests above on a configured
/// device.
Future<void> _completePlatformAuthenticator(PatrolIntegrationTester $) async {
  await $.pump();
}

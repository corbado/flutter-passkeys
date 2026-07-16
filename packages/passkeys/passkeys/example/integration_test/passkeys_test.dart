import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/main.dart';
import 'package:patrol/patrol.dart';

const _testMode = bool.fromEnvironment('TEST_MODE');

const _skipBiometricCeremony = !bool.fromEnvironment('RUN_CEREMONIES');

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

Future<void> _completePlatformAuthenticator(PatrolIntegrationTester $) async {
  const confirmationLabels = [
    'Continue',
    'Create passkey',
    'Create',
    'Use a passkey',
    'Sign in',
    'OK',
  ];
  for (final label in confirmationLabels) {
    if (await _tapNativeText($, label)) {
      break;
    }
  }

  await _enterPinIfPresent($);

  await $.pump(const Duration(seconds: 6));
}

Future<bool> _tapNativeText(PatrolIntegrationTester $, String text) async {
  try {
    await $.platformAutomator.tap(
      Selector(text: text),
      timeout: const Duration(seconds: 2),
    );
    return true;
  } on PatrolActionException {
    return false;
  }
}

Future<void> _enterPinIfPresent(PatrolIntegrationTester $) async {
  try {
    await $.platformAutomator.mobile.enterTextByIndex(
      '1234',
      index: 0,
      timeout: const Duration(seconds: 6),
    );
  } on PatrolActionException {
    return;
  }
}

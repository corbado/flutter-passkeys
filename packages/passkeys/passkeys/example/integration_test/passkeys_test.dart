import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passkeys_example/main.dart';
import 'package:patrol/patrol.dart';

// These tests replace the previous Appium (JavaScript) end to end suite.
//
// They cover the deterministic Flutter UI flows that patrol can drive without
// any device specific tooling: launching the app, selecting a test
// configuration, filling in the form and navigating between the sign up and
// sign in pages.
//
// The passkey ceremonies themselves (registration and authentication) trigger
// the platform credential manager and a biometric prompt. Confirming those
// prompts and matching a fingerprint / Face ID cannot be expressed in patrol
// alone; it requires device level biometric automation, for example
// `adb emu finger touch 1` on an Android emulator or an enrolled biometric on
// an iOS simulator combined with `$.native` taps on the system dialog. Layer
// those steps on top of the helpers below when running on a configured device.
void main() {
  patrolTest('sign up page shows the configuration selector', ($) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));

    expect($(const Key('test-selector')), findsOneWidget);
    expect($(const Key('email-field')), findsOneWidget);
    expect($(const Key('sign-up-button')), findsOneWidget);
  });

  patrolTest('a signup configuration can be selected and the form filled', (
    $,
  ) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));

    await $(const Key('test-selector')).tap();
    await $('Default').tap();

    await $(const Key('email-field')).enterText('test+1@example.com');
    expect($('test+1@example.com'), findsOneWidget);
  });

  patrolTest('the user can navigate between sign up and sign in', ($) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));

    await $(const Key('go-to-login-button')).tap();
    expect($(const Key('sign-in-button')), findsOneWidget);

    await $(const Key('go-to-sign-up-button')).tap();
    expect($(const Key('sign-up-button')), findsOneWidget);
  });
}

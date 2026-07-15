import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:passkeys/exceptions.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/error_handling.dart';
import 'package:passkeys_example/pages/base_page.dart';
import 'package:passkeys_example/providers.dart';
import 'package:passkeys_example/router.dart';
import 'package:passkeys_example/widgets/select_test_configuration.dart';

void _showNoCreateOptionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Passkey cannot be created'),
      content: const Text(
        'No functional password manager is available on this device.\n\n'
        'Possible reasons:\n'
        '\u2022 No password manager selected in settings\n'
        '\u2022 Password manager is disabled\n\n'
        'Go to Settings \u2192 Passwords & accounts, disable the '
        'preferred service by selecting "None", then re-enable it.',
      ),
      actions: [
        if (!kIsWeb && Platform.isAndroid)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              const MethodChannel('com.example.passkeys/settings')
                  .invokeMethod('openCredentialProviderSettings');
            },
            child: const Text('Open Settings'),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final error = useState<String?>(null);
    final authService = ref.watch(authServiceProvider);
    final authenticatorAttachment = useState<String?>(null);

    bool isTestMode = const bool.fromEnvironment('TEST_MODE');

    // You need to first check for the web platform because on Web calling
    // Platform will cause an exception
    if (kIsWeb) {
      authService.authenticator.getAvailability().web().then((value) {
        debugPrint('Web');
        debugPrint('hasPasskeySupport: ${value.hasPasskeySupport}');
        debugPrint('isUserVerifyingPlatformAuthenticatorAvailable: '
            '${value.isUserVerifyingPlatformAuthenticatorAvailable}');
        debugPrint('isConditionalMediationAvailable: '
            '${value.isConditionalMediationAvailable}');
        debugPrint('isNative: ${value.isNative}');
      });
    } else if (Platform.isIOS) {
      authService.authenticator.getAvailability().iOS().then((value) {
        debugPrint('iOS');
        debugPrint('hasPasskeySupport: ${value.hasPasskeySupport}');
        debugPrint('hasBiometrics: ${value.hasBiometrics}');
        debugPrint('isNative: ${value.isNative}');
      });
    } else if (Platform.isAndroid) {
      authService.authenticator.getAvailability().android().then((value) {
        debugPrint('Android');
        debugPrint('hasPasskeySupport: ${value.hasPasskeySupport}');
        debugPrint('isUserVerifyingPlatformAuthenticatorAvailable:'
            ' ${value.isUserVerifyingPlatformAuthenticatorAvailable}');
        debugPrint('isNative: ${value.isNative}');
      });
    }

    return BasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Tired of passwords?',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Sign up using your biometrics like fingerprint or face.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              key: const Key('email-field'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email address',
              ),
            ),
          ),
          if (error.value != null)
            Text(
              key: const Key('error-text'),
              error.value!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            )
          else
            Container(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              key: const Key('sign-up-button'),
              onPressed: () async {
                final email = emailController.value.text;
                final attachment = authenticatorAttachment.value;
                authService.setSignupConfiguration(
                  attachment != null
                      ? Configuration(
                          name: 'custom',
                          authenticatorAttachment: attachment,
                        )
                      : null,
                );
                try {
                  await authService.signupWithPasskey(email: email);
                  context.go(Routes.profile);
                } catch (e) {
                  if (e is NoCreateOptionException) {
                    _showNoCreateOptionDialog(context);
                  } else if (e is AuthenticatorException) {
                    error.value = getFriendlyErrorMessage(e);
                  } else {
                    error.value = e.toString();
                  }
                }
              },
              child: const Text('sign up'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              key: const Key('go-to-login-button'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                side:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
              ),
              onPressed: () => context.go(Routes.signIn),
              child: const Text('I already have an account'),
            ),
          ),
          if (!kIsWeb) ...[
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Authenticator Attachment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 6),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'none', label: Text('None')),
                ButtonSegment(value: 'platform', label: Text('Platform')),
                ButtonSegment(
                    value: 'cross-platform', label: Text('Cross-plat.')),
              ],
              selected: {authenticatorAttachment.value ?? 'none'},
              onSelectionChanged: (selected) {
                final v = selected.first;
                authenticatorAttachment.value = v == 'none' ? null : v;
              },
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                textStyle: WidgetStatePropertyAll(
                  Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ],
          if (isTestMode)
            SelectTestConfiguration(
              configurations: Platform.isIOS
                  ? SIGNUP_IOS_CONFIGURATIONS
                  : SIGNUP_ANDROID_CONFIGURATIONS,
              onSelectConfiguration: authService.setSignupConfiguration,
              selectedConfiguration: authService.signUpConfiguration,
            ),
        ],
      ),
    );
  }
}

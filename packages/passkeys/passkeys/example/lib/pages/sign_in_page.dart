import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/pages/base_page.dart';
import 'package:passkeys_example/providers.dart';
import 'package:passkeys_example/router.dart';
import 'package:passkeys_example/widgets/select_test_configuration.dart';

class SignInPage extends StatefulHookConsumerWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _emailController = TextEditingController();

  bool isTestMode = const bool.fromEnvironment('TEST_MODE');

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authService = ref.watch(authServiceProvider);

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

      // As soon as the view has been loaded prepare the autocompleted passkey
      // sign in.
      authService
          .loginWithPasskeyConditionalUI()
          .then((value) => context.go(Routes.profile))
          .onError(
        (error, stackTrace) {
          if (error is PasskeyAuthCancelledException) {
            debugPrint(
                'user cancelled authentication. This is not a problem. It can just be started again.');
            return;
          }

          debugPrint('error: $error');
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final error = useState<String?>(null);
    final authService = ref.watch(authServiceProvider);

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
              'Sign in using your biometrics like fingerprint or face.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              key: const Key('email-field'),
              controller: _emailController,
              autofillHints: [_getAutofillHint()],
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email address',
              ),
            ),
          ),
          if (error.value != null)
            Text(
              key: const Key('error-text-login'),
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
              key: const Key('sign-in-button'),
              onPressed: () async {
                try {
                  final email = _emailController.value.text;
                  await authService.loginWithPasskey(email: email);
                  context.go(Routes.profile);
                } catch (e) {
                  if (e is PasskeyAuthCancelledException) {
                    debugPrint(
                        'user cancelled authentication. This is not a problem. It can just be started again.');
                    return;
                  }

                  error.value = e.toString();
                  debugPrint('error: $e');
                }
              },
              child: const Text('sign in'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              key: const Key('go-to-sign-up-button'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                side:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
              ),
              onPressed: () => context.go(Routes.signUp),
              child: const Text('I want to create a new account'),
            ),
          ),
          if (isTestMode)
            SelectTestConfiguration(
              configurations:
              Platform.isIOS ? LOGIN_IOS_CONFIGURATIONS : LOGIN_ANDROID_CONFIGURATIONS,
              onSelectConfiguration: authService.setLoginConfiguration,
              selectedConfiguration: authService.loginConfiguration,
            ),
        ],
      ),
    );
  }

  String _getAutofillHint() {
    if (kIsWeb) {
      // On web, only the first hint will be included in autocomplete
      // See: https://api.flutter.dev/flutter/widgets/EditableText/autofillHints.html
      return 'username webauthn';
    } else {
      return AutofillHints.username;
    }
  }
}

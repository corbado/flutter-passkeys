import 'package:example/auth_provider.dart';
import 'package:example/pages/base_page.dart';
import 'package:example/router.dart';
import 'package:example/widgets/filled_text_button.dart';
import 'package:example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  SignUpPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    final loading = useState<bool>(false);
    final usePasskeys = useState<bool>(true);
    final authService = ref.watch(authServiceProvider);

    return BasePage(
      child: SingleChildScrollView(
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
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email address',
                ),
              ),
            ),
            usePasskeys.value
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'password',
                      ),
                    ),
                  ),
            error.value != null
                ? Text(
                    error.value!,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  )
                : Container(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledTextButton(
                isLoading: loading.value,
                onTap: () async {
                  final email = _emailController.value.text;
                  loading.value = true;
                  String? maybeError;
                  if (usePasskeys.value) {
                    maybeError = await authService.register(email: email);
                  } else {
                    final password = _passwordController.value.text;
                    maybeError =
                        await authService.registerWithEmailAndPassword(
                            email: email, password: password);
                    if (maybeError != null) {
                      loading.value = false;
                      error.value = maybeError;
                    }
                  }
                  if (maybeError != null) {
                    loading.value = false;
                    error.value = maybeError;
                  }
                },
                content: 'sign up',
              ),
            ),
            Row(
              children: [
                Switch(
                  value: usePasskeys.value,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (bool value) {
                    usePasskeys.value = value;
                  },
                ),
                Text(
                  'Use passkeys for sign up',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedTextButton(
                onTap: () => context.go(Routes.signIn),
                content: 'I already have an account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

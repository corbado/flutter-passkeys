import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/pages/base_page.dart';
import 'package:corbado_auth_example/router.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  SignUpPage({super.key}) {}

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    final loading = useState<bool>(false);
    final authService = ref.watch(authServiceProvider);

    return BasePage(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const Text(
                'Tired of passwords?',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Sign up using your biometrics like fingerprint or face.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email address',
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
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledTextButton(
                isLoading: loading.value,
                onTap: () async {
                  final email = _emailController.value.text;
                  loading.value = true;
                  final maybeError = await authService.register(email: email);
                  loading.value = false;
                  if (maybeError != null) {
                    error.value = maybeError;
                  }
                },
                content: 'sign up',
              ),
            ),
            SizedBox(height: 10),
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

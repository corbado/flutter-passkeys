import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/router.dart';
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
    final authService = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Corbado authentication')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: const Text(
                  'Tired of passwords?',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.value.text;
                    final maybeError = await authService.register(email: email);
                    if (maybeError != null) {
                      error.value = maybeError;
                    }
                  },
                  child: const Text('sign up'),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      side: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor)),
                  onPressed: () => context.go(Routes.signIn),
                  child: const Text('I already have an account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

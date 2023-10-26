import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends StatefulHookConsumerWidget {
  SignInPage({super.key}) {}

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _emailController = TextEditingController();

  SignInHandler? _signInHandler;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authService = ref.watch(authServiceProvider);

      // As soon as the view has been loaded prepare the autocompleted passkey sign in.
      authService.signInWithAutocomplete().then((value) => _signInHandler = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final error = useState<String?>(null);
    final authService = ref.watch(authServiceProvider);
    // In this example we want to trigger autocomplete only once.
    // => the user can choose to ignore it and provide the username by himself.
    final numberOfAutoCompletions = useState(0);

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
                  'Sign in using your biometrics like fingerprint or face.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: _emailController,
                  onTap: () {
                    if (_signInHandler == null) {
                      return;
                    }

                    if (numberOfAutoCompletions.value >= 1) {
                      return;
                    }

                    numberOfAutoCompletions.value++;
                    // When the user focuses the text field start the real sign in.
                    _signInHandler!.complete((Exception e) {
                      if (e is PasskeyAuthCancelledException) {
                        debugPrint('FYI: User has cancelled passkey auth.');
                      }
                    });
                  },
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
                    try {
                      final email = _emailController.value.text;
                      final maybeError = await authService.signIn(email: email);
                      if (maybeError != null) {
                        error.value = maybeError;
                      }
                    } catch (error) {
                      debugPrint('error: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text('$error'),
                          duration: const Duration(seconds: 10),
                        ),
                      );
                    }
                  },
                  child: const Text('sign in'),
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
                  onPressed: () => context.go(Routes.signUp),
                  child: const Text('I want to create a new account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

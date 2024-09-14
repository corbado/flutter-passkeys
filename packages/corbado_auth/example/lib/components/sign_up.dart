import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class SignupInitScreen extends CorbadoComponent<SignupInitBlock> {
  SignUpComponent() {}

  final _emailController = TextEditingController();

  Widget build(BuildContext context, SignupInitBlock block) {
    _emailController.value = TextEditingValue(text: block.data.email?.value ?? '');

    return Column(
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
        block.data.email?.translatedError != null
            ? Text(
          block.data.email!.translatedError!,
          style:
          TextStyle(color: Theme.of(context).colorScheme.error),
        )
            : Container(),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: false,
            onTap: () async {
              final email = _emailController.value.text;
              await block.submitSignupInit(email: email);
            },
            content: 'sign up',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => block.switchToLogin(),
            content: 'I already have an account',
          ),
        ),
      ],
    );
  }
}

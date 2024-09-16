import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class LoginInitScreen extends StatelessWidget implements CorbadoScreen<LoginInitBlock> {
  final LoginInitBlock block;
  final _emailController = TextEditingController();

  LoginInitScreen(this.block);

  Widget build(BuildContext context) {
    final email = block.data.loginIdentifier;
    _emailController.value = TextEditingValue(text: email);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaybeGenericError(message: block.error?.translatedError),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: const Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            'Enter your email address to log in with passkeys or email OTP.',
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
              hintText: 'Email address',
            ),
          ),
        ),
        block.data.loginIdentifierError?.translatedError != null
            ? Text(
          block.data.loginIdentifierError!.translatedError,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        )
            : Container(),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            onTap: () async {
              final email = _emailController.value.text;
              await block.submitLogin(loginIdentifier: email);
            },
            content: 'Login',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => block.navigateToSignup(),
            content: 'Create a new account',
          ),
        ),
      ],
    );
  }
}

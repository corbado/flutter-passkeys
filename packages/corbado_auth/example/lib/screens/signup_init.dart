import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class SignupInitScreen extends CorbadoComponent<SignupInitBlock> {
  final _emailController = TextEditingController();

  Widget build(BuildContext context, SignupInitBlock block) {
    final email = block.data.email;
    if (email == null) {
      return Container();
    }

    _emailController.value = TextEditingValue(text: email.value);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaybeGenericError(message: block.error?.translatedError),
        SizedBox(height: 10,),
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
        email.error?.translatedError != null
            ? Text(
                email.error!.translatedError,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
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
              await block.submitSignupInit(email: email, fullName: 'fixed');
            },
            content: 'sign up',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => block.navigateToLogin(),
            content: 'I already have an account',
          ),
        ),
      ],
    );
  }
}

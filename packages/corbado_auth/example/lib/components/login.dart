import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class LoginComponent extends CorbadoComponent<LoginData> {
  LoginComponent() {}

  Widget build(BuildContext context, LoginData data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Login'),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => data.switchToSignup(),
            content: 'Sign up',
          ),
        ),
      ],
    );
  }
}

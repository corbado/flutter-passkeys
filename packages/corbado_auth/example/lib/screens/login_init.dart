import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginInitScreen extends HookWidget implements CorbadoScreen<LoginInitBlock> {
  final LoginInitBlock block;

  LoginInitScreen(this.block);

  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: block.data.loginIdentifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          showNotificationError(context, maybeError.translatedError);
        }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Enter your email address to log in with passkeys or email OTP.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: emailController,
            autofillHints: [_getAutofillHint()],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email address',
            ),
          ),
        ),
        MaybeGenericError(message: block.data.loginIdentifierError?.translatedError),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            onTap: () async {
              final email = emailController.value.text;
              await block.submitLogin(loginIdentifier: email);
            },
            content: 'Login',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: block.navigateToSignup,
            content: 'Create a new account',
          ),
        ),
      ],
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

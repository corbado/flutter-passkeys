import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmailEditScreen extends HookWidget
    implements CorbadoScreen<EmailVerifyBlock> {
  final EmailVerifyBlock block;

  EmailEditScreen(this.block);

  Widget build(BuildContext context) {
    final email = block.data.email;

    final emailController = useTextEditingController(text: email);

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
            'Edit the email address',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Insert the new email address below.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email address',
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            onTap: () async {
                await block.updateEmail(emailController.text);
            },
            content: 'Edit email',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: block.navigateToVerifyEmail,
            content: 'Back',
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

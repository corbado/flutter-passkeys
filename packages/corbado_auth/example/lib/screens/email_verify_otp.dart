import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class EmailVerifyOtpScreen extends CorbadoComponent<EmailVerifyBlock> {
  EmailVerifyOtpScreen() {}

  final _textFieldController = TextEditingController();

  Widget build(BuildContext context, EmailVerifyBlock block) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaybeGenericError(message: block.error?.translatedError),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: const Text(
            'Verify your email address',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'We have sent you a 6 digit code to ${block.data.email}. Please enter the code below.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'XXXXXX',
            ),
          ),
        ),
        block.data.error != null
            ? Text(
          block.data.error!.translatedError,
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
              final code = _textFieldController.value.text;
              await block.submitOtpCode(code);
            },
            content: 'submit',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => block.resendEmail(),
            content: 'resend code',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: () => block.navigateToEditEmail(),
            content: 'change email',
          ),
        ),
      ],
    );
  }
}

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';

class PasskeyAppendScreen extends CorbadoComponent<PasskeyAppendBlock> {
  PasskeyAppendScreen() {}

  Widget build(BuildContext context, PasskeyAppendBlock block) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaybeGenericError(message: block.error?.translatedError),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: const Text(
            'Create you passkey',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CircularProgressIndicator(),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: false,
            onTap: () async {
              await block.passkeyAppend();
            },
            content: 'create passkey',
          ),
        ),
        SizedBox(height: 10),
        block.data.preferredFallback != null
            ? SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedTextButton(
                  onTap: () => block.data.preferredFallback!.onTap(),
                  content: block.data.preferredFallback!.label.toLowerCase(),
                ),
              )
            : Container(),
        SizedBox(height: 10),
      ],
    );
  }
}

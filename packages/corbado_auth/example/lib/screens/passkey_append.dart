import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasskeyAppendScreen extends HookWidget implements CorbadoScreen<PasskeyAppendBlock> {
  final PasskeyAppendBlock block;

  PasskeyAppendScreen(this.block);

  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          showNotificationError(context, maybeError.detailedError());
        }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Set up your passkey',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Quick and secure login using Apple Touch ID or Face ID instead of passwords.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            onTap: () async {
              await block.passkeyAppend();
            },
            content: 'Create passkey',
          ),
        ),
        const SizedBox(height: 10),
        if (block.data.preferredFallback != null) SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedTextButton(
                  onTap: () => block.data.preferredFallback!.onTap(),
                  content: block.data.preferredFallback!.label,
                ),
              ) else Container(),
        if (block.data.canBeSkipped) SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: block.skipPasskeyAppend,
            content: 'Maybe later',
          ),
        ) else Container(),
        const SizedBox(height: 10),
      ],
    );
  }
}

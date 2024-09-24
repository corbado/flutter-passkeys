import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasskeyVerifyScreen extends HookWidget implements CorbadoScreen<PasskeyVerifyBlock> {
  final PasskeyVerifyBlock block;

  PasskeyVerifyScreen(this.block);

  Widget build(BuildContext context) {
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
        MaybeGenericError(message: block.error?.translatedError),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Login with your passkey',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
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
              await block.passkeyVerify();
            },
            content: 'Login with passkey',
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
        const SizedBox(height: 10),
      ],
    );
  }
}

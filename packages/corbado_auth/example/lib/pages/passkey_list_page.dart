import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:corbado_auth_example/widgets/passkey_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasskeyListPage extends HookConsumerWidget {
  PasskeyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passkeys = ref.watch(passkeysProvider).value ?? [];
    final corbado = ref.watch(corbadoProvider);

    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(title: const Text('Corbado authentication')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check your passkeys',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: passkeys
                      .map(
                        (p) => SizedBox(
                          width: double.infinity,
                          child: PasskeyCard(
                            passkey: p,
                            onDelete: (String credentialID) async {
                              try {
                                isLoading.value = true;
                                await corbado.deletePasskey(
                                  credentialID: credentialID,
                                );
                                isLoading.value = false;
                              } catch (e) {
                                isLoading.value = false;
                                error.value = e.toString();
                              }
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledTextButton(
                    onTap: () async {
                      await corbado.appendPasskey();
                    },
                    content: 'Add passkey',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedTextButton(
                    onTap: context.pop,
                    content: 'Back',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

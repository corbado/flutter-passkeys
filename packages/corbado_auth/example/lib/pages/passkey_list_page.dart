import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:corbado_auth_example/widgets/passkey_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

class PasskeyListPage extends HookConsumerWidget {
  PasskeyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final corbado = ref.watch(corbadoProvider);
    final passkeys = ref.watch(passkeysProvider).value ?? [];

    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = error.value;
        if (maybeError != null) {
          showNotificationError(context, maybeError);
        }
      });

      return null;
    }, [error.value]);

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
                              if (isLoading.value) {
                                return;
                              }
                              isLoading.value = true;
                              error.value = null;

                              try {
                                await corbado.deletePasskey(
                                  credentialID: credentialID,
                                );

                                showSimpleNotification(
                                    const Text(
                                      'Passkey has been deleted successfully.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    background:
                                        Theme.of(context).colorScheme.primary);
                              } on CorbadoError catch (e) {
                                error.value = e.translatedError;
                              } catch (e) {
                                error.value = e.toString();
                              } finally {
                                isLoading.value = false;
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
                      if (isLoading.value) {
                        return;
                      }

                      isLoading.value = true;
                      error.value = null;

                      try {
                        await corbado.appendPasskey();
                        showSimpleNotification(
                            const Text(
                              'Passkey has been created successfully.',
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            background: Theme.of(context).colorScheme.primary);
                      } on CorbadoError catch (e) {
                        error.value = e.translatedError;
                      } catch (e) {
                        error.value = e.toString();
                      } finally {
                        isLoading.value = false;
                      }
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

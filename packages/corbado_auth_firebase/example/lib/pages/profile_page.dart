import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:example/auth_provider.dart';
import 'package:example/pages/base_page.dart';
import 'package:example/widgets/filled_text_button.dart';
import 'package:example/widgets/maybe_error.dart';
import 'package:example/widgets/outlined_text_button.dart';
import 'package:example/widgets/passkey_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final user = ref.watch(userProvider);
    final passkeyAppendError = useState<String?>(null);
    final passkeys = useState<List<PasskeyInfo>>([]);
    final passkeyAddIsLoading = useState(false);

    useEffect(() {
      authService.getPasskeys().then((value) => passkeys.value = value);
    }, [authService]);

    clearErrors() {
      passkeyAppendError.value = null;
    }

    return BasePage(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              user.value?.displayName ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'You are currently logged in.',
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            'Your passkeys:',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Column(
            children: passkeys.value
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PasskeyListItem(e, (String passkeyId) async {
                        clearErrors();
                        await authService.deletePasskey(passkeyId);
                        passkeys.value = await authService.getPasskeys();
                      }),
                    ))
                .toList(),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledTextButton(
              onTap: () async {
                clearErrors();
                passkeyAddIsLoading.value = true;
                final maybeError = await authService.appendPasskey();
                if (maybeError != null) {
                  passkeyAddIsLoading.value = false;
                  passkeyAppendError.value = maybeError;
                  return;
                }
                passkeys.value = await authService.getPasskeys();
                passkeyAddIsLoading.value = false;
              },
              isLoading: passkeyAddIsLoading.value,
              content: 'add new passkey',
            ),
          ),
          const SizedBox(height: 5),
          MaybeError(passkeyAppendError.value),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () {
                clearErrors();
                authService.deleteAccount();
              },
              content: 'delete account',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () {
                clearErrors();
                authService.signOut();
              },
              content: 'sign out',
            ),
          ),
        ]));
  }
}

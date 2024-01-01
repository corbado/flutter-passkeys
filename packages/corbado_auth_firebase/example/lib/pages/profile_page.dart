import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:example/auth_provider.dart';
import 'package:example/pages/base_page.dart';
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
    final passkeys = useState<List<PasskeyInfo>>([]);
    useEffect(() {
      authService.getPasskeys().then((value) => passkeys.value = value);
    }, [authService]);

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
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView(
              shrinkWrap: true,
              children: passkeys.value
                  .map((e) => PasskeyListItem(e, (String passkeyId) async {
                        await authService.deletePasskey(passkeyId);
                        passkeys.value = await authService.getPasskeys();
                      }))
                  .toList(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () async {
                await authService.appendPasskey();
                passkeys.value = await authService.getPasskeys();
              },
              content: 'add new passkey',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () => authService.deleteAccount(),
              content: 'delete account',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () => authService.signOut(),
              content: 'sign out',
            ),
          ),
        ]));
  }
}

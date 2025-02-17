import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/router.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final corbado = ref.watch(corbadoProvider);

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
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.value?.email ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'You are currently logged in. You have a JWT token that you can use to make calls to your backend.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledTextButton(
                    onTap: () => context.push(Routes.editProfile),
                    content: 'Edit profile',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledTextButton(
                    onTap: () => context.push(Routes.passkeyList),
                    content: 'Passkey list',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedTextButton(
                    onTap: corbado.signOut,
                    content: 'Sign out',
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

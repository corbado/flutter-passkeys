import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/components/login.dart';
import 'package:corbado_auth_example/components/sign_up.dart';
import 'package:corbado_auth_example/pages/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  AuthPage({super.key}) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final corbadoAuth = ref.watch(corbadoProvider);

    return BasePage(
      child: CorbadoAuthComponent(corbadoAuth: corbadoAuth, components: {
        ScreenNames.SignupInit: SignupInitScreen(),
        ScreenNames.LoginInit: LoginComponent(),
      }),
    );
  }
}

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/screens/email_edit.dart';
import 'package:corbado_auth_example/screens/email_verify_otp.dart';
import 'package:corbado_auth_example/screens/login_init.dart';
import 'package:corbado_auth_example/screens/passkey_append.dart';
import 'package:corbado_auth_example/screens/passkey_verify.dart';
import 'package:corbado_auth_example/screens/signup_init.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  AuthPage({super.key}) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final corbadoAuth = ref.watch(corbadoProvider);

    corbadoAuth.doctor();

    return Scaffold(
      appBar: AppBar(title: const Text('Corbado authentication')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CorbadoAuthComponent(
              corbadoAuth: corbadoAuth,
              components: CorbadoScreens(
                signupInit: SignupInitScreen.new,
                loginInit: LoginInitScreen.new,
                emailVerifyOtp: EmailVerifyOtpScreen.new,
                passkeyAppend: PasskeyAppendScreen.new,
                passkeyVerify: PasskeyVerifyScreen.new,
                emailEdit: EmailEditScreen.new,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

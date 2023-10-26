import 'package:corbado_auth_example/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_editor/json_editor.dart';
import 'package:url_launcher/url_launcher.dart';

class TokenDetailsPage extends HookConsumerWidget {
  TokenDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Token details')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text(
                'id token',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
                height: 250,
                child: JsonEditor.object(
                    object: user.value?.decoded.toJson(), enabled: false)),
            SizedBox(height: 10),
            Text('The id token above serves two purposes:'),
            Text('1. Provide user data (name, email)'),
            Text('2. Act as a bearer token for calls to your backend'),
            SizedBox(height: 10),
            Text(
                'The id token will be automatically refreshed by the Corbado Auth SDK as its lifetime is limited.'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Find more info on the id token at ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                  text: 'our docs',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Uri url = Uri.parse(
                          'https://github.com/corbado/flutter-passkeys/blob/main/packages/corbado_auth/README.md');
                      launchUrl(url);
                    },
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/app_locator.dart';
import 'package:corbado_auth_example/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_editor/json_editor.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class TokenDetailsPage extends StatefulWidget {
  TokenDetailsPage({super.key});

  @override
  State<TokenDetailsPage> createState() => _TokenDetailsPageState();
}

class _TokenDetailsPageState extends State<TokenDetailsPage> {
  final AuthService _authService = getIt<AuthService>();

  User? user;
  StreamSubscription? _userSub;

  @override
  void initState() {
    super.initState();
    _userSub = _authService.userSteam.listen((event) {
      if (mounted) {
        setState(() {
          user = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    object: user?.decoded.toJson(), enabled: false)),
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

  @override
  void dispose() {
    super.dispose();
    _userSub?.cancel();
  }
}

import 'package:flutter/material.dart';

// Only shown during initial loading of the app.
class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.error, this.hint, super.key});

  final String error;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Attention',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('We could not load this example app'),
            Text('Details: $error'),
            if (hint != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'How can you solve this?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(hint!, textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
                ],
              ),
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:passkeys/backend/corbado/corbado_passkey_backend.dart';
import 'package:passkeys/passkey_auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key})
      : _auth = PasskeyAuth(CorbadoPasskeyBackend('pro-3320381079973729266'));

  final PasskeyAuth _auth;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _canAuthenticate;
  dynamic _register;
  dynamic _authenticate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passkeys Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            if (_canAuthenticate == null)
              const SizedBox.shrink()
            else
              Text(
                'canAuthenticate: $_canAuthenticate',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await widget._auth.isSupported();
                  setState(() => _canAuthenticate = result);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text('$error'),
                    ),
                  );
                }
              },
              child: const Text('canAuthenticate'),
            ),
            const SizedBox(height: 16),
            if (_register == null)
              const SizedBox.shrink()
            else
              Text(
                'register: $_register',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  const arguments = 'martinkellner470@gmail.com';
                  final result =
                      await widget._auth.registerWithEmail(arguments);
                  setState(() => _register = result);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text('$error'),
                    ),
                  );
                }
              },
              child: const Text('register'),
            ),
            const SizedBox(height: 16),
            if (_authenticate == null)
              const SizedBox.shrink()
            else
              Text(
                'authenticate: $_authenticate',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  const arguments = 'martinkellner470@gmail.com';
                  final result =
                      await widget._auth.authenticateWithEmail(arguments);
                  setState(() => _authenticate = result);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text('$error'),
                    ),
                  );
                }
              },
              child: const Text('authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}

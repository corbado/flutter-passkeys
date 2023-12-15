import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeys_example/pages/loading_page.dart';
import 'package:passkeys_example/providers.dart';
import 'package:passkeys_example/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is a nice pattern if you need to initialize some of your services
  // before the app starts.
  // As we are using riverpod this initialization happens inside providers.
  // First we show a loading page.
  runApp(const LoadingPage());

  // Now we do the initialization.

  final relyingPartyServer = CustomCorbadoAuth();
  const corbadoProjectId = String.fromEnvironment('CORBADO_PROJECT_ID');
  await relyingPartyServer.init(corbadoProjectId);

  runApp(
    ProviderScope(
      overrides: [
        relyingPartyServerProvider.overrideWithValue(relyingPartyServer),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF1953ff),
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.redAccent,
          onError: Colors.white,
          background: Color(0xFF1953ff),
          onBackground: Colors.white,
          surface: Color(0xFF1953ff),
          onSurface: Color(0xFF1953ff),
        ),
      ),
    );
  }
}

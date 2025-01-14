import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeys_example/router.dart';

void main() async {
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
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

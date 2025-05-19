import 'dart:async';

import 'package:corbado_shared/corbado_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:passkeys_example/router.dart';

void main() async {
  bool isTestMode = const bool.fromEnvironment('TEST_MODE');
  if (isTestMode) {
    enableFlutterDriverExtension();
  }
  WidgetsFlutterBinding.ensureInitialized();

  // Telemetry is used to help us understand how the example is used.
  unawaited(CorbadoTelemetry(
    projectId: 'passkeys_example',
  ).sendEvent(
    type: TelemetryEventType.EXAMPLE_APP_OPENED,
    payload: {
      'exampleName': 'passkeys_example',
    },
  ));

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
    return OverlaySupport.global(
      child: MaterialApp.router(
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
      ),
    );
  }
}

// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/pages/loading_page.dart';
import 'package:corbado_auth_example/router.dart';
import 'package:corbado_telemetry_api_client/corbado_telemetry_api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

/// Returns the Corbado project ID to use for the current platform.
///
/// In your own project you should get this from an ENV variable or from a
/// Flutter flavour.
String calculateProjectID() {
  if (kIsWeb) {
    return 'pro-8751299119685489253';
  } else {
    return 'pro-4268394291597054564';
  }
}

/// Fallback project ID value used when no environment value is provided.
const String DEFAULT_VALUE = 'none';

/// The Corbado project ID provided via the `CORBADO_PROJECT_ID` environment
/// variable, or [DEFAULT_VALUE] if it was not set.
const String envProjectId = String.fromEnvironment(
  'CORBADO_PROJECT_ID',
  defaultValue: DEFAULT_VALUE,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is a nice pattern if you need to initialize some of your services
  // before the app starts.
  // As we are using riverpod this initialization happens inside providers.
  // First we show a loading page.
  runApp(const LoadingPage());

  // Now we do the initialization.
  final projectId = envProjectId == 'none'
      ? calculateProjectID()
      : envProjectId;

  final corbadoAuth = CorbadoAuth();
  await corbadoAuth.init(projectId: projectId, debugMode: true);

  // Telemetry is used to help us understand how the example is used.
  unawaited(
    CorbadoTelemetryApiClient(projectId: projectId).sendEvent(
      type: TelemetryEventType.EXAMPLE_APPLICATION_OPENED,
      payload: {'exampleName': 'corbado/flutter-passkeys/corbado_auth_example'},
    ),
  );

  // Finally we override the providers that needed initialization.
  // Now the real app can be loaded.
  runApp(
    ProviderScope(
      overrides: [corbadoProvider.overrideWithValue(corbadoAuth)],
      child: const MyApp(),
    ),
  );
}

/// Root widget of the example application.
class MyApp extends ConsumerWidget {
  /// Creates the root widget of the example application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return OverlaySupport.global(
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF1953ff),
            onPrimary: Colors.white,
            secondary: Colors.white,
            onSecondary: Color(0xFF1953ff),
            error: Colors.redAccent,
            onError: Colors.white,
            surface: Color(0xFF1953ff),
            onSurface: Color(0xFF1953ff),
          ),
        ),
      ),
    );
  }
}

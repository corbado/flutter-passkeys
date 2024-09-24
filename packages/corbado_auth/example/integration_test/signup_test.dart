import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final corbadoAuth = CorbadoAuth();
    await corbadoAuth.init(
        projectId: "pro-4268394291597054564",
        customDomain: "https://pro-4268394291597054564.frontendapi.cloud.corbado.io");

    await tester.pumpWidget(
        ProviderScope(
          overrides: [
            corbadoProvider.overrideWithValue(corbadoAuth),
          ],
          child: const MyApp(),
        ));

    await tester.pumpAndSettle();

    await Future.delayed(Duration(seconds: 3));
    expect(find.text('Sign up'), findsOneWidget);

    final textField = find.byKey(ValueKey('textfield-email'));
    await tester.enterText(textField, 'martin+21s4@corbado.com');

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();

    await Future.delayed(Duration(seconds: 1));

    await tester.tap(find.text('Continue'));

    await Future.delayed(Duration(seconds: 5));
  });
}

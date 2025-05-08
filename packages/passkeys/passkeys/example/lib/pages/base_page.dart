import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:passkeys_example/widgets/debug_overlay.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      DebugOverlay.show(context);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Passkey authentication')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    DebugOverlay.hide();
  }
}

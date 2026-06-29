import 'package:flutter/material.dart';

/// Only shown during initial loading of the app.
class LoadingPage extends StatelessWidget {
  /// Creates the loading page.
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

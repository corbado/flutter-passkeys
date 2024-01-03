import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase + Corbado authentication')),
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
}

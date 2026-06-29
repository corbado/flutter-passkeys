import 'package:flutter/material.dart';

class MaybeGenericError extends StatelessWidget {
  const MaybeGenericError({required this.message, super.key});
  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    }

    return Text(
      message!,
      style: const TextStyle(color: Colors.red, fontSize: 14),
    );
  }
}

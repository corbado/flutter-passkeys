import 'package:flutter/material.dart';

class MaybeGenericError extends StatelessWidget {
  final String? message;

  const MaybeGenericError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    }

    return Text(
        message!,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 14,
      ),
    );
  }
}

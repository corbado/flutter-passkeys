import 'package:flutter/material.dart';

/// Displays an error [message] in red, or nothing when the message is null.
class MaybeGenericError extends StatelessWidget {
  /// Creates a widget that optionally shows an error message.
  const MaybeGenericError({required this.message, super.key});

  /// The error message to display, or null to show nothing.
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

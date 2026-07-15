import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

/// Shows an error notification with the given [message] using the app theme.
void showNotificationError(BuildContext context, String message) {
  showSimpleNotification(
    Text(
      message,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ),
    leading: const Icon(Icons.cancel, color: Colors.red),
    background: Theme.of(context).colorScheme.primary,
  );
}

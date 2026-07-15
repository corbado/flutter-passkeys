import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';

/// Card showing details of a single passkey with a delete option.
class PasskeyCard extends StatelessWidget {
  /// Creates a card for the given [passkey].
  const PasskeyCard({required this.passkey, required this.onDelete, super.key});

  /// The passkey to display.
  final PasskeyInfo passkey;

  /// Called with the credential ID when the passkey should be deleted.
  final void Function(String) onDelete;

  // Helper method to display a bottom sheet with options.
  void _showOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                // Close the bottom sheet
                Navigator.of(context).pop();
                // Call onDelete callback
                onDelete(passkey.id);
              },
            ),
            // You can add more ListTiles for more options...
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // The long press gesture
      onLongPress: () => _showOptions(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${passkey.id}'),
              Text('Device: ${passkey.sourceOS}, ${passkey.sourceBrowser}'),
              Text('Created: ${passkey.created}'),
              Text('Synced: ${passkey.backupState}'),
            ],
          ),
        ),
      ),
    );
  }
}

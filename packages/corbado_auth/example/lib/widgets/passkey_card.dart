import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';

class PasskeyCard extends StatelessWidget {
  final PasskeyInfo passkey;
  final void Function(String) onDelete;

  const PasskeyCard({
    Key? key,
    required this.passkey,
    required this.onDelete,
  }) : super(key: key);

  // Helper method to display a bottom sheet with options.
  void _showOptions(BuildContext context) {
    showModalBottomSheet(
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
          padding: const EdgeInsets.all(15.0),
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

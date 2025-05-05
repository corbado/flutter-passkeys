import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';

/// A simple debug overlay to display a list of checkpoints
class DebugOverlay {
  static OverlayEntry? _currentEntry;
  static late ValueListenable<List<Checkpoint>> _checkpoints;

  /// Show the overlay with the given checkpoints
  static void show(
    BuildContext context,
    ValueListenable<List<Checkpoint>> checkpoints,
  ) {
    _checkpoints = checkpoints;
    if (_currentEntry != null) return;
    _currentEntry = OverlayEntry(builder: (_) => _DebugOverlayWidget());
    Overlay.of(context)!.insert(_currentEntry!);
  }

  /// Hide the overlay
  static void hide() {
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class _DebugOverlayWidget extends StatefulWidget {
  @override
  _DebugOverlayWidgetState createState() => _DebugOverlayWidgetState();
}

class _DebugOverlayWidgetState extends State<_DebugOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 20,
      width: 300,
      child: Material(
        elevation: 4,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Doctor checkpoints',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: DebugOverlay.hide,
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Build each checkpoint item
              ValueListenableBuilder<List<Checkpoint>>(
                valueListenable: DebugOverlay._checkpoints,
                builder: (context, checkpointList, child) {
                  return Column(
                    children: checkpointList.isNotEmpty
                        ? checkpointList.map(_buildItem).toList()
                        : [
                            Text(
                              'Please try registering a passkey or using a passkey for the debugger tool to work',
                            )
                          ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Checkpoint cp) {
    // choose icon & color per type
    IconData iconData;
    Color color;
    switch (cp.type) {
      case CheckpointType.success:
        iconData = Icons.check;
        color = Colors.green;
        break;
      case CheckpointType.warning:
        iconData = Icons.warning_amber;
        color = Colors.orange;
        break;
      case CheckpointType.error:
        iconData = Icons.close;
        color = Colors.red;
        break;
    }

    // build a square “checkbox” with border + icon
    Widget box = Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Icon(
          iconData,
          size: 16,
          color: color,
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          box,
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cp.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(cp.description, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

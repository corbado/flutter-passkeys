import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A simple debug overlay to display a list of checkpoints
class DebugOverlay {
  static OverlayEntry? _currentEntry;
  static List<Checkpoint> _checkpoints = [];

  /// Show the overlay with the given checkpoints
  static void show(
    BuildContext context,
    List<Checkpoint> checkpoints,
  ) {
    _checkpoints = checkpoints;
    if (_currentEntry != null) return;
    _currentEntry = OverlayEntry(builder: (_) => _DebugOverlayWidget());
    Overlay.of(context)!.insert(_currentEntry!);
  }

  /// Update the displayed checkpoints
  static void update(List<Checkpoint> checkpoints) {
    _checkpoints = checkpoints;
    _currentEntry?.markNeedsBuild();
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
              for (var cp in DebugOverlay._checkpoints) _buildItem(cp),
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
                if (cp.documentationLink != null)
                  GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(cp.documentationLink!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {
                        debugPrint('Could not launch ${cp.documentationLink}');
                      }
                    },
                    child: const Text(
                      'Docs',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

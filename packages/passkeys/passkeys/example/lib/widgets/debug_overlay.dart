import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_example/providers.dart';

class DebugOverlay {
  static OverlayEntry? _currentEntry;

  static void show(BuildContext context) {
    if (_currentEntry != null) return;
    _currentEntry = OverlayEntry(builder: (_) => _DebugOverlayWidget());
    Overlay.of(context)!.insert(_currentEntry!);
  }

  static void hide() {
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class _DebugOverlayWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(doctorProvider);

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
              if (result.value != null &&
                  result.value!.checkpoints.isNotEmpty) ...[
                ...result.value!.checkpoints.map(_buildItem),
              ] else ...[
                const Text(
                  'Please try registering a passkey or using a passkey for the debugger tool to work',
                ),
              ],
              if (result.value?.exception != null) ...[
                const SizedBox(height: 4),
                const Divider(),
                const SizedBox(height: 2),
                Text(
                  'Latest Exception',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red.shade700,
                  ),
                ),
                const SizedBox(height: 2),
                FutureBuilder<ExceptionInfo>(
                  future: getExceptionInfo(
                    result.value!.exception!,
                    result.value!.checkpoints,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Text('Loading exception details...');
                    }
                    final info = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(info.description,
                            style: const TextStyle(fontSize: 12),),
                        if (info.platforms.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Platforms: ${info.platforms.join(', ')}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                        if (info.suggestions.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          const Text(
                            'Suggestions:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          ...info.suggestions.map((s) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 2),
                                child: Text(
                                  '• $s',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              )),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(Checkpoint cp) {
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

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Icon(iconData, size: 16, color: color),
          ),
        ),
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

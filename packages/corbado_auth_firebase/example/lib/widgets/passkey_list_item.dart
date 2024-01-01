import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:example/widgets/filled_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasskeyListItem extends HookWidget {
  final PasskeyInfo passkeyInfo;
  final Future<void> Function(String) onDelete;

  const PasskeyListItem(this.passkeyInfo, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Theme
              .of(context)
              .primaryColorDark, width: 2)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${passkeyInfo.id}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                  Text(
                    'Device: ${passkeyInfo.userAgent}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                  Text(
                    'Created: ${passkeyInfo.created}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                  Text(
                    'Synced: ${passkeyInfo.backupState}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            FilledTextButton(
              onTap: () async {
                isLoading.value = true;
                await onDelete(passkeyInfo.id);
                isLoading.value = false;
              },
              content: 'delete',
              isLoading: isLoading.value,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

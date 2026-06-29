import 'package:flutter/material.dart';

class OutlinedTextButton extends StatelessWidget {
  const OutlinedTextButton({
    required this.content,
    required this.onTap,
    super.key,
    this.disabled = false,
    this.isLoading = false,
  });
  final VoidCallback onTap;
  final String content;
  final bool disabled;
  final bool isLoading;

  void onPressed() {
    if (isLoading) {
      return;
    }

    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSecondary,
    );
    final progressIndicatorSize = textStyle.fontSize! * 1.4;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(15),
      ),
      onPressed: disabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: progressIndicatorSize,
              width: progressIndicatorSize,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : Text(content),
    );
  }
}

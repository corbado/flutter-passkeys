import 'package:flutter/material.dart';

/// An outlined button with a loading and disabled state.
class OutlinedTextButton extends StatelessWidget {
  /// Creates an outlined text button.
  const OutlinedTextButton({
    required this.content,
    required this.onTap,
    super.key,
    this.disabled = false,
    this.isLoading = false,
  });

  /// Called when the button is tapped and not loading.
  final VoidCallback onTap;

  /// The button label.
  final String content;

  /// Whether the button is disabled.
  final bool disabled;

  /// Whether the button shows a loading indicator instead of its label.
  final bool isLoading;

  /// Invokes [onTap] unless the button is currently loading.
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

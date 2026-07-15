import 'package:flutter/material.dart';

/// A filled (elevated) button with a loading and disabled state.
class FilledTextButton extends StatelessWidget {
  /// Creates a filled text button.
  const FilledTextButton({
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
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    final progressIndicatorSize = textStyle.fontSize! * 1.4;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        disabledBackgroundColor: Colors.grey.withValues(alpha: 0.25),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: disabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: progressIndicatorSize,
              width: progressIndicatorSize,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(content),
    );
  }
}

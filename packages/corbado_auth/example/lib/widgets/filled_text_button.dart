import 'package:flutter/material.dart';

class FilledTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String content;
  final bool disabled;
  final bool isLoading;

  const FilledTextButton(
      {super.key,
      required this.content,
      required this.onTap,
      this.disabled = false,
      this.isLoading = false});

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          disabledBackgroundColor: Colors.grey.withOpacity(0.25),
          padding: const EdgeInsets.all(15)),
      onPressed: disabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: progressIndicatorSize,
              width: progressIndicatorSize,
              child: CircularProgressIndicator())
          : Text(content),
    );
  }
}

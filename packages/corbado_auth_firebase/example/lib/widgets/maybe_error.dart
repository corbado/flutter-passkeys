import 'package:flutter/material.dart';

class MaybeError extends StatelessWidget {
  final String? error;
  const MaybeError(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    final err = error;
    if (err == null) {
      return Container();
    }

    return Text(
      err,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.error),
    );
  }
}

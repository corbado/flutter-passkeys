import 'package:flutter/material.dart';

class MaybeGenericError extends StatelessWidget {
  final String? message;

  const MaybeGenericError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    }

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          message!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

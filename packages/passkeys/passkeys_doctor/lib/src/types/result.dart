import 'package:flutter/services.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';

class Result {
  final List<Checkpoint> checkpoints;
  final PlatformException? exception;

  Result({
    required this.checkpoints,
    this.exception,
  });
}
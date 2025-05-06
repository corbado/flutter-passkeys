import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';

class Result {
  final List<Checkpoint> checkpoints;
  final PlatformException? exception;

  Result({
    required this.checkpoints,
    this.exception,
  });
}
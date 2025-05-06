import 'package:passkeys_doctor/passkeys_doctor.dart';

class Result {
  final List<Checkpoint> checkpoints;
  final Exception? exception;

  Result({
    required this.checkpoints,
    this.exception,
  });
}
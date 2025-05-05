import 'package:corbado_auth_doctor/corbado_auth_doctor.dart';

class DoctorException implements Exception {
  final Checkpoint blockingCheckpoint;

  DoctorException({
    required this.blockingCheckpoint,
  });

  @override
  String toString() {
    return 'DoctorException: cannot continue the next checks because the following checkpoint is failing: ${blockingCheckpoint.name}';
  }
}

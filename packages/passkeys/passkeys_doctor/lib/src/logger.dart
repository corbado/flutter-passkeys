import 'dart:async';

import 'package:passkeys_doctor/passkeys_doctor.dart';
import 'package:passkeys_doctor/src/types/result.dart';

class Logger {
  final Stream<Result> _stream;
  late final StreamSubscription<Result> _sub;

  Logger(this._stream) {
    print('--------------------Doctor--------------------');
    print('Doctor started');
    print('Starting any passkey operation will trigger a check');
    print('----------------------------------------------');

    _sub = _stream.listen(
          (result) {
        _print(result);
      },
      onDone: () {
        print('Doctor is done');
      },
      onError: (error) {
        print('Doctor is having issues: $error');
      },
    );
  }

  void _print(Result result) {
    print('--------------------Doctor--------------------');
    print('Checkpoints:');
    for (var checkpoint in result.checkpoints) {
      String checkbox;

      switch (checkpoint.type) {
        case CheckpointType.success:
          checkbox = '[✔]';
          break;
        case CheckpointType.warning:
          checkbox = '[!]';
          break;
        case CheckpointType.error:
          checkbox = '[✖]';
          break;
      }

      print(' $checkbox ${checkpoint.name}: ${checkpoint.type}');
    }
    if (result.exception != null) {
      print('Latest Exception: ${result.exception}');
    }
    print('----------------------------------------------');
  }

  Future<void> dispose() async {
    await _sub.cancel();
  }
}
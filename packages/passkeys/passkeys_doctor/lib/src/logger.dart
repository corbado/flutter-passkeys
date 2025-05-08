// lib/debug/logger.dart

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:passkeys_doctor/passkeys_doctor.dart';

class Logger {
  final Stream<Result> _stream;
  late final StreamSubscription<Result> _sub;

  Logger(this._stream) {
    print('--------------------Doctor--------------------');
    print('Doctor started');
    print('Starting any passkey operation will trigger a check');
    print('----------------------------------------------');

    _sub = _stream.listen(
      _printResult,
      onDone: () => print('Doctor is done'),
      onError: (e) => print('Doctor is having issues: $e'),
    );
  }

  void _printResult(Result result) async {
    print('--------------------Doctor--------------------');
    print('Checkpoints:');
    for (final cp in result.checkpoints) {
      final checkbox = {
        CheckpointType.success: '[✔]',
        CheckpointType.warning: '[!]',
        CheckpointType.error: '[✖]',
      }[cp.type]!;

      print(' $checkbox ${cp.name}: ${cp.description}');
    }

    if (result.exception != null) {
      await _printException(result.exception!, result.checkpoints);
    }

    print('----------------------------------------------');
  }

  Future<void> _printException(
      PlatformException error, List<Checkpoint> checkpoints) async {
    print('Latest Exception:');

    final info = await getExceptionInfo(error, checkpoints);

    print(' ${info.title}: ${info.description}');
    if (info.platforms.isNotEmpty) {
      print(' Platforms: ${info.platforms.join(', ')}');
    }
    if (info.suggestions.isNotEmpty) {
      print(' Suggestions:');
      for (final s in info.suggestions) {
        print('  • $s');
      }
    }
  }

  Future<void> dispose() async => _sub.cancel();
}

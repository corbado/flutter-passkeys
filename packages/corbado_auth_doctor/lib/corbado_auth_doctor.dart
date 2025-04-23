import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'types/checkpoint.dart';

class CorbadoAuthDoctor {
  final String _projectId;

  final Future<String?> _rpId;

  CorbadoAuthDoctor(this._projectId, this._rpId);

  Future<List<Checkpoint>> check() async {
    List<Checkpoint> checkpoints = [];

    // Check project ID
    checkpoints.add(_checkProjectId());

    // Check RP ID
    final rpIdCheckpoint = await _checkRpId();
    checkpoints.add(rpIdCheckpoint);

    return checkpoints;
  }

  Checkpoint _checkProjectId() {
    if (_projectId.isEmpty) {
      return Checkpoint(
        name: 'Project ID Check',
        description:
            'Project ID is not set. Make sure you pass it when initializing CorbadoAuth. You can find your project ID in the developer panel',
        documentationLink:
            'https://app.corbado.com/settings/general?tab=Project+Info',
        type: CheckpointType.error,
      );
    }

    if (!_projectId.startsWith('pro-')) {
      return Checkpoint(
        name: 'Project ID Check',
        description: 'Project ID is not valid. it should start with "pro-".',
        type: CheckpointType.error,
      );
    }

    return Checkpoint(
      name: 'Project ID Check',
      description: 'Project ID is set correctly.',
      type: CheckpointType.success,
    );
  }

  Future<Checkpoint> _checkRpId() async {
    final rpId = await _rpId;
    if (rpId == null || rpId.isEmpty) {
      return Checkpoint(
        name: 'RP ID Check',
        description:
            'RP ID is not set. Make sure to set it on the Corbado developer panel.',
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
        type: CheckpointType.error,
      );
    }

    var expectedRpId = 'localhost';

    if (!kIsWeb) {
      expectedRpId = '${_projectId}.frontendapi.cloud.corbado.io';
    }

    if (rpId != expectedRpId) {
      return Checkpoint(
        name: 'RP ID Check',
        description:
            'RP ID might not be valid. it should be $expectedRpId (or the project CNAME if you have set one) but it is $rpId.',
        type: CheckpointType.warning,
        documentationLink: 'https://app.corbado.com/settings/general?tab=URLs',
      );
    }

    return Checkpoint(
      name: 'RP ID Check',
      description: 'RP ID is set correctly.',
      type: CheckpointType.success,
    );
  }
}

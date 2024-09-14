import 'dart:async';

import 'package:corbado_auth/src/blocks/signup_init_block.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/corbado_auth.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

class ProcessHandler {
  final CorbadoService _corbadoService;
  final _componentWithDataStream = StreamController<ComponentWithData>.new();
  ScreenNames _currentScreen = ScreenNames.SignupInit;
  Block? _currentBlock;

  get componentWithDataStream => _componentWithDataStream.stream;

  ProcessHandler({required CorbadoService corbadoService}) : _corbadoService = corbadoService;

  updateBlockFromServer(ProcessResponse processResponse) {
    final newPrimaryBlock = _parseBlockData(processResponse.blockBody, processResponse.common);
    final alternatives = processResponse.blockBody.alternatives.map((e) => _parseBlockData(e, processResponse.common)).toList();

    // TODO: init
    newPrimaryBlock.alternatives = alternatives;

    _updatePrimaryBlock(newPrimaryBlock);
  }

  updateBlockFromClient(Block newPrimaryBlock, List<Block> newAlternatives) {
    newPrimaryBlock.alternatives = newAlternatives;
    _updatePrimaryBlock(newPrimaryBlock);
  }

  updateBlockFromError(CorbadoError error) {
    if (_currentBlock == null) {
      return null;
    }

    _currentBlock!.error = error;

    _updatePrimaryBlock(_currentBlock!);
  }

  Block _parseBlockData(BlockBody body, ProcessCommon common) {
    Block block;

    switch (body.block) {
      case BlockType.signupInit:
        block = SignupInitBlock(
          corbadoService: _corbadoService,
          processHandler: this,
          data: SignupInitBlockData.fromProcessResponse(body.data as GeneralBlockSignupInit),
        );
        break;

      default:
        throw Exception('Unknown block type: ${body.block}');
    }

    if (body.error != null) {
      block.error = CorbadoError(
        errorCode: body.error!.code,
        translatedError: Translator.error(body.error!.code),
      );
    }

    return block;
  }

  _updatePrimaryBlock(Block newPrimaryBlock) {
    final blockHasChanged = _currentBlock != newPrimaryBlock;
    if (!blockHasChanged) {
      _currentScreen = newPrimaryBlock.initialScreen;
    }

    _currentBlock = newPrimaryBlock;

    final event = ComponentWithData(_currentScreen, newPrimaryBlock);
    _componentWithDataStream.add(event);
  }
}
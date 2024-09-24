import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/completed_block.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

class ComponentWithData {
  final ScreenNames screenName;
  final Block<dynamic> block;

  ComponentWithData(this.screenName, this.block);
}

class ProcessHandler {
  final CorbadoService corbadoService;

  final void Function(String shortSession, String? longSession) onLoggedIn;

  final _componentWithDataStream = StreamController<ComponentWithData>.broadcast();
  ScreenNames _currentScreen = ScreenNames.SignupInit;
  Block<dynamic>? _currentBlock;

  Stream<ComponentWithData> get componentWithDataStream => _componentWithDataStream.stream;

  ProcessHandler({required this.corbadoService, required this.onLoggedIn});

  updateBlockFromServer(ProcessResponse processResponse) {
    final newPrimaryBlock = _parseBlockData(processResponse.blockBody, processResponse.common);
    final alternatives = (processResponse.blockBody.alternatives?.toList() ?? [])
        .map((BlockBody e) => _parseBlockData(e, processResponse.common))
        .toList();

    newPrimaryBlock.alternatives = alternatives;

    _updatePrimaryBlock(newPrimaryBlock);
  }

  updateBlockFromClient(Block<dynamic> newPrimaryBlock, List<Block<dynamic>> newAlternatives) {
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

  updateCurrentScreen(ScreenNames screen) {
    if (_currentBlock == null) {
      return null;
    }

    _currentScreen = screen;
    _componentWithDataStream.add(ComponentWithData(_currentScreen, _currentBlock!));
  }

  Block<dynamic> _parseBlockData(BlockBody body, ProcessCommon common) {
    Block<dynamic> block;

    switch (body.block) {
      case BlockType.signupInit:
        final typed = body.data.oneOf.value! as GeneralBlockSignupInit;
        block = SignupInitBlock(
          processHandler: this,
          data: SignupInitBlockData.fromProcessResponse(typed),
        );
        block.error = CorbadoError.fromRequestError(typed.error);

      case BlockType.loginInit:
        final typed = body.data.oneOf.value! as GeneralBlockLoginInit;
        block = LoginInitBlock(processHandler: this, data: LoginInitBlockData.fromProcessResponse(typed));
        block.error = CorbadoError.fromRequestError(typed.error);

      case BlockType.emailVerify:
        final typed = body.data.oneOf.value! as GeneralBlockVerifyIdentifier;
        block = EmailVerifyBlock(
          processHandler: this,
          data: EmailVerifyBlockData.fromProcessResponse(typed),
          authType: body.authType,
        );
        block.error = CorbadoError.fromRequestError(typed.error);

      case BlockType.completed:
        final typed = body.data.oneOf.value! as GeneralBlockCompleted;
        block = CompletedBlock(
          processHandler: this,
          data: CompletedBlockData.fromProcessResponse(typed),
        );

      case BlockType.passkeyAppend:
        final typed = body.data.oneOf.value! as GeneralBlockPasskeyAppend;
        block = PasskeyAppendBlock(
          processHandler: this,
          data: PasskeyAppendBlockData.fromProcessResponse(typed),
          authType: body.authType,
        );

      case BlockType.passkeyVerify:
        final typed = body.data.oneOf.value! as GeneralBlockPasskeyVerify;
        block = PasskeyVerifyBlock(
          processHandler: this,
          data: PasskeyVerifyBlockData.fromProcessResponse(typed),
        );

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

  void notifyCurrentScreen() {
    if (_currentBlock == null) {
      return null;
    }

    final event = ComponentWithData(_currentScreen, _currentBlock!);
    _componentWithDataStream.add(event);
  }

  void _updatePrimaryBlock(Block<dynamic> newPrimaryBlock) {
    if (newPrimaryBlock is CompletedBlock) {
      _onAuthProcessCompleted(newPrimaryBlock.data);
      return;
    }

    final blockHasChanged = _currentBlock?.type != newPrimaryBlock.type;
    if (blockHasChanged && newPrimaryBlock.initialScreen != null) {
      _currentScreen = newPrimaryBlock.initialScreen!;
      newPrimaryBlock.init();
    }

    _currentBlock = newPrimaryBlock;

    final event = ComponentWithData(_currentScreen, newPrimaryBlock);
    _componentWithDataStream.add(event);
  }

  void _onAuthProcessCompleted(CompletedBlockData data) {
    corbadoService.clearAuthProcess();
    _currentBlock = null;
    onLoggedIn(data.shortSession, data.longSession);
  }
}

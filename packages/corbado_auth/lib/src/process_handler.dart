import 'dart:async';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/completed_block.dart';
import 'package:corbado_auth/src/blocks/passkey_verify_block.dart';
import 'package:corbado_auth/src/blocks/signup_init_block.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/corbado_auth.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/session/session.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:passkeys/authenticator.dart';

class ProcessHandler {
  final CorbadoService corbadoService;
  final SessionService sessionService;

  // final PasskeyAuthenticator passkeyAuthenticator;
  final void Function() onLoggedIn;

  final _componentWithDataStream = StreamController<ComponentWithData>.broadcast();
  ScreenNames _currentScreen = ScreenNames.SignupInit;
  Block? _currentBlock;

  Stream<ComponentWithData> get componentWithDataStream => _componentWithDataStream.stream;

  ProcessHandler({required this.corbadoService, required this.sessionService, required this.onLoggedIn});

  updateBlockFromServer(ProcessResponse processResponse) {
    final newPrimaryBlock = _parseBlockData(processResponse.blockBody, processResponse.common);
    final alternatives = (processResponse.blockBody.alternatives?.toList() ?? [])
        .map((BlockBody e) => _parseBlockData(e, processResponse.common))
        .toList();

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

  updateCurrentScreen(ScreenNames screen) {
    if (_currentBlock == null) {
      return null;
    }

    _currentScreen = screen;
    _componentWithDataStream.add(ComponentWithData(_currentScreen, _currentBlock!));
  }

  Block _parseBlockData(BlockBody body, ProcessCommon common) {
    Block block;

    switch (body.block) {
      case BlockType.signupInit:
        block = SignupInitBlock(
          processHandler: this,
          data: SignupInitBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockSignupInit),
        );

      case BlockType.loginInit:
        block = LoginInitBlock(
            processHandler: this,
            data: LoginInitBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockLoginInit));

      case BlockType.emailVerify:
        block = EmailVerifyBlock(
            processHandler: this,
            data: EmailVerifyBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockVerifyIdentifier));

      case BlockType.completed:
        block = CompletedBlock(
          processHandler: this,
          data: CompletedBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockCompleted),
        );

      case BlockType.passkeyAppend:
        block = PasskeyAppendBlock(
          processHandler: this,
          data: PasskeyAppendBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockPasskeyAppend),
        );

      case BlockType.passkeyVerify:
        block = PasskeyVerifyBlock(
          processHandler: this,
          data: PasskeyVerifyBlockData.fromProcessResponse(body.data.oneOf.value! as GeneralBlockPasskeyVerify),
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

  _updatePrimaryBlock(Block<dynamic> newPrimaryBlock) {
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

  _onAuthProcessCompleted(CompletedBlockData data) {
    corbadoService.clearAuthProcess();
    _currentBlock = null;
    sessionService.setUser(User.fromIdToken(data.shortSession));

    onLoggedIn();
  }
}

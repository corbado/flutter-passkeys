import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

class SignupInitBlockData {
  final TextFieldWithError? fullName;
  final TextFieldWithError? email;
  final CorbadoError? error;

  SignupInitBlockData({this.fullName, this.email, this.error});

  factory SignupInitBlockData.fromProcessResponse(GeneralBlockSignupInit typed) {
    TextFieldWithError? fullName;
    if (typed.fullName != null) {
      fullName = TextFieldWithError(
        value: typed.fullName!.fullName,
        error: CorbadoError.fromRequestError(typed.fullName!.error),
      );
    }

    TextFieldWithError? email;
    for (final identifier in typed.identifiers) {
      if (identifier.type == LoginIdentifierType.email) {
        email = TextFieldWithError(
            value: identifier.identifier,
            error: CorbadoError.fromRequestErrorWithIdentifier(identifier.error, identifier.type));
      }
    }

    return SignupInitBlockData(
      fullName: fullName,
      email: email,
      error: CorbadoError.fromRequestError(typed.error),
    );
  }
}

class SignupInitBlock extends Block {
  final SignupInitBlockData data;

  SignupInitBlock({required ProcessHandler processHandler, required this.data})
      : super(
          processHandler: processHandler,
          type: BlockType.signupInit,
          alternatives: [],
          initialScreen: ScreenNames.SignupInit,
        );

  navigateToLogin() {
    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  submitSignupInit({String? email, String? fullName}) async {
    try {
      final res = await corbadoService.signupInit(email: email, fullName: fullName);
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

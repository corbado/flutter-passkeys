import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

class SignupInitBlockData {
  final TextFieldWithError? fullName;
  final TextFieldWithError? email;
  final CorbadoError? error;

  SignupInitBlockData({this.fullName, this.email, this.error});

  factory SignupInitBlockData.fromProcessResponse(
      GeneralBlockSignupInit typed) {
    TextFieldWithError? fullName;
    if (typed.fullName != null) {
      fullName = TextFieldWithError(
          value: typed.fullName!.fullName,
          error: Translator.error(typed.fullName!.error?.code));
    }

    TextFieldWithError? email;
    for (final identifier in typed.identifiers) {
      if (identifier.type == LoginIdentifierType.email) {
        email = TextFieldWithError(
            value: identifier.identifier,
            error: Translator.error(identifier.error?.code));
      }
    }

    return SignupInitBlockData(
      fullName: fullName,
      email: email,
      error: Translator.error(typed.error?.code),
    );
  }
}

class SignupInitBlock extends Block {
  final SignupInitBlockData data;
  final ScreenNames initialScreen = ScreenNames.SignupInit;

  SignupInitBlock(
      {required CorbadoService corbadoService,
      required ProcessHandler processHandler,
      required this.data})
      : super(
            corbadoService: corbadoService,
            processHandler: processHandler,
            alternatives: [],
            initialScreen: ScreenNames.SignupInit);

  switchToLogin() {
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

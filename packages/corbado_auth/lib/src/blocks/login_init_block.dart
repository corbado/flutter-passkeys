import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

class LoginInitBlockData {
  LoginInitBlockData({
    required this.loginIdentifier,
    required this.loginIdentifierError,
    required this.conditionalUIChallenge,
    required this.isPhoneFocused,
    required this.emailEnabled,
    required this.usernameEnabled,
    required this.phoneEnabled,
  });

  final String loginIdentifier;
  final CorbadoError? loginIdentifierError;
  final String? conditionalUIChallenge;
  final bool isPhoneFocused;
  final bool emailEnabled;
  final bool usernameEnabled;
  final bool phoneEnabled;

  factory LoginInitBlockData.fromProcessResponse(GeneralBlockLoginInit typed) {
    return LoginInitBlockData(
      loginIdentifier: typed.identifierValue,
      loginIdentifierError: CorbadoError.fromRequestError(typed.fieldError),
      conditionalUIChallenge: typed.conditionalUIChallenge,
      isPhoneFocused: typed.isPhone,
      emailEnabled: typed.isEmailAvailable,
      usernameEnabled: typed.isUsernameAvailable,
      phoneEnabled: typed.isPhoneAvailable,
    );
  }
}

class LoginInitBlock extends Block {
  final LoginInitBlockData data;

  LoginInitBlock({required ProcessHandler processHandler, required this.data})
      : super(
          processHandler: processHandler,
          type: BlockType.loginInit,
          alternatives: [],
          initialScreen: ScreenNames.LoginInit,
        );

  navigateToSignup() {
    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  submitLogin({required String loginIdentifier, bool isPhone = false}) async {
    try {
      final response = await corbadoService.loginInit(loginIdentifier, isPhone);
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  continueWithConditionalUI({void Function()? onAuthenticatorCompleted}) async {
    if (data.conditionalUIChallenge == null) {
      return;
    }

    try {
      final response = await corbadoService.finishPasskeyMediation(data.conditionalUIChallenge!);
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

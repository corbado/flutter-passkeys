import 'package:corbado_auth/corbado_auth.dart';
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
  bool primaryLoading = false;

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

class LoginInitBlock extends Block<LoginInitBlockData> {
  LoginInitBlock({required ProcessHandler processHandler, required LoginInitBlockData data})
      : super(
          processHandler: processHandler,
          type: BlockType.loginInit,
          alternatives: [],
          initialScreen: ScreenNames.LoginInit,
          data: data,
          authProcessType: AuthProcessType.Login,
        );

  init() {
    initConditionalUI();
  }

  navigateToSignup() {
    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  submitLogin({required String loginIdentifier, bool isPhone = false}) async {
    try {
      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final response = await corbadoService.loginInit(loginIdentifier, isPhone);
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }

  initConditionalUI() async {
    final challenge = data.conditionalUIChallenge;
    if (challenge == null) {
      print('Conditional UI can not be started (missing challenge)');
      return;
    }

    try {
      final response = await corbadoService.verifyPasskeyConditional(challenge, true);
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    } on AuthenticatorException catch (e) {
      // all authenticator exceptions that have not been translated to errors are handled silently here
      return;
    }
  }
}

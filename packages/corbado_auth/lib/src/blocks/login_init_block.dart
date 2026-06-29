import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
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

  final String loginIdentifier;
  final CorbadoError? loginIdentifierError;
  final String? conditionalUIChallenge;
  final bool isPhoneFocused;
  final bool emailEnabled;
  final bool usernameEnabled;
  final bool phoneEnabled;
  bool primaryLoading = false;
}

class LoginInitBlock extends Block<LoginInitBlockData> {
  LoginInitBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         type: BlockType.loginInit,
         alternatives: [],
         initialScreen: ScreenNames.LoginInit,
         authProcessType: AuthProcessType.Login,
       );

  @override
  void init() {
    initConditionalUI();
  }

  void navigateToSignup() {
    TelemetryService.instance.logMethodCalled(
      'navigateToSignup',
      'LoginInitBlock',
    );

    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  Future<void> submitLogin({
    required String loginIdentifier,
    bool isPhone = false,
  }) async {
    TelemetryService.instance.logMethodCalled(
      'submitLogin',
      'LoginInitBlock',
    );

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

  Future<void> initConditionalUI() async {
    TelemetryService.instance.logMethodCalled(
      'initConditionalUI',
      'LoginInitBlock',
    );

    final challenge = data.conditionalUIChallenge;
    if (challenge == null) {
      print('Conditional UI can not be started (missing challenge)');
      return;
    }

    try {
      final response = await corbadoService.verifyPasskeyConditional(
        challenge,
        true,
      );
      processHandler.updateBlockFromServer(response);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    } on AuthenticatorException {
      // all authenticator exceptions that have not been translated to errors are handled silently here
      return;
    }
  }
}

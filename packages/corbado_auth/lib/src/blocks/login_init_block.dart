import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:flutter/foundation.dart';

/// Data backing the initial login step of an authentication process.
class LoginInitBlockData {
  /// Creates the data describing the login identifier and enabled options.
  LoginInitBlockData({
    required this.loginIdentifier,
    required this.loginIdentifierError,
    required this.conditionalUIChallenge,
    required this.isPhoneFocused,
    required this.emailEnabled,
    required this.usernameEnabled,
    required this.phoneEnabled,
  });

  /// Builds the data from a server [GeneralBlockLoginInit] response.
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

  /// The current value of the login identifier field.
  final String loginIdentifier;

  /// The validation error for the login identifier, if any.
  final CorbadoError? loginIdentifierError;

  /// The challenge used to start conditional UI, if available.
  final String? conditionalUIChallenge;

  /// Whether the phone input should currently be focused.
  final bool isPhoneFocused;

  /// Whether email is an allowed login identifier.
  final bool emailEnabled;

  /// Whether username is an allowed login identifier.
  final bool usernameEnabled;

  /// Whether phone is an allowed login identifier.
  final bool phoneEnabled;

  /// Whether the primary action is currently loading.
  bool primaryLoading = false;
}

/// Block that drives the initial login step of an authentication process.
class LoginInitBlock extends Block<LoginInitBlockData> {
  /// Creates the block with the given process handler and data.
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

  /// Switches the process to the signup flow.
  void navigateToSignup() {
    TelemetryService.instance.logMethodCalled(
      'navigateToSignup',
      'LoginInitBlock',
    );

    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  /// Submits the given [loginIdentifier] to start the login.
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

  /// Starts conditional UI (passkey autofill) if a challenge is present.
  Future<void> initConditionalUI() async {
    TelemetryService.instance.logMethodCalled(
      'initConditionalUI',
      'LoginInitBlock',
    );

    final challenge = data.conditionalUIChallenge;
    if (challenge == null) {
      debugPrint('Conditional UI can not be started (missing challenge)');
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
      // all authenticator exceptions that have not been translated to errors
      // are handled silently here
      return;
    }
  }
}

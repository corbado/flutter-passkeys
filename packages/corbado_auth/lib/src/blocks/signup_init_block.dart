import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/services/telemetry/telemetry.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

/// Data backing the initial signup step of an authentication process.
class SignupInitBlockData {
  /// Creates the data describing the full name and email fields.
  SignupInitBlockData({this.fullName, this.email});

  /// Builds the data from a server [GeneralBlockSignupInit] response.
  factory SignupInitBlockData.fromProcessResponse(
    GeneralBlockSignupInit typed,
  ) {
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
          error: CorbadoError.fromRequestErrorWithIdentifier(
            identifier.error,
            identifier.type,
          ),
        );
      }
    }

    return SignupInitBlockData(
      fullName: fullName,
      email: email,
    );
  }

  /// The full name field with its current value and validation error.
  final TextFieldWithError? fullName;

  /// The email field with its current value and validation error.
  final TextFieldWithError? email;

  /// Whether the primary action is currently loading.
  bool primaryLoading = false;
}

/// Block that drives the initial signup step of an authentication process.
class SignupInitBlock extends Block<SignupInitBlockData> {
  /// Creates the block with the given process handler and data.
  SignupInitBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         type: BlockType.signupInit,
         alternatives: [],
         initialScreen: ScreenNames.SignupInit,
         authProcessType: AuthProcessType.Signup,
       );

  /// Switches the process to the login flow.
  void navigateToLogin() {
    TelemetryService.instance.logMethodCalled(
      'navigateToLogin',
      'SignupInitBlock',
    );

    final newPrimaryBlock = alternatives.first;
    final newAlternatives = [this];

    processHandler.updateBlockFromClient(newPrimaryBlock, newAlternatives);
  }

  /// Submits the [email] and [fullName] to start the signup.
  Future<void> submitSignupInit({String? email, String? fullName}) async {
    TelemetryService.instance.logMethodCalled(
      'submitSignupInit',
      'SignupInitBlock',
    );

    try {
      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final res = await corbadoService.signupInit(
        email: email,
        fullName: fullName,
      );
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }
}

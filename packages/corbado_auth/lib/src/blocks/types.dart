// ignore_for_file: constant_identifier_names
// ignore_for_file: prefer_constructors_over_static_methods

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:meta/meta.dart';

/// The type of authentication process a block belongs to.
enum AuthProcessType {
  /// A login process.
  Login,

  /// A signup process.
  Signup,
}

/// A text field value together with an optional validation error.
class TextFieldWithError {
  /// Creates a field with the given [value] and optional [error].
  const TextFieldWithError({required this.value, this.error});

  /// The current value of the field.
  final String value;

  /// The validation error for the field, if any.
  final CorbadoError? error;
}

/// A fallback verification option presented to the user.
class PasskeyFallback {
  /// Creates a fallback with a [label] and an [onTap] callback.
  PasskeyFallback({required this.label, required this.onTap});

  /// The label shown to the user for this fallback.
  final String label;

  /// The callback invoked when the fallback is selected.
  final void Function() onTap;
}

/// An error raised during a Corbado authentication process.
class CorbadoError {
  /// Creates an error with an [errorCode], [translatedError] and optional
  /// [original] cause.
  const CorbadoError({
    required this.errorCode,
    required this.translatedError,
    this.original,
  });

  /// Creates an error representing a missing server response.
  factory CorbadoError.fromMissingServerResponse() {
    const code = 'missing_server_response';

    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code),
    );
  }

  /// Creates an error representing an unknown error [e].
  factory CorbadoError.fromUnknownError(Object e) {
    const code = 'unknown_error';

    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code),
      original: e,
    );
  }

  /// The machine readable error code.
  final String errorCode;

  /// The human readable, translated error message.
  final String translatedError;

  /// The original error object that caused this error, if any.
  final dynamic original;

  /// Returns a detailed string combining the code and original error.
  String detailedError() {
    return 'error ($errorCode): $original';
  }

  /// Creates an error from a server [RequestError], or null if there is none.
  static CorbadoError? fromRequestError(RequestError? error) {
    if (error == null) {
      return null;
    }

    return CorbadoError(
      errorCode: error.code,
      translatedError: Translator.error(error.code),
    );
  }

  /// Creates an error from a [RequestError] using identifier-specific
  /// translations, or null if there is none.
  static CorbadoError? fromRequestErrorWithIdentifier(
    RequestError? error,
    LoginIdentifierType identifierType,
  ) {
    if (error == null) {
      return null;
    }

    final translatedError = Translator.errorWithIdentifier(
      error.code,
      identifierType,
    );

    return CorbadoError(
      errorCode: error.code,
      translatedError: translatedError,
    );
  }

  /// Creates an error from an authenticator exception [e].
  static CorbadoError fromAuthenticatorError(AuthenticatorException e) {
    if (e is PasskeyAuthCancelledException) {
      const errorCode = 'passkey_operation_cancelled';
      return CorbadoError(
        errorCode: errorCode,
        translatedError: Translator.error(errorCode),
        original: e,
      );
    }

    return CorbadoError.fromUnknownError(e);
  }
}

/// Base class for a single step (block) in an authentication process.
class Block<T> {
  /// Creates a block with its process handler, type, alternatives and data.
  Block({
    required this.processHandler,
    required this.type,
    required this.alternatives,
    required this.data,
    required this.authProcessType,
    this.initialScreen,
  });

  /// The handler that drives transitions between blocks.
  @protected
  final ProcessHandler processHandler;

  /// The alternative blocks the user can switch to.
  @protected
  List<Block<dynamic>> alternatives;

  /// The screen this block initially shows, if any.
  @protected
  ScreenNames? initialScreen;

  /// The server-defined type of this block.
  @protected
  final BlockType type;

  /// The current error for this block, if any.
  CorbadoError? error;

  /// The data backing this block.
  T data;

  /// Whether this block belongs to a login or signup process.
  AuthProcessType authProcessType;

  /// The service used to communicate with the Corbado backend.
  @protected
  CorbadoService get corbadoService => processHandler.corbadoService;

  /// Initializes the block; overridden by subclasses as needed.
  @protected
  void init() {}

  /// Resets the current authentication process.
  Future<void> resetProcess() async {
    try {
      final res = await corbadoService.resetAuthProcess();
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

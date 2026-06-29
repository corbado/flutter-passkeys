import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:meta/meta.dart';

enum AuthProcessType { Login, Signup }

class TextFieldWithError {
  const TextFieldWithError({required this.value, this.error});
  final String value;
  final CorbadoError? error;
}

class PasskeyFallback {
  PasskeyFallback({required this.label, required this.onTap});

  final String label;
  final void Function() onTap;
}

class CorbadoError {
  const CorbadoError({
    required this.errorCode,
    required this.translatedError,
    this.original,
  });

  factory CorbadoError.fromMissingServerResponse() {
    const code = 'missing_server_response';

    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code),
    );
  }

  factory CorbadoError.fromUnknownError(Object e) {
    const code = 'unknown_error';

    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code),
      original: e,
    );
  }
  final String errorCode;
  final String translatedError;
  final dynamic original;

  String detailedError() {
    return 'error ($errorCode): $original';
  }

  static CorbadoError? fromRequestError(RequestError? error) {
    if (error == null) {
      return null;
    }

    return CorbadoError(
      errorCode: error.code,
      translatedError: Translator.error(error.code),
    );
  }

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

class Block<T> {
  Block({
    required this.processHandler,
    required this.type,
    required this.alternatives,
    required this.data,
    required this.authProcessType,
    this.initialScreen,
  });
  @protected
  final ProcessHandler processHandler;
  @protected
  List<Block<dynamic>> alternatives;
  @protected
  ScreenNames? initialScreen;
  @protected
  final BlockType type;

  CorbadoError? error;
  T data;
  AuthProcessType authProcessType;

  @protected
  CorbadoService get corbadoService => processHandler.corbadoService;

  @protected
  void init() {}

  Future<void> resetProcess() async {
    try {
      final res = await corbadoService.resetAuthProcess();
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}

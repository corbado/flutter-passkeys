import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:passkeys/authenticator.dart';

class TextFieldWithError {
  final String value;
  final CorbadoError? error;

  const TextFieldWithError({required this.value, this.error});
}

class PasskeyFallback {
  PasskeyFallback({required this.label, required this.onTap});

  final String label;
  final void Function() onTap;
}

class CorbadoError {
  final String errorCode;
  final String translatedError;

  const CorbadoError({required this.errorCode, required this.translatedError});

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
    );
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
}

class Block<T> {
  final ProcessHandler processHandler;
  List<Block<dynamic>> alternatives;
  ScreenNames? initialScreen;
  final BlockType type;
  CorbadoError? error;
  T data;

  CorbadoService get corbadoService => processHandler.corbadoService;

  Block({
    required this.processHandler,
    required this.type,
    this.initialScreen,
    required this.alternatives,
    required this.data,
  });

  init() {}
}

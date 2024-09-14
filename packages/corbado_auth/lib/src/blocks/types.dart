import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/translator.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

class TextFieldWithError {
  final String value;
  final CorbadoError? error;

  const TextFieldWithError({required this.value, this.error});
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

  factory CorbadoError.fromApiException(ApiException e) {
    const code = 'api_exception';
    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code) + ': ${e.message}',
    );
  }

  factory CorbadoError.fromUnknownError(Object e) {
    const code = 'unknown_error';
    return CorbadoError(
      errorCode: code,
      translatedError: Translator.error(code) + ': ${e.toString()}',
    );
  }
}

class Block {
  List<Block> alternatives;
  final CorbadoService corbadoService;
  final ProcessHandler processHandler;
  final ScreenNames initialScreen;
  CorbadoError? error;

  Block(
      {required this.corbadoService,
      required this.processHandler,
      required this.initialScreen,
      required this.alternatives});
}

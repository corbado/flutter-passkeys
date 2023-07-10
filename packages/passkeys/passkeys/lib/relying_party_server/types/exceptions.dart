import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'exceptions.g.dart';

class UserAlreadyExistsException implements Exception {
  UserAlreadyExistsException(this.message);

  final String message;
}

class UnknownUserException implements Exception {
  UnknownUserException(this.message);

  final String message;
}

class UnexpectedBackendException implements Exception {
  UnexpectedBackendException(this.operation, this.message);

  final String operation;
  final String message;

  @override
  String toString() {
    return "Error when calling backend with operation ${operation}, message: ${message}";
  }
}

class ExceptionFactory {
  ///
  static Exception fromBackendMessage(String operation, String message) {
    final decoded = jsonDecode(message);
    if (decoded is! Map<String, dynamic> || !decoded.containsKey('error')) {
      return UnexpectedBackendException(operation, message);
    }

    final backendMessage =
        BackendMessage.fromJson(decoded['error'] as Map<String, dynamic>);
    switch (backendMessage.type) {
      case 'validation_error':
        if (backendMessage.validation == null) {
          return UnexpectedBackendException(operation, message);
        }

        return ValidationException(
          operation,
          message,
          backendMessage.validation!,
        );
      default:
        return UnexpectedBackendException(operation, message);
    }
  }
}

@JsonSerializable(explicitToJson: true)
class BackendMessage {
  BackendMessage({
    required this.type,
    required this.validation,
  });

  final String type;
  final List<BackendValidationError>? validation;

  factory BackendMessage.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BackendMessageFromJson(json);

  Map<String, dynamic> toJson() => _$BackendMessageToJson(this);
}

@JsonSerializable()
class BackendValidationError {
  BackendValidationError({
    required this.field,
    required this.message,
  });

  final String field;
  final String message;

  factory BackendValidationError.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BackendValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$BackendValidationErrorToJson(this);
}

class ValidationException implements Exception {
  ValidationException(this.operation, this.message, this.validationErrors);

  final String operation;
  final String message;
  final List<BackendValidationError> validationErrors;

  @override
  String toString() {
    final e = validationErrors.first;
    var out = 'field "${e.field}" ${e.message}';

    if (validationErrors.length > 1) {
      out += validationErrors.map((e) {
        return ', field "${e.field}" ${e.message}';
      }).toString();
    }

    return out;
  }
}

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'exceptions.g.dart';

/// Exception thrown when the user already exists
class UserAlreadyExistsException implements Exception {
  /// Constructor
  UserAlreadyExistsException(this.message);

  /// The message
  final String message;
}

/// Exception thrown when the user is unknown
class UnknownUserException implements Exception {
  /// Constructor
  UnknownUserException(this.message);

  /// The message
  final String message;
}

/// Exception thrown when the backend returns an unexpected response
class UnexpectedBackendException implements Exception {
  /// Constructor
  UnexpectedBackendException(this.operation, this.message);

  /// Operation where the error occurred
  final String operation;

  /// Error message
  final String message;

  @override
  String toString() {
    return 'Error when calling backend with operation $operation,'
        ' message: $message';
  }
}

/// Factory for creating exceptions from backend messages
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
        final err = backendMessage.validation;
        if (err == null || err.isEmpty) {
          return UnexpectedBackendException(operation, message);
        }

        return _fromValidationError(operation, message, err);
      case 'not_found':
        if (backendMessage.details == "user doesn't exist") {
          return UnknownUserException(backendMessage.details!);
        }

        return UnexpectedBackendException(operation, message);
      default:
        return UnexpectedBackendException(operation, message);
    }
  }

  static Exception _fromValidationError(
    String operation,
    String message,
    List<BackendValidationError> e,
  ) {
    if (e.first.field == 'username' &&
        e.first.message == 'user already exists') {
      return UserAlreadyExistsException(message);
    }

    return ValidationException(operation, message, e);
  }
}

/// Represents a message from a Corbado API
@JsonSerializable(explicitToJson: true)
class BackendMessage {
  /// Constructor
  BackendMessage({
    required this.type,
    required this.validation,
    required this.details,
  });

  /// Deserializes a BackendMessage
  factory BackendMessage.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BackendMessageFromJson(json);

  /// Message type
  final String type;

  /// List of validation errors
  final List<BackendValidationError>? validation;

  /// Error details
  final String? details;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$BackendMessageToJson(this);
}

/// Represents a backend validation error
@JsonSerializable()
class BackendValidationError {
  /// Constructor
  BackendValidationError({
    required this.field,
    required this.message,
  });

  /// Deserializes a BackendValidationError
  factory BackendValidationError.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BackendValidationErrorFromJson(json);

  /// The field
  final String field;

  /// The message
  final String message;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$BackendValidationErrorToJson(this);
}

/// Represents a validation exception
class ValidationException implements Exception {
  /// Constructor
  ValidationException(this.operation, this.message, this.validationErrors);

  /// The operation
  final String operation;

  /// The message
  final String message;

  /// The validation errors
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

/// Exception thrown when no passkey is available for the device
class NoPasskeyForDeviceException implements Exception {}

import 'dart:convert';

import 'package:corbado_auth/src/types/exceptions/field.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exceptions.g.dart';

class CorbadoException implements Exception {
  CorbadoException(this._message);

  final String _message;

  String toString() => _message;
}

/// Exception thrown when the user already exists
class UserAlreadyExistsException extends CorbadoException {
  /// Constructor
  UserAlreadyExistsException() : super('A user with this name already exists.');
}

/// Exception thrown when the user is unknown
class UnknownUserException implements Exception {
  /// Constructor
  UnknownUserException(this.message);

  /// The message
  final String message;
}

/// Exception thrown when the username (usually an email address) is invalid
class InvalidUsernameException extends CorbadoException {
  /// Constructor
  InvalidUsernameException()
      : super(
            'The username you entered is invalid. Please check it once again.');
}

/// Exception thrown when one of the required fields is empty
class RequiredFieldEmptyException extends CorbadoException {
  /// Constructor
  RequiredFieldEmptyException(String rawField)
      : field = CorbadoField.fromString(rawField),
        super('Required field "$rawField" can not be empty.');

  /// Field name
  final CorbadoField field;
}

/// Exception thrown when a field contains an invalid value
class FieldWithInvalidValueException extends CorbadoException {
  /// Constructor
  FieldWithInvalidValueException(String rawField)
      : field = CorbadoField.fromString(rawField),
        super(
            'Please check the field "$rawField", it contains an invalid value.');

  final CorbadoField field;
}

/// Exception thrown when the submitted OTP code is wrong
class InvalidOTPCodeException extends CorbadoException {
  /// Constructor
  InvalidOTPCodeException()
      : super('The 6-digit code is wrong. Please check it once again.');
}

/// Exception thrown when the submitted OTP code is wrong
class NoOTPChallengeStartedException extends CorbadoException {
  /// Constructor
  NoOTPChallengeStartedException()
      : super('No OTP challenge has been started yet.');
}

/// Exception thrown when the submitted OTP code is wrong
class InvalidPasskeyException extends CorbadoException {
  /// Constructor
  InvalidPasskeyException()
      : super(
            'The passkey you used has been deleted from your profile. Please enter your email and continue with manual login.');
}

/// Exception thrown when the user already has a passkey that is available
/// on the current device
class PasskeyAlreadyExistsException extends CorbadoException {
  /// Constructor
  PasskeyAlreadyExistsException()
      : super(
            'You have already set up a passkey that can be used on this device.');
}

/// Exception thrown when a user that has not yet confirmed his account wants
/// to use a passkey for login.
class ConditionalUiUnconfirmedCredential extends CorbadoException {
  /// Constructor
  ConditionalUiUnconfirmedCredential()
      : super(
            'You can only use passkeys after you have confirmed your account.');
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

        if (backendMessage.details == 'Email code not valid') {
          return InvalidOTPCodeException();
        }

        if (backendMessage.details == 'Used invalid credentials') {
          return InvalidPasskeyException();
        }

        return UnexpectedBackendException(operation, message);
      case 'client_error':
        if (backendMessage.details == 'Unconfirmed credential') {
          return ConditionalUiUnconfirmedCredential();
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
    // we only handle a single error (the first one)

    if (e.first.message == 'cannot be blank') {
      return RequiredFieldEmptyException(e.first.field);
    }

    if (e.first.message == 'Invalid / unreachable email address') {
      return FieldWithInvalidValueException('email');
    }

    switch (e.first.field) {
      case 'username':
        if (e.first.message == 'user already exists') {
          return UserAlreadyExistsException();
        }
      case 'email':
        break;
      case 'sessionToken':
        if (e.first.message == 'user already exists') {
          return PasskeyAlreadyExistsException();
        }
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

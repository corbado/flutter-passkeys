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

  final String message;
  final String operation;

  @override
  String toString() {
    return "UnexpectedBackendException: Error when calling backend with operation ${operation}, message: ${message}";
  }
}

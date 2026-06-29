import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

/// Thrown when the Firebase auth token provided to the backend is invalid.
class InvalidAuthTokenException implements Exception {}

/// Thrown when the backend returns an error that cannot be mapped to a
/// more specific exception.
class UnknownErrorException implements Exception {
  /// Creates an [UnknownErrorException] with a human readable [message].
  UnknownErrorException(this.message);

  /// Builds an [UnknownErrorException] from a [FirebaseFunctionsException],
  /// extracting its details as the message when possible.
  factory UnknownErrorException.fromFirebaseFunctionsException(
    FirebaseFunctionsException e,
  ) {
    var message = '';
    try {
      message = e.details as String;
    } catch (e) {
      debugPrint('UnknownErrorException: could not get details from exception');
    }
    return UnknownErrorException(message);
  }

  /// The error message describing what went wrong.
  final String message;
}

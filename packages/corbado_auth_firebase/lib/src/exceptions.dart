import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class InvalidAuthTokenException implements Exception {}

class UnknownErrorException implements Exception {
  UnknownErrorException(this.message);

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

  final String message;
}

import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

const identifierErrorMap = {
  'missing_identifier_type': {
    LoginIdentifierType.username: 'Please enter a username.',
    LoginIdentifierType.email: 'Please enter an email address.',
    LoginIdentifierType.phone: 'Please enter a phone number.',
  },
  'identifier_already_in_use': {
    LoginIdentifierType.username: 'This username is already taken. Please try another one or log in with this one.',
    LoginIdentifierType.email: 'This email address is already taken. Please try another one or log in with this one.',
    LoginIdentifierType.phone: 'This phone number is already taken. Please try another one or log in with this one',
  },
  'identifier_invalid_format': {
    LoginIdentifierType.username:
    'Username must be between 4 and 32 characters long and may only consist of alphanumeric characters and \"-\" or \"_\".',
    LoginIdentifierType.email: 'Please enter a valid email address.',
    LoginIdentifierType.phone: 'Please enter a valid phone number',
  }
};

const Map<String, String> errorMap = {
  'forbidden_request': 'This request is currently not allowed.',
  'too_many_requests': 'Too many requests. Please try again later.',
  'login_identifier_unknown_user': "Couldn't find your account.",
  'passkey_operation_cancelled': 'The operation was cancelled. Please try again.',
  'invalid_challenge_solution_email-otp': 'The code is invalid or expired',
  'missing_full_name': 'Please enter a valid name.',
  'unknown_error': 'Something went wrong. Please try again later.',
  'invalid_conditional_ui_login': 'The provided passkey is no longer valid. Please enter your identifier (e.g. email) manually.',

  // Temporary fix, we should identifierErrorMap for this
  'identifier_invalid_format': 'Please enter a valid email address.',
  'identifier_already_in_use': 'This email address is already taken. Please try another one or log in with this one.',
  'new_identifier_same_as_old': 'Please enter a new email address.',
};

class Translator {
  static String error(String code) {
    final out = errorMap[code];
    if (out == null) {
      return _missingTranslation(code);
    }

    return out;
  }

  static String errorWithIdentifier(String code, LoginIdentifierType identifierType) {
    final filteredByError = identifierErrorMap[code];
    if (filteredByError == null) {
      return _missingTranslation(code);
    }

    final out = filteredByError[identifierType];
    if (out == null) {
      return _missingTranslation(code);
    }

    return out;
  }

  static String _missingTranslation(String code) {
    return 'Missing translation for error code: $code';
  }
}

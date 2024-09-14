class Translator {
  static error(String? code) {
    if (code == null) return null;

    switch (code) {
      case 'user_not_found':
        return 'User does not exist. Please check your email address.';
      case 'required_field_empty':
        return 'Required field "Email address" can not be empty.';
      case 'invalid_passkey':
        return 'Invalid passkey. Please check your email address.';
      case 'no_passkey_for_device':
        return 'No passkey for device. Please check your email address.';
      case 'passkey_auth_cancelled':
        return 'Passkey authentication cancelled. Please check your email address.';
      default:
        return 'An unexpected error has happened. Please try again.';
    }
  }
}
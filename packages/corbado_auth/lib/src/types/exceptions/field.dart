/// Form fields
enum CorbadoField {
  /// username field
  name,

  /// email field
  email,

  /// OTP code field
  code;

  /// Creates a [CorbadoField] from its backend string representation.
  factory CorbadoField.fromString(String v) {
    switch (v) {
      case 'username':
        return CorbadoField.name;
      case 'email':
        return CorbadoField.email;
      case 'code':
        return CorbadoField.code;
      default:
        throw Exception(
          'Could not create CorbadoField because value $v is not known.',
        );
    }
  }
}

/// Convenience helpers for [CorbadoField].
extension CorbadoFieldFactory on CorbadoField {}

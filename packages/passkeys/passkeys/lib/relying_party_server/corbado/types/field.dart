/// Form fields
enum CorbadoField {
  /// username field
  name,

  /// email field
  email,

  code;

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
            'Could not create CorbadoField because value $v is not known.');
    }
  }
}

extension CorbadoFieldFactory on CorbadoField {}

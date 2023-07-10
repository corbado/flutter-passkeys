//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// Authentication methods
class AuthMethod {
  /// Instantiate a new enum with the provided [value].
  const AuthMethod._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const email = AuthMethod._(r'email');
  static const phoneNumber = AuthMethod._(r'phone_number');
  static const webauthn = AuthMethod._(r'webauthn');
  static const password = AuthMethod._(r'password');

  /// List of all possible values in this [enum][AuthMethod].
  static const values = <AuthMethod>[
    email,
    phoneNumber,
    webauthn,
    password,
  ];

  static AuthMethod? fromJson(dynamic value) => AuthMethodTypeTransformer().decode(value);

  static List<AuthMethod>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthMethod>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthMethod.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AuthMethod] to String,
/// and [decode] dynamic data back to [AuthMethod].
class AuthMethodTypeTransformer {
  factory AuthMethodTypeTransformer() => _instance ??= const AuthMethodTypeTransformer._();

  const AuthMethodTypeTransformer._();

  String encode(AuthMethod data) => data.value;

  /// Decodes a [dynamic value][data] to a AuthMethod.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AuthMethod? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email': return AuthMethod.email;
        case r'phone_number': return AuthMethod.phoneNumber;
        case r'webauthn': return AuthMethod.webauthn;
        case r'password': return AuthMethod.password;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AuthMethodTypeTransformer] instance.
  static AuthMethodTypeTransformer? _instance;
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginIdentifierType {
  /// Instantiate a new enum with the provided [value].
  const LoginIdentifierType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const email = LoginIdentifierType._(r'email');
  static const phone = LoginIdentifierType._(r'phone');
  static const username = LoginIdentifierType._(r'username');

  /// List of all possible values in this [enum][LoginIdentifierType].
  static const values = <LoginIdentifierType>[
    email,
    phone,
    username,
  ];

  static LoginIdentifierType? fromJson(dynamic value) =>
      LoginIdentifierTypeTypeTransformer().decode(value);

  static List<LoginIdentifierType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LoginIdentifierType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginIdentifierType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LoginIdentifierType] to String,
/// and [decode] dynamic data back to [LoginIdentifierType].
class LoginIdentifierTypeTypeTransformer {
  factory LoginIdentifierTypeTypeTransformer() =>
      _instance ??= const LoginIdentifierTypeTypeTransformer._();

  const LoginIdentifierTypeTypeTransformer._();

  String encode(LoginIdentifierType data) => data.value;

  /// Decodes a [dynamic value][data] to a LoginIdentifierType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LoginIdentifierType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email':
          return LoginIdentifierType.email;
        case r'phone':
          return LoginIdentifierType.phone;
        case r'username':
          return LoginIdentifierType.username;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [LoginIdentifierTypeTypeTransformer] instance.
  static LoginIdentifierTypeTypeTransformer? _instance;
}

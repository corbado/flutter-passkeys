//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasskeyIconSet {
  /// Instantiate a new enum with the provided [value].
  const PasskeyIconSet._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const default_ = PasskeyIconSet._(r'default');
  static const apple = PasskeyIconSet._(r'apple');
  static const android = PasskeyIconSet._(r'android');
  static const windows = PasskeyIconSet._(r'windows');

  /// List of all possible values in this [enum][PasskeyIconSet].
  static const values = <PasskeyIconSet>[
    default_,
    apple,
    android,
    windows,
  ];

  static PasskeyIconSet? fromJson(dynamic value) =>
      PasskeyIconSetTypeTransformer().decode(value);

  static List<PasskeyIconSet> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyIconSet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyIconSet.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyIconSet] to String,
/// and [decode] dynamic data back to [PasskeyIconSet].
class PasskeyIconSetTypeTransformer {
  factory PasskeyIconSetTypeTransformer() =>
      _instance ??= const PasskeyIconSetTypeTransformer._();

  const PasskeyIconSetTypeTransformer._();

  String encode(PasskeyIconSet data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyIconSet.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyIconSet? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'default':
          return PasskeyIconSet.default_;
        case r'apple':
          return PasskeyIconSet.apple;
        case r'android':
          return PasskeyIconSet.android;
        case r'windows':
          return PasskeyIconSet.windows;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyIconSetTypeTransformer] instance.
  static PasskeyIconSetTypeTransformer? _instance;
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SocialProviderType {
  /// Instantiate a new enum with the provided [value].
  const SocialProviderType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const google = SocialProviderType._(r'google');
  static const microsoft = SocialProviderType._(r'microsoft');
  static const github = SocialProviderType._(r'github');

  /// List of all possible values in this [enum][SocialProviderType].
  static const values = <SocialProviderType>[
    google,
    microsoft,
    github,
  ];

  static SocialProviderType? fromJson(dynamic value) =>
      SocialProviderTypeTypeTransformer().decode(value);

  static List<SocialProviderType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SocialProviderType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SocialProviderType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SocialProviderType] to String,
/// and [decode] dynamic data back to [SocialProviderType].
class SocialProviderTypeTypeTransformer {
  factory SocialProviderTypeTypeTransformer() =>
      _instance ??= const SocialProviderTypeTypeTransformer._();

  const SocialProviderTypeTypeTransformer._();

  String encode(SocialProviderType data) => data.value;

  /// Decodes a [dynamic value][data] to a SocialProviderType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SocialProviderType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'google':
          return SocialProviderType.google;
        case r'microsoft':
          return SocialProviderType.microsoft;
        case r'github':
          return SocialProviderType.github;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SocialProviderTypeTypeTransformer] instance.
  static SocialProviderTypeTypeTransformer? _instance;
}

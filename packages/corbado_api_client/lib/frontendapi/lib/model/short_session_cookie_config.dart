//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShortSessionCookieConfig {
  /// Returns a new [ShortSessionCookieConfig] instance.
  ShortSessionCookieConfig({
    required this.domain,
    required this.secure,
    required this.sameSite,
    required this.path,
    required this.lifetimeSeconds,
  });

  String domain;

  bool secure;

  ShortSessionCookieConfigSameSiteEnum sameSite;

  String path;

  int lifetimeSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortSessionCookieConfig &&
          other.domain == domain &&
          other.secure == secure &&
          other.sameSite == sameSite &&
          other.path == path &&
          other.lifetimeSeconds == lifetimeSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (domain.hashCode) +
      (secure.hashCode) +
      (sameSite.hashCode) +
      (path.hashCode) +
      (lifetimeSeconds.hashCode);

  @override
  String toString() =>
      'ShortSessionCookieConfig[domain=$domain, secure=$secure, sameSite=$sameSite, path=$path, lifetimeSeconds=$lifetimeSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'domain'] = this.domain;
    json[r'secure'] = this.secure;
    json[r'sameSite'] = this.sameSite;
    json[r'path'] = this.path;
    json[r'lifetimeSeconds'] = this.lifetimeSeconds;
    return json;
  }

  /// Returns a new [ShortSessionCookieConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShortSessionCookieConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ShortSessionCookieConfig[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ShortSessionCookieConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShortSessionCookieConfig(
        domain: mapValueOfType<String>(json, r'domain')!,
        secure: mapValueOfType<bool>(json, r'secure')!,
        sameSite:
            ShortSessionCookieConfigSameSiteEnum.fromJson(json[r'sameSite'])!,
        path: mapValueOfType<String>(json, r'path')!,
        lifetimeSeconds: mapValueOfType<int>(json, r'lifetimeSeconds')!,
      );
    }
    return null;
  }

  static List<ShortSessionCookieConfig> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ShortSessionCookieConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShortSessionCookieConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShortSessionCookieConfig> mapFromJson(dynamic json) {
    final map = <String, ShortSessionCookieConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShortSessionCookieConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShortSessionCookieConfig-objects as value to a dart map
  static Map<String, List<ShortSessionCookieConfig>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ShortSessionCookieConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShortSessionCookieConfig.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'domain',
    'secure',
    'sameSite',
    'path',
    'lifetimeSeconds',
  };
}

class ShortSessionCookieConfigSameSiteEnum {
  /// Instantiate a new enum with the provided [value].
  const ShortSessionCookieConfigSameSiteEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const lax = ShortSessionCookieConfigSameSiteEnum._(r'lax');
  static const strict = ShortSessionCookieConfigSameSiteEnum._(r'strict');
  static const none = ShortSessionCookieConfigSameSiteEnum._(r'none');

  /// List of all possible values in this [enum][ShortSessionCookieConfigSameSiteEnum].
  static const values = <ShortSessionCookieConfigSameSiteEnum>[
    lax,
    strict,
    none,
  ];

  static ShortSessionCookieConfigSameSiteEnum? fromJson(dynamic value) =>
      ShortSessionCookieConfigSameSiteEnumTypeTransformer().decode(value);

  static List<ShortSessionCookieConfigSameSiteEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ShortSessionCookieConfigSameSiteEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShortSessionCookieConfigSameSiteEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ShortSessionCookieConfigSameSiteEnum] to String,
/// and [decode] dynamic data back to [ShortSessionCookieConfigSameSiteEnum].
class ShortSessionCookieConfigSameSiteEnumTypeTransformer {
  factory ShortSessionCookieConfigSameSiteEnumTypeTransformer() => _instance ??=
      const ShortSessionCookieConfigSameSiteEnumTypeTransformer._();

  const ShortSessionCookieConfigSameSiteEnumTypeTransformer._();

  String encode(ShortSessionCookieConfigSameSiteEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ShortSessionCookieConfigSameSiteEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ShortSessionCookieConfigSameSiteEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'lax':
          return ShortSessionCookieConfigSameSiteEnum.lax;
        case r'strict':
          return ShortSessionCookieConfigSameSiteEnum.strict;
        case r'none':
          return ShortSessionCookieConfigSameSiteEnum.none;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ShortSessionCookieConfigSameSiteEnumTypeTransformer] instance.
  static ShortSessionCookieConfigSameSiteEnumTypeTransformer? _instance;
}

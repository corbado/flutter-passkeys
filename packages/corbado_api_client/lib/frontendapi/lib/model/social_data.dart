//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SocialData {
  /// Returns a new [SocialData] instance.
  SocialData({
    this.providers = const [],
    required this.status,
    this.oauthUrl,
    this.error,
  });

  List<SocialProviderType> providers;

  SocialDataStatusEnum status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oauthUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialData &&
          _deepEquality.equals(other.providers, providers) &&
          other.status == status &&
          other.oauthUrl == oauthUrl &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (providers.hashCode) +
      (status.hashCode) +
      (oauthUrl == null ? 0 : oauthUrl!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'SocialData[providers=$providers, status=$status, oauthUrl=$oauthUrl, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'providers'] = this.providers;
    json[r'status'] = this.status;
    if (this.oauthUrl != null) {
      json[r'oauthUrl'] = this.oauthUrl;
    } else {
      json[r'oauthUrl'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [SocialData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SocialData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SocialData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SocialData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SocialData(
        providers: SocialProviderType.listFromJson(json[r'providers']),
        status: SocialDataStatusEnum.fromJson(json[r'status'])!,
        oauthUrl: mapValueOfType<String>(json, r'oauthUrl'),
        error: RequestError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<SocialData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SocialData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SocialData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SocialData> mapFromJson(dynamic json) {
    final map = <String, SocialData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SocialData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SocialData-objects as value to a dart map
  static Map<String, List<SocialData>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SocialData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SocialData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'providers',
    'status',
  };
}

class SocialDataStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SocialDataStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const initial = SocialDataStatusEnum._(r'initial');
  static const started = SocialDataStatusEnum._(r'started');
  static const finished = SocialDataStatusEnum._(r'finished');

  /// List of all possible values in this [enum][SocialDataStatusEnum].
  static const values = <SocialDataStatusEnum>[
    initial,
    started,
    finished,
  ];

  static SocialDataStatusEnum? fromJson(dynamic value) =>
      SocialDataStatusEnumTypeTransformer().decode(value);

  static List<SocialDataStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SocialDataStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SocialDataStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SocialDataStatusEnum] to String,
/// and [decode] dynamic data back to [SocialDataStatusEnum].
class SocialDataStatusEnumTypeTransformer {
  factory SocialDataStatusEnumTypeTransformer() =>
      _instance ??= const SocialDataStatusEnumTypeTransformer._();

  const SocialDataStatusEnumTypeTransformer._();

  String encode(SocialDataStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SocialDataStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SocialDataStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'initial':
          return SocialDataStatusEnum.initial;
        case r'started':
          return SocialDataStatusEnum.started;
        case r'finished':
          return SocialDataStatusEnum.finished;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SocialDataStatusEnumTypeTransformer] instance.
  static SocialDataStatusEnumTypeTransformer? _instance;
}

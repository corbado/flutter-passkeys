//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectAppendStartRsp {
  /// Returns a new [ConnectAppendStartRsp] instance.
  ConnectAppendStartRsp({
    required this.attestationOptions,
    required this.variant,
  });

  String attestationOptions;

  ConnectAppendStartRspVariantEnum variant;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectAppendStartRsp &&
          other.attestationOptions == attestationOptions &&
          other.variant == variant;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (attestationOptions.hashCode) + (variant.hashCode);

  @override
  String toString() =>
      'ConnectAppendStartRsp[attestationOptions=$attestationOptions, variant=$variant]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'attestationOptions'] = this.attestationOptions;
    json[r'variant'] = this.variant;
    return json;
  }

  /// Returns a new [ConnectAppendStartRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectAppendStartRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectAppendStartRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectAppendStartRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectAppendStartRsp(
        attestationOptions:
            mapValueOfType<String>(json, r'attestationOptions')!,
        variant: ConnectAppendStartRspVariantEnum.fromJson(json[r'variant'])!,
      );
    }
    return null;
  }

  static List<ConnectAppendStartRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectAppendStartRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectAppendStartRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectAppendStartRsp> mapFromJson(dynamic json) {
    final map = <String, ConnectAppendStartRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectAppendStartRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectAppendStartRsp-objects as value to a dart map
  static Map<String, List<ConnectAppendStartRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectAppendStartRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectAppendStartRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'attestationOptions',
    'variant',
  };
}

class ConnectAppendStartRspVariantEnum {
  /// Instantiate a new enum with the provided [value].
  const ConnectAppendStartRspVariantEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const default_ = ConnectAppendStartRspVariantEnum._(r'default');
  static const afterHybrid =
      ConnectAppendStartRspVariantEnum._(r'after-hybrid');
  static const afterError = ConnectAppendStartRspVariantEnum._(r'after-error');

  /// List of all possible values in this [enum][ConnectAppendStartRspVariantEnum].
  static const values = <ConnectAppendStartRspVariantEnum>[
    default_,
    afterHybrid,
    afterError,
  ];

  static ConnectAppendStartRspVariantEnum? fromJson(dynamic value) =>
      ConnectAppendStartRspVariantEnumTypeTransformer().decode(value);

  static List<ConnectAppendStartRspVariantEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectAppendStartRspVariantEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectAppendStartRspVariantEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConnectAppendStartRspVariantEnum] to String,
/// and [decode] dynamic data back to [ConnectAppendStartRspVariantEnum].
class ConnectAppendStartRspVariantEnumTypeTransformer {
  factory ConnectAppendStartRspVariantEnumTypeTransformer() =>
      _instance ??= const ConnectAppendStartRspVariantEnumTypeTransformer._();

  const ConnectAppendStartRspVariantEnumTypeTransformer._();

  String encode(ConnectAppendStartRspVariantEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ConnectAppendStartRspVariantEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConnectAppendStartRspVariantEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'default':
          return ConnectAppendStartRspVariantEnum.default_;
        case r'after-hybrid':
          return ConnectAppendStartRspVariantEnum.afterHybrid;
        case r'after-error':
          return ConnectAppendStartRspVariantEnum.afterError;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ConnectAppendStartRspVariantEnumTypeTransformer] instance.
  static ConnectAppendStartRspVariantEnumTypeTransformer? _instance;
}

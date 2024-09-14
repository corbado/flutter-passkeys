//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectLoginStartReq {
  /// Returns a new [ConnectLoginStartReq] instance.
  ConnectLoginStartReq({
    required this.identifier,
    required this.source_,
    required this.loadedMs,
  });

  String identifier;

  ConnectLoginStartReqSource_Enum source_;

  int loadedMs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectLoginStartReq &&
          other.identifier == identifier &&
          other.source_ == source_ &&
          other.loadedMs == loadedMs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifier.hashCode) + (source_.hashCode) + (loadedMs.hashCode);

  @override
  String toString() =>
      'ConnectLoginStartReq[identifier=$identifier, source_=$source_, loadedMs=$loadedMs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifier'] = this.identifier;
    json[r'source'] = this.source_;
    json[r'loadedMs'] = this.loadedMs;
    return json;
  }

  /// Returns a new [ConnectLoginStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectLoginStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectLoginStartReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectLoginStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectLoginStartReq(
        identifier: mapValueOfType<String>(json, r'identifier')!,
        source_: ConnectLoginStartReqSource_Enum.fromJson(json[r'source'])!,
        loadedMs: mapValueOfType<int>(json, r'loadedMs')!,
      );
    }
    return null;
  }

  static List<ConnectLoginStartReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectLoginStartReq> mapFromJson(dynamic json) {
    final map = <String, ConnectLoginStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectLoginStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectLoginStartReq-objects as value to a dart map
  static Map<String, List<ConnectLoginStartReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectLoginStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectLoginStartReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifier',
    'source',
    'loadedMs',
  };
}

class ConnectLoginStartReqSource_Enum {
  /// Instantiate a new enum with the provided [value].
  const ConnectLoginStartReqSource_Enum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oneTap = ConnectLoginStartReqSource_Enum._(r'one-tap');
  static const textField = ConnectLoginStartReqSource_Enum._(r'text-field');
  static const errorSoft = ConnectLoginStartReqSource_Enum._(r'error-soft');
  static const errorHard = ConnectLoginStartReqSource_Enum._(r'error-hard');

  /// List of all possible values in this [enum][ConnectLoginStartReqSource_Enum].
  static const values = <ConnectLoginStartReqSource_Enum>[
    oneTap,
    textField,
    errorSoft,
    errorHard,
  ];

  static ConnectLoginStartReqSource_Enum? fromJson(dynamic value) =>
      ConnectLoginStartReqSource_EnumTypeTransformer().decode(value);

  static List<ConnectLoginStartReqSource_Enum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginStartReqSource_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginStartReqSource_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConnectLoginStartReqSource_Enum] to String,
/// and [decode] dynamic data back to [ConnectLoginStartReqSource_Enum].
class ConnectLoginStartReqSource_EnumTypeTransformer {
  factory ConnectLoginStartReqSource_EnumTypeTransformer() =>
      _instance ??= const ConnectLoginStartReqSource_EnumTypeTransformer._();

  const ConnectLoginStartReqSource_EnumTypeTransformer._();

  String encode(ConnectLoginStartReqSource_Enum data) => data.value;

  /// Decodes a [dynamic value][data] to a ConnectLoginStartReqSource_Enum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConnectLoginStartReqSource_Enum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'one-tap':
          return ConnectLoginStartReqSource_Enum.oneTap;
        case r'text-field':
          return ConnectLoginStartReqSource_Enum.textField;
        case r'error-soft':
          return ConnectLoginStartReqSource_Enum.errorSoft;
        case r'error-hard':
          return ConnectLoginStartReqSource_Enum.errorHard;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ConnectLoginStartReqSource_EnumTypeTransformer] instance.
  static ConnectLoginStartReqSource_EnumTypeTransformer? _instance;
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContinueOnOtherDevice {
  /// Returns a new [ContinueOnOtherDevice] instance.
  ContinueOnOtherDevice({
    required this.reason,
  });

  ContinueOnOtherDeviceReasonEnum reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContinueOnOtherDevice && other.reason == reason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (reason.hashCode);

  @override
  String toString() => 'ContinueOnOtherDevice[reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'reason'] = this.reason;
    return json;
  }

  /// Returns a new [ContinueOnOtherDevice] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContinueOnOtherDevice? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ContinueOnOtherDevice[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ContinueOnOtherDevice[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContinueOnOtherDevice(
        reason: ContinueOnOtherDeviceReasonEnum.fromJson(json[r'reason'])!,
      );
    }
    return null;
  }

  static List<ContinueOnOtherDevice> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ContinueOnOtherDevice>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContinueOnOtherDevice.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContinueOnOtherDevice> mapFromJson(dynamic json) {
    final map = <String, ContinueOnOtherDevice>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContinueOnOtherDevice.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContinueOnOtherDevice-objects as value to a dart map
  static Map<String, List<ContinueOnOtherDevice>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ContinueOnOtherDevice>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContinueOnOtherDevice.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'reason',
  };
}

class ContinueOnOtherDeviceReasonEnum {
  /// Instantiate a new enum with the provided [value].
  const ContinueOnOtherDeviceReasonEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailLinkVerified =
      ContinueOnOtherDeviceReasonEnum._(r'email-link-verified');
  static const processAlreadyCompleted =
      ContinueOnOtherDeviceReasonEnum._(r'process-already-completed');

  /// List of all possible values in this [enum][ContinueOnOtherDeviceReasonEnum].
  static const values = <ContinueOnOtherDeviceReasonEnum>[
    emailLinkVerified,
    processAlreadyCompleted,
  ];

  static ContinueOnOtherDeviceReasonEnum? fromJson(dynamic value) =>
      ContinueOnOtherDeviceReasonEnumTypeTransformer().decode(value);

  static List<ContinueOnOtherDeviceReasonEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ContinueOnOtherDeviceReasonEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContinueOnOtherDeviceReasonEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ContinueOnOtherDeviceReasonEnum] to String,
/// and [decode] dynamic data back to [ContinueOnOtherDeviceReasonEnum].
class ContinueOnOtherDeviceReasonEnumTypeTransformer {
  factory ContinueOnOtherDeviceReasonEnumTypeTransformer() =>
      _instance ??= const ContinueOnOtherDeviceReasonEnumTypeTransformer._();

  const ContinueOnOtherDeviceReasonEnumTypeTransformer._();

  String encode(ContinueOnOtherDeviceReasonEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ContinueOnOtherDeviceReasonEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ContinueOnOtherDeviceReasonEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email-link-verified':
          return ContinueOnOtherDeviceReasonEnum.emailLinkVerified;
        case r'process-already-completed':
          return ContinueOnOtherDeviceReasonEnum.processAlreadyCompleted;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ContinueOnOtherDeviceReasonEnumTypeTransformer] instance.
  static ContinueOnOtherDeviceReasonEnumTypeTransformer? _instance;
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MePasskeysAppendStartRsp {
  /// Returns a new [MePasskeysAppendStartRsp] instance.
  MePasskeysAppendStartRsp({
    required this.attestationOptions,
    this.newClientEnvHandle,
    this.appendNotAllowedReason,
  });

  String attestationOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newClientEnvHandle;

  MePasskeysAppendStartRspAppendNotAllowedReasonEnum? appendNotAllowedReason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MePasskeysAppendStartRsp &&
          other.attestationOptions == attestationOptions &&
          other.newClientEnvHandle == newClientEnvHandle &&
          other.appendNotAllowedReason == appendNotAllowedReason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (attestationOptions.hashCode) +
      (newClientEnvHandle == null ? 0 : newClientEnvHandle!.hashCode) +
      (appendNotAllowedReason == null ? 0 : appendNotAllowedReason!.hashCode);

  @override
  String toString() =>
      'MePasskeysAppendStartRsp[attestationOptions=$attestationOptions, newClientEnvHandle=$newClientEnvHandle, appendNotAllowedReason=$appendNotAllowedReason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'attestationOptions'] = this.attestationOptions;
    if (this.newClientEnvHandle != null) {
      json[r'newClientEnvHandle'] = this.newClientEnvHandle;
    } else {
      json[r'newClientEnvHandle'] = null;
    }
    if (this.appendNotAllowedReason != null) {
      json[r'appendNotAllowedReason'] = this.appendNotAllowedReason;
    } else {
      json[r'appendNotAllowedReason'] = null;
    }
    return json;
  }

  /// Returns a new [MePasskeysAppendStartRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MePasskeysAppendStartRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MePasskeysAppendStartRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MePasskeysAppendStartRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MePasskeysAppendStartRsp(
        attestationOptions:
            mapValueOfType<String>(json, r'attestationOptions')!,
        newClientEnvHandle: mapValueOfType<String>(json, r'newClientEnvHandle'),
        appendNotAllowedReason:
            MePasskeysAppendStartRspAppendNotAllowedReasonEnum.fromJson(
                json[r'appendNotAllowedReason']),
      );
    }
    return null;
  }

  static List<MePasskeysAppendStartRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MePasskeysAppendStartRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MePasskeysAppendStartRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MePasskeysAppendStartRsp> mapFromJson(dynamic json) {
    final map = <String, MePasskeysAppendStartRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MePasskeysAppendStartRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MePasskeysAppendStartRsp-objects as value to a dart map
  static Map<String, List<MePasskeysAppendStartRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MePasskeysAppendStartRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MePasskeysAppendStartRsp.listFromJson(
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
  };
}

class MePasskeysAppendStartRspAppendNotAllowedReasonEnum {
  /// Instantiate a new enum with the provided [value].
  const MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passkeyAlreadyExists =
      MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(
          r'passkey_already_exists');
  static const passkeysNotSupported =
      MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(
          r'passkeys_not_supported');

  /// List of all possible values in this [enum][MePasskeysAppendStartRspAppendNotAllowedReasonEnum].
  static const values = <MePasskeysAppendStartRspAppendNotAllowedReasonEnum>[
    passkeyAlreadyExists,
    passkeysNotSupported,
  ];

  static MePasskeysAppendStartRspAppendNotAllowedReasonEnum? fromJson(
          dynamic value) =>
      MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer()
          .decode(value);

  static List<MePasskeysAppendStartRspAppendNotAllowedReasonEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MePasskeysAppendStartRspAppendNotAllowedReasonEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            MePasskeysAppendStartRspAppendNotAllowedReasonEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MePasskeysAppendStartRspAppendNotAllowedReasonEnum] to String,
/// and [decode] dynamic data back to [MePasskeysAppendStartRspAppendNotAllowedReasonEnum].
class MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer {
  factory MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer() =>
      _instance ??=
          const MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer
              ._();

  const MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer._();

  String encode(MePasskeysAppendStartRspAppendNotAllowedReasonEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a MePasskeysAppendStartRspAppendNotAllowedReasonEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MePasskeysAppendStartRspAppendNotAllowedReasonEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'passkey_already_exists':
          return MePasskeysAppendStartRspAppendNotAllowedReasonEnum
              .passkeyAlreadyExists;
        case r'passkeys_not_supported':
          return MePasskeysAppendStartRspAppendNotAllowedReasonEnum
              .passkeysNotSupported;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer] instance.
  static MePasskeysAppendStartRspAppendNotAllowedReasonEnumTypeTransformer?
      _instance;
}

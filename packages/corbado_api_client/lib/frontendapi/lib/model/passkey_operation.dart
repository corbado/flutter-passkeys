//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasskeyOperation {
  /// Returns a new [PasskeyOperation] instance.
  PasskeyOperation({
    required this.operationType,
    required this.identifierValue,
    required this.identifierType,
    required this.ceremonyType,
  });

  PasskeyOperationOperationTypeEnum operationType;

  String identifierValue;

  LoginIdentifierType identifierType;

  PasskeyOperationCeremonyTypeEnum ceremonyType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasskeyOperation &&
          other.operationType == operationType &&
          other.identifierValue == identifierValue &&
          other.identifierType == identifierType &&
          other.ceremonyType == ceremonyType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (operationType.hashCode) +
      (identifierValue.hashCode) +
      (identifierType.hashCode) +
      (ceremonyType.hashCode);

  @override
  String toString() =>
      'PasskeyOperation[operationType=$operationType, identifierValue=$identifierValue, identifierType=$identifierType, ceremonyType=$ceremonyType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'operationType'] = this.operationType;
    json[r'identifierValue'] = this.identifierValue;
    json[r'identifierType'] = this.identifierType;
    json[r'ceremonyType'] = this.ceremonyType;
    return json;
  }

  /// Returns a new [PasskeyOperation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PasskeyOperation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PasskeyOperation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PasskeyOperation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PasskeyOperation(
        operationType:
            PasskeyOperationOperationTypeEnum.fromJson(json[r'operationType'])!,
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        ceremonyType:
            PasskeyOperationCeremonyTypeEnum.fromJson(json[r'ceremonyType'])!,
      );
    }
    return null;
  }

  static List<PasskeyOperation> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyOperation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyOperation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PasskeyOperation> mapFromJson(dynamic json) {
    final map = <String, PasskeyOperation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasskeyOperation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PasskeyOperation-objects as value to a dart map
  static Map<String, List<PasskeyOperation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PasskeyOperation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PasskeyOperation.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'operationType',
    'identifierValue',
    'identifierType',
    'ceremonyType',
  };
}

class PasskeyOperationOperationTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyOperationOperationTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const append = PasskeyOperationOperationTypeEnum._(r'append');
  static const verify = PasskeyOperationOperationTypeEnum._(r'verify');

  /// List of all possible values in this [enum][PasskeyOperationOperationTypeEnum].
  static const values = <PasskeyOperationOperationTypeEnum>[
    append,
    verify,
  ];

  static PasskeyOperationOperationTypeEnum? fromJson(dynamic value) =>
      PasskeyOperationOperationTypeEnumTypeTransformer().decode(value);

  static List<PasskeyOperationOperationTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyOperationOperationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyOperationOperationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyOperationOperationTypeEnum] to String,
/// and [decode] dynamic data back to [PasskeyOperationOperationTypeEnum].
class PasskeyOperationOperationTypeEnumTypeTransformer {
  factory PasskeyOperationOperationTypeEnumTypeTransformer() =>
      _instance ??= const PasskeyOperationOperationTypeEnumTypeTransformer._();

  const PasskeyOperationOperationTypeEnumTypeTransformer._();

  String encode(PasskeyOperationOperationTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyOperationOperationTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyOperationOperationTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'append':
          return PasskeyOperationOperationTypeEnum.append;
        case r'verify':
          return PasskeyOperationOperationTypeEnum.verify;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyOperationOperationTypeEnumTypeTransformer] instance.
  static PasskeyOperationOperationTypeEnumTypeTransformer? _instance;
}

class PasskeyOperationCeremonyTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyOperationCeremonyTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const local = PasskeyOperationCeremonyTypeEnum._(r'local');
  static const cda = PasskeyOperationCeremonyTypeEnum._(r'cda');
  static const securityKey =
      PasskeyOperationCeremonyTypeEnum._(r'security-key');

  /// List of all possible values in this [enum][PasskeyOperationCeremonyTypeEnum].
  static const values = <PasskeyOperationCeremonyTypeEnum>[
    local,
    cda,
    securityKey,
  ];

  static PasskeyOperationCeremonyTypeEnum? fromJson(dynamic value) =>
      PasskeyOperationCeremonyTypeEnumTypeTransformer().decode(value);

  static List<PasskeyOperationCeremonyTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyOperationCeremonyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyOperationCeremonyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyOperationCeremonyTypeEnum] to String,
/// and [decode] dynamic data back to [PasskeyOperationCeremonyTypeEnum].
class PasskeyOperationCeremonyTypeEnumTypeTransformer {
  factory PasskeyOperationCeremonyTypeEnumTypeTransformer() =>
      _instance ??= const PasskeyOperationCeremonyTypeEnumTypeTransformer._();

  const PasskeyOperationCeremonyTypeEnumTypeTransformer._();

  String encode(PasskeyOperationCeremonyTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyOperationCeremonyTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyOperationCeremonyTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'local':
          return PasskeyOperationCeremonyTypeEnum.local;
        case r'cda':
          return PasskeyOperationCeremonyTypeEnum.cda;
        case r'security-key':
          return PasskeyOperationCeremonyTypeEnum.securityKey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyOperationCeremonyTypeEnumTypeTransformer] instance.
  static PasskeyOperationCeremonyTypeEnumTypeTransformer? _instance;
}

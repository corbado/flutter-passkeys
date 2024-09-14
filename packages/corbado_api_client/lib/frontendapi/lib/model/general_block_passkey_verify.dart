//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneralBlockPasskeyVerify {
  /// Returns a new [GeneralBlockPasskeyVerify] instance.
  GeneralBlockPasskeyVerify({
    required this.challenge,
    required this.identifierValue,
    this.loginHint,
  });

  String challenge;

  String identifierValue;

  GeneralBlockPasskeyVerifyLoginHintEnum? loginHint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralBlockPasskeyVerify &&
          other.challenge == challenge &&
          other.identifierValue == identifierValue &&
          other.loginHint == loginHint;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (challenge.hashCode) +
      (identifierValue.hashCode) +
      (loginHint == null ? 0 : loginHint!.hashCode);

  @override
  String toString() =>
      'GeneralBlockPasskeyVerify[challenge=$challenge, identifierValue=$identifierValue, loginHint=$loginHint]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'challenge'] = this.challenge;
    json[r'identifierValue'] = this.identifierValue;
    if (this.loginHint != null) {
      json[r'loginHint'] = this.loginHint;
    } else {
      json[r'loginHint'] = null;
    }
    return json;
  }

  /// Returns a new [GeneralBlockPasskeyVerify] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneralBlockPasskeyVerify? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneralBlockPasskeyVerify[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneralBlockPasskeyVerify[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneralBlockPasskeyVerify(
        challenge: mapValueOfType<String>(json, r'challenge')!,
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        loginHint:
            GeneralBlockPasskeyVerifyLoginHintEnum.fromJson(json[r'loginHint']),
      );
    }
    return null;
  }

  static List<GeneralBlockPasskeyVerify> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockPasskeyVerify>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockPasskeyVerify.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneralBlockPasskeyVerify> mapFromJson(dynamic json) {
    final map = <String, GeneralBlockPasskeyVerify>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneralBlockPasskeyVerify.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneralBlockPasskeyVerify-objects as value to a dart map
  static Map<String, List<GeneralBlockPasskeyVerify>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneralBlockPasskeyVerify>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneralBlockPasskeyVerify.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'challenge',
    'identifierValue',
  };
}

class GeneralBlockPasskeyVerifyLoginHintEnum {
  /// Instantiate a new enum with the provided [value].
  const GeneralBlockPasskeyVerifyLoginHintEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const cda = GeneralBlockPasskeyVerifyLoginHintEnum._(r'cda');

  /// List of all possible values in this [enum][GeneralBlockPasskeyVerifyLoginHintEnum].
  static const values = <GeneralBlockPasskeyVerifyLoginHintEnum>[
    cda,
  ];

  static GeneralBlockPasskeyVerifyLoginHintEnum? fromJson(dynamic value) =>
      GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer().decode(value);

  static List<GeneralBlockPasskeyVerifyLoginHintEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockPasskeyVerifyLoginHintEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockPasskeyVerifyLoginHintEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GeneralBlockPasskeyVerifyLoginHintEnum] to String,
/// and [decode] dynamic data back to [GeneralBlockPasskeyVerifyLoginHintEnum].
class GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer {
  factory GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer() =>
      _instance ??=
          const GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer._();

  const GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer._();

  String encode(GeneralBlockPasskeyVerifyLoginHintEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a GeneralBlockPasskeyVerifyLoginHintEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GeneralBlockPasskeyVerifyLoginHintEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'cda':
          return GeneralBlockPasskeyVerifyLoginHintEnum.cda;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer] instance.
  static GeneralBlockPasskeyVerifyLoginHintEnumTypeTransformer? _instance;
}

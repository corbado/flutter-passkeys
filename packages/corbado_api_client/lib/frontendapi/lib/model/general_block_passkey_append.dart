//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneralBlockPasskeyAppend {
  /// Returns a new [GeneralBlockPasskeyAppend] instance.
  GeneralBlockPasskeyAppend({
    required this.challenge,
    required this.identifierValue,
    required this.identifierType,
    required this.autoSubmit,
    required this.passkeyIconSet,
    required this.variant,
  });

  String challenge;

  String identifierValue;

  LoginIdentifierType identifierType;

  bool autoSubmit;

  PasskeyIconSet passkeyIconSet;

  GeneralBlockPasskeyAppendVariantEnum variant;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralBlockPasskeyAppend &&
          other.challenge == challenge &&
          other.identifierValue == identifierValue &&
          other.identifierType == identifierType &&
          other.autoSubmit == autoSubmit &&
          other.passkeyIconSet == passkeyIconSet &&
          other.variant == variant;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (challenge.hashCode) +
      (identifierValue.hashCode) +
      (identifierType.hashCode) +
      (autoSubmit.hashCode) +
      (passkeyIconSet.hashCode) +
      (variant.hashCode);

  @override
  String toString() =>
      'GeneralBlockPasskeyAppend[challenge=$challenge, identifierValue=$identifierValue, identifierType=$identifierType, autoSubmit=$autoSubmit, passkeyIconSet=$passkeyIconSet, variant=$variant]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'challenge'] = this.challenge;
    json[r'identifierValue'] = this.identifierValue;
    json[r'identifierType'] = this.identifierType;
    json[r'autoSubmit'] = this.autoSubmit;
    json[r'passkeyIconSet'] = this.passkeyIconSet;
    json[r'variant'] = this.variant;
    return json;
  }

  /// Returns a new [GeneralBlockPasskeyAppend] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneralBlockPasskeyAppend? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneralBlockPasskeyAppend[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneralBlockPasskeyAppend[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneralBlockPasskeyAppend(
        challenge: mapValueOfType<String>(json, r'challenge')!,
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        autoSubmit: mapValueOfType<bool>(json, r'autoSubmit')!,
        passkeyIconSet: PasskeyIconSet.fromJson(json[r'passkeyIconSet'])!,
        variant:
            GeneralBlockPasskeyAppendVariantEnum.fromJson(json[r'variant'])!,
      );
    }
    return null;
  }

  static List<GeneralBlockPasskeyAppend> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockPasskeyAppend>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockPasskeyAppend.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneralBlockPasskeyAppend> mapFromJson(dynamic json) {
    final map = <String, GeneralBlockPasskeyAppend>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneralBlockPasskeyAppend.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneralBlockPasskeyAppend-objects as value to a dart map
  static Map<String, List<GeneralBlockPasskeyAppend>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneralBlockPasskeyAppend>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneralBlockPasskeyAppend.listFromJson(
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
    'identifierType',
    'autoSubmit',
    'passkeyIconSet',
    'variant',
  };
}

class GeneralBlockPasskeyAppendVariantEnum {
  /// Instantiate a new enum with the provided [value].
  const GeneralBlockPasskeyAppendVariantEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const default_ = GeneralBlockPasskeyAppendVariantEnum._(r'default');
  static const afterHybrid =
      GeneralBlockPasskeyAppendVariantEnum._(r'after-hybrid');
  static const afterError =
      GeneralBlockPasskeyAppendVariantEnum._(r'after-error');

  /// List of all possible values in this [enum][GeneralBlockPasskeyAppendVariantEnum].
  static const values = <GeneralBlockPasskeyAppendVariantEnum>[
    default_,
    afterHybrid,
    afterError,
  ];

  static GeneralBlockPasskeyAppendVariantEnum? fromJson(dynamic value) =>
      GeneralBlockPasskeyAppendVariantEnumTypeTransformer().decode(value);

  static List<GeneralBlockPasskeyAppendVariantEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockPasskeyAppendVariantEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockPasskeyAppendVariantEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GeneralBlockPasskeyAppendVariantEnum] to String,
/// and [decode] dynamic data back to [GeneralBlockPasskeyAppendVariantEnum].
class GeneralBlockPasskeyAppendVariantEnumTypeTransformer {
  factory GeneralBlockPasskeyAppendVariantEnumTypeTransformer() => _instance ??=
      const GeneralBlockPasskeyAppendVariantEnumTypeTransformer._();

  const GeneralBlockPasskeyAppendVariantEnumTypeTransformer._();

  String encode(GeneralBlockPasskeyAppendVariantEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a GeneralBlockPasskeyAppendVariantEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GeneralBlockPasskeyAppendVariantEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'default':
          return GeneralBlockPasskeyAppendVariantEnum.default_;
        case r'after-hybrid':
          return GeneralBlockPasskeyAppendVariantEnum.afterHybrid;
        case r'after-error':
          return GeneralBlockPasskeyAppendVariantEnum.afterError;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [GeneralBlockPasskeyAppendVariantEnumTypeTransformer] instance.
  static GeneralBlockPasskeyAppendVariantEnumTypeTransformer? _instance;
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneralBlockLoginInit {
  /// Returns a new [GeneralBlockLoginInit] instance.
  GeneralBlockLoginInit({
    required this.identifierValue,
    required this.isPhone,
    required this.isPhoneAvailable,
    required this.isEmailAvailable,
    required this.isUsernameAvailable,
    required this.socialData,
    this.conditionalUIChallenge,
    this.fieldError,
    this.error,
  });

  String identifierValue;

  bool isPhone;

  bool isPhoneAvailable;

  bool isEmailAvailable;

  bool isUsernameAvailable;

  SocialData socialData;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? conditionalUIChallenge;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? fieldError;

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
      other is GeneralBlockLoginInit &&
          other.identifierValue == identifierValue &&
          other.isPhone == isPhone &&
          other.isPhoneAvailable == isPhoneAvailable &&
          other.isEmailAvailable == isEmailAvailable &&
          other.isUsernameAvailable == isUsernameAvailable &&
          other.socialData == socialData &&
          other.conditionalUIChallenge == conditionalUIChallenge &&
          other.fieldError == fieldError &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifierValue.hashCode) +
      (isPhone.hashCode) +
      (isPhoneAvailable.hashCode) +
      (isEmailAvailable.hashCode) +
      (isUsernameAvailable.hashCode) +
      (socialData.hashCode) +
      (conditionalUIChallenge == null ? 0 : conditionalUIChallenge!.hashCode) +
      (fieldError == null ? 0 : fieldError!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'GeneralBlockLoginInit[identifierValue=$identifierValue, isPhone=$isPhone, isPhoneAvailable=$isPhoneAvailable, isEmailAvailable=$isEmailAvailable, isUsernameAvailable=$isUsernameAvailable, socialData=$socialData, conditionalUIChallenge=$conditionalUIChallenge, fieldError=$fieldError, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifierValue'] = this.identifierValue;
    json[r'isPhone'] = this.isPhone;
    json[r'isPhoneAvailable'] = this.isPhoneAvailable;
    json[r'isEmailAvailable'] = this.isEmailAvailable;
    json[r'isUsernameAvailable'] = this.isUsernameAvailable;
    json[r'socialData'] = this.socialData;
    if (this.conditionalUIChallenge != null) {
      json[r'conditionalUIChallenge'] = this.conditionalUIChallenge;
    } else {
      json[r'conditionalUIChallenge'] = null;
    }
    if (this.fieldError != null) {
      json[r'fieldError'] = this.fieldError;
    } else {
      json[r'fieldError'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [GeneralBlockLoginInit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneralBlockLoginInit? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneralBlockLoginInit[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneralBlockLoginInit[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneralBlockLoginInit(
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        isPhone: mapValueOfType<bool>(json, r'isPhone')!,
        isPhoneAvailable: mapValueOfType<bool>(json, r'isPhoneAvailable')!,
        isEmailAvailable: mapValueOfType<bool>(json, r'isEmailAvailable')!,
        isUsernameAvailable:
            mapValueOfType<bool>(json, r'isUsernameAvailable')!,
        socialData: SocialData.fromJson(json[r'socialData'])!,
        conditionalUIChallenge:
            mapValueOfType<String>(json, r'conditionalUIChallenge'),
        fieldError: RequestError.fromJson(json[r'fieldError']),
        error: RequestError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<GeneralBlockLoginInit> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockLoginInit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockLoginInit.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneralBlockLoginInit> mapFromJson(dynamic json) {
    final map = <String, GeneralBlockLoginInit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneralBlockLoginInit.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneralBlockLoginInit-objects as value to a dart map
  static Map<String, List<GeneralBlockLoginInit>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneralBlockLoginInit>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneralBlockLoginInit.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifierValue',
    'isPhone',
    'isPhoneAvailable',
    'isEmailAvailable',
    'isUsernameAvailable',
    'socialData',
  };
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneralBlockSignupInit {
  /// Returns a new [GeneralBlockSignupInit] instance.
  GeneralBlockSignupInit({
    this.identifiers = const [],
    this.fullName,
    this.socialData,
    this.error,
  });

  List<LoginIdentifierWithError> identifiers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FullNameWithError? fullName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SocialData? socialData;

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
      other is GeneralBlockSignupInit &&
          _deepEquality.equals(other.identifiers, identifiers) &&
          other.fullName == fullName &&
          other.socialData == socialData &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifiers.hashCode) +
      (fullName == null ? 0 : fullName!.hashCode) +
      (socialData == null ? 0 : socialData!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'GeneralBlockSignupInit[identifiers=$identifiers, fullName=$fullName, socialData=$socialData, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifiers'] = this.identifiers;
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.socialData != null) {
      json[r'socialData'] = this.socialData;
    } else {
      json[r'socialData'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [GeneralBlockSignupInit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneralBlockSignupInit? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneralBlockSignupInit[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneralBlockSignupInit[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneralBlockSignupInit(
        identifiers:
            LoginIdentifierWithError.listFromJson(json[r'identifiers']),
        fullName: FullNameWithError.fromJson(json[r'fullName']),
        socialData: SocialData.fromJson(json[r'socialData']),
        error: RequestError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<GeneralBlockSignupInit> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockSignupInit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockSignupInit.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneralBlockSignupInit> mapFromJson(dynamic json) {
    final map = <String, GeneralBlockSignupInit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneralBlockSignupInit.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneralBlockSignupInit-objects as value to a dart map
  static Map<String, List<GeneralBlockSignupInit>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneralBlockSignupInit>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneralBlockSignupInit.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifiers',
  };
}

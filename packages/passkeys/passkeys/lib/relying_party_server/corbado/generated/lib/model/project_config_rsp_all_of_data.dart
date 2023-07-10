//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectConfigRspAllOfData {
  /// Returns a new [ProjectConfigRspAllOfData] instance.
  ProjectConfigRspAllOfData({
    required this.allowUserRegistration,
    required this.passkeyAppendInterval,
    required this.fallbackLanguage,
    required this.autoDetectLanguage,
    required this.userFullNameRequired,
    required this.webComponentDebug,
  });

  bool allowUserRegistration;

  String passkeyAppendInterval;

  String fallbackLanguage;

  bool autoDetectLanguage;

  bool userFullNameRequired;

  bool webComponentDebug;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectConfigRspAllOfData &&
     other.allowUserRegistration == allowUserRegistration &&
     other.passkeyAppendInterval == passkeyAppendInterval &&
     other.fallbackLanguage == fallbackLanguage &&
     other.autoDetectLanguage == autoDetectLanguage &&
     other.userFullNameRequired == userFullNameRequired &&
     other.webComponentDebug == webComponentDebug;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (allowUserRegistration.hashCode) +
    (passkeyAppendInterval.hashCode) +
    (fallbackLanguage.hashCode) +
    (autoDetectLanguage.hashCode) +
    (userFullNameRequired.hashCode) +
    (webComponentDebug.hashCode);

  @override
  String toString() => 'ProjectConfigRspAllOfData[allowUserRegistration=$allowUserRegistration, passkeyAppendInterval=$passkeyAppendInterval, fallbackLanguage=$fallbackLanguage, autoDetectLanguage=$autoDetectLanguage, userFullNameRequired=$userFullNameRequired, webComponentDebug=$webComponentDebug]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'allowUserRegistration'] = this.allowUserRegistration;
      json[r'passkeyAppendInterval'] = this.passkeyAppendInterval;
      json[r'fallbackLanguage'] = this.fallbackLanguage;
      json[r'autoDetectLanguage'] = this.autoDetectLanguage;
      json[r'userFullNameRequired'] = this.userFullNameRequired;
      json[r'webComponentDebug'] = this.webComponentDebug;
    return json;
  }

  /// Returns a new [ProjectConfigRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectConfigRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProjectConfigRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProjectConfigRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProjectConfigRspAllOfData(
        allowUserRegistration: mapValueOfType<bool>(json, r'allowUserRegistration')!,
        passkeyAppendInterval: mapValueOfType<String>(json, r'passkeyAppendInterval')!,
        fallbackLanguage: mapValueOfType<String>(json, r'fallbackLanguage')!,
        autoDetectLanguage: mapValueOfType<bool>(json, r'autoDetectLanguage')!,
        userFullNameRequired: mapValueOfType<bool>(json, r'userFullNameRequired')!,
        webComponentDebug: mapValueOfType<bool>(json, r'webComponentDebug')!,
      );
    }
    return null;
  }

  static List<ProjectConfigRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectConfigRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectConfigRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectConfigRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, ProjectConfigRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectConfigRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectConfigRspAllOfData-objects as value to a dart map
  static Map<String, List<ProjectConfigRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectConfigRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectConfigRspAllOfData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'allowUserRegistration',
    'passkeyAppendInterval',
    'fallbackLanguage',
    'autoDetectLanguage',
    'userFullNameRequired',
    'webComponentDebug',
  };
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JavaScriptHighEntropy {
  /// Returns a new [JavaScriptHighEntropy] instance.
  JavaScriptHighEntropy({
    required this.platform,
    required this.platformVersion,
    required this.mobile,
  });

  String platform;

  String platformVersion;

  bool mobile;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JavaScriptHighEntropy &&
          other.platform == platform &&
          other.platformVersion == platformVersion &&
          other.mobile == mobile;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (platform.hashCode) + (platformVersion.hashCode) + (mobile.hashCode);

  @override
  String toString() =>
      'JavaScriptHighEntropy[platform=$platform, platformVersion=$platformVersion, mobile=$mobile]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'platform'] = this.platform;
    json[r'platformVersion'] = this.platformVersion;
    json[r'mobile'] = this.mobile;
    return json;
  }

  /// Returns a new [JavaScriptHighEntropy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JavaScriptHighEntropy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "JavaScriptHighEntropy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "JavaScriptHighEntropy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JavaScriptHighEntropy(
        platform: mapValueOfType<String>(json, r'platform')!,
        platformVersion: mapValueOfType<String>(json, r'platformVersion')!,
        mobile: mapValueOfType<bool>(json, r'mobile')!,
      );
    }
    return null;
  }

  static List<JavaScriptHighEntropy> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JavaScriptHighEntropy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JavaScriptHighEntropy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JavaScriptHighEntropy> mapFromJson(dynamic json) {
    final map = <String, JavaScriptHighEntropy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JavaScriptHighEntropy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JavaScriptHighEntropy-objects as value to a dart map
  static Map<String, List<JavaScriptHighEntropy>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<JavaScriptHighEntropy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JavaScriptHighEntropy.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'platform',
    'platformVersion',
    'mobile',
  };
}

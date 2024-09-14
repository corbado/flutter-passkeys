//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProcessCommon {
  /// Returns a new [ProcessCommon] instance.
  ProcessCommon({
    required this.appName,
    required this.frontendApiUrl,
    required this.hideBadge,
  });

  String appName;

  String frontendApiUrl;

  bool hideBadge;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessCommon &&
          other.appName == appName &&
          other.frontendApiUrl == frontendApiUrl &&
          other.hideBadge == hideBadge;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (appName.hashCode) + (frontendApiUrl.hashCode) + (hideBadge.hashCode);

  @override
  String toString() =>
      'ProcessCommon[appName=$appName, frontendApiUrl=$frontendApiUrl, hideBadge=$hideBadge]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'appName'] = this.appName;
    json[r'frontendApiUrl'] = this.frontendApiUrl;
    json[r'hideBadge'] = this.hideBadge;
    return json;
  }

  /// Returns a new [ProcessCommon] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProcessCommon? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProcessCommon[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProcessCommon[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProcessCommon(
        appName: mapValueOfType<String>(json, r'appName')!,
        frontendApiUrl: mapValueOfType<String>(json, r'frontendApiUrl')!,
        hideBadge: mapValueOfType<bool>(json, r'hideBadge')!,
      );
    }
    return null;
  }

  static List<ProcessCommon> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProcessCommon>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProcessCommon.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProcessCommon> mapFromJson(dynamic json) {
    final map = <String, ProcessCommon>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProcessCommon.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProcessCommon-objects as value to a dart map
  static Map<String, List<ProcessCommon>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProcessCommon>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProcessCommon.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'appName',
    'frontendApiUrl',
    'hideBadge',
  };
}

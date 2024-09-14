//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProcessStaticInfo {
  /// Returns a new [ProcessStaticInfo] instance.
  ProcessStaticInfo({
    required this.token,
    required this.expiresAt,
  });

  String token;

  int expiresAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessStaticInfo &&
          other.token == token &&
          other.expiresAt == expiresAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (token.hashCode) + (expiresAt.hashCode);

  @override
  String toString() => 'ProcessStaticInfo[token=$token, expiresAt=$expiresAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'token'] = this.token;
    json[r'expiresAt'] = this.expiresAt;
    return json;
  }

  /// Returns a new [ProcessStaticInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProcessStaticInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProcessStaticInfo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProcessStaticInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProcessStaticInfo(
        token: mapValueOfType<String>(json, r'token')!,
        expiresAt: mapValueOfType<int>(json, r'expiresAt')!,
      );
    }
    return null;
  }

  static List<ProcessStaticInfo> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProcessStaticInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProcessStaticInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProcessStaticInfo> mapFromJson(dynamic json) {
    final map = <String, ProcessStaticInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProcessStaticInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProcessStaticInfo-objects as value to a dart map
  static Map<String, List<ProcessStaticInfo>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProcessStaticInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProcessStaticInfo.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'token',
    'expiresAt',
  };
}

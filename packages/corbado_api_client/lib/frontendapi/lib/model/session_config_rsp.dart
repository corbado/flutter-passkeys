//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionConfigRsp {
  /// Returns a new [SessionConfigRsp] instance.
  SessionConfigRsp({
    required this.useSessionManagement,
    this.shortSessionCookieConfig,
    this.frontendApiUrl,
  });

  bool useSessionManagement;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShortSessionCookieConfig? shortSessionCookieConfig;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? frontendApiUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionConfigRsp &&
          other.useSessionManagement == useSessionManagement &&
          other.shortSessionCookieConfig == shortSessionCookieConfig &&
          other.frontendApiUrl == frontendApiUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (useSessionManagement.hashCode) +
      (shortSessionCookieConfig == null
          ? 0
          : shortSessionCookieConfig!.hashCode) +
      (frontendApiUrl == null ? 0 : frontendApiUrl!.hashCode);

  @override
  String toString() =>
      'SessionConfigRsp[useSessionManagement=$useSessionManagement, shortSessionCookieConfig=$shortSessionCookieConfig, frontendApiUrl=$frontendApiUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'useSessionManagement'] = this.useSessionManagement;
    if (this.shortSessionCookieConfig != null) {
      json[r'shortSessionCookieConfig'] = this.shortSessionCookieConfig;
    } else {
      json[r'shortSessionCookieConfig'] = null;
    }
    if (this.frontendApiUrl != null) {
      json[r'frontendApiUrl'] = this.frontendApiUrl;
    } else {
      json[r'frontendApiUrl'] = null;
    }
    return json;
  }

  /// Returns a new [SessionConfigRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionConfigRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SessionConfigRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SessionConfigRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionConfigRsp(
        useSessionManagement:
            mapValueOfType<bool>(json, r'useSessionManagement')!,
        shortSessionCookieConfig: ShortSessionCookieConfig.fromJson(
            json[r'shortSessionCookieConfig']),
        frontendApiUrl: mapValueOfType<String>(json, r'frontendApiUrl'),
      );
    }
    return null;
  }

  static List<SessionConfigRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionConfigRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionConfigRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionConfigRsp> mapFromJson(dynamic json) {
    final map = <String, SessionConfigRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionConfigRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionConfigRsp-objects as value to a dart map
  static Map<String, List<SessionConfigRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SessionConfigRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SessionConfigRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'useSessionManagement',
  };
}

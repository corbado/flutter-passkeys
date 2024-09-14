//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginIdentifierConfig {
  /// Returns a new [LoginIdentifierConfig] instance.
  LoginIdentifierConfig({
    required this.type,
  });

  LoginIdentifierType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginIdentifierConfig && other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode);

  @override
  String toString() => 'LoginIdentifierConfig[type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [LoginIdentifierConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginIdentifierConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LoginIdentifierConfig[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LoginIdentifierConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginIdentifierConfig(
        type: LoginIdentifierType.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<LoginIdentifierConfig> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LoginIdentifierConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginIdentifierConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginIdentifierConfig> mapFromJson(dynamic json) {
    final map = <String, LoginIdentifierConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginIdentifierConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginIdentifierConfig-objects as value to a dart map
  static Map<String, List<LoginIdentifierConfig>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LoginIdentifierConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginIdentifierConfig.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

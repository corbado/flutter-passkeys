//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginIdentifier {
  /// Returns a new [LoginIdentifier] instance.
  LoginIdentifier({
    required this.type,
    required this.identifier,
  });

  LoginIdentifierType type;

  String identifier;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginIdentifier &&
          other.type == type &&
          other.identifier == identifier;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode) + (identifier.hashCode);

  @override
  String toString() => 'LoginIdentifier[type=$type, identifier=$identifier]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    json[r'identifier'] = this.identifier;
    return json;
  }

  /// Returns a new [LoginIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LoginIdentifier[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LoginIdentifier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginIdentifier(
        type: LoginIdentifierType.fromJson(json[r'type'])!,
        identifier: mapValueOfType<String>(json, r'identifier')!,
      );
    }
    return null;
  }

  static List<LoginIdentifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LoginIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginIdentifier> mapFromJson(dynamic json) {
    final map = <String, LoginIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginIdentifier-objects as value to a dart map
  static Map<String, List<LoginIdentifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LoginIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginIdentifier.listFromJson(
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
    'identifier',
  };
}

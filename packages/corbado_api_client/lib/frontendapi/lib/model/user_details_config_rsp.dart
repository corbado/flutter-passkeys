//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDetailsConfigRsp {
  /// Returns a new [UserDetailsConfigRsp] instance.
  UserDetailsConfigRsp({
    required this.fullNameRequired,
    this.identifiers = const [],
  });

  bool fullNameRequired;

  List<LoginIdentifierConfig> identifiers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsConfigRsp &&
          other.fullNameRequired == fullNameRequired &&
          _deepEquality.equals(other.identifiers, identifiers);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fullNameRequired.hashCode) + (identifiers.hashCode);

  @override
  String toString() =>
      'UserDetailsConfigRsp[fullNameRequired=$fullNameRequired, identifiers=$identifiers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'fullNameRequired'] = this.fullNameRequired;
    json[r'identifiers'] = this.identifiers;
    return json;
  }

  /// Returns a new [UserDetailsConfigRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDetailsConfigRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UserDetailsConfigRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UserDetailsConfigRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDetailsConfigRsp(
        fullNameRequired: mapValueOfType<bool>(json, r'fullNameRequired')!,
        identifiers: LoginIdentifierConfig.listFromJson(json[r'identifiers']),
      );
    }
    return null;
  }

  static List<UserDetailsConfigRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserDetailsConfigRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDetailsConfigRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDetailsConfigRsp> mapFromJson(dynamic json) {
    final map = <String, UserDetailsConfigRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetailsConfigRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDetailsConfigRsp-objects as value to a dart map
  static Map<String, List<UserDetailsConfigRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserDetailsConfigRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserDetailsConfigRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fullNameRequired',
    'identifiers',
  };
}

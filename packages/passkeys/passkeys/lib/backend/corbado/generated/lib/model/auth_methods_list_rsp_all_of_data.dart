//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthMethodsListRspAllOfData {
  /// Returns a new [AuthMethodsListRspAllOfData] instance.
  AuthMethodsListRspAllOfData({
    this.selectedMethods = const [],
    this.possibleMethods = const [],
  });

  List<AuthMethod> selectedMethods;

  List<AuthMethod> possibleMethods;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthMethodsListRspAllOfData &&
     other.selectedMethods == selectedMethods &&
     other.possibleMethods == possibleMethods;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (selectedMethods.hashCode) +
    (possibleMethods.hashCode);

  @override
  String toString() => 'AuthMethodsListRspAllOfData[selectedMethods=$selectedMethods, possibleMethods=$possibleMethods]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'selectedMethods'] = this.selectedMethods;
      json[r'possibleMethods'] = this.possibleMethods;
    return json;
  }

  /// Returns a new [AuthMethodsListRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthMethodsListRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthMethodsListRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthMethodsListRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthMethodsListRspAllOfData(
        selectedMethods: AuthMethod.listFromJson(json[r'selectedMethods'])!,
        possibleMethods: AuthMethod.listFromJson(json[r'possibleMethods'])!,
      );
    }
    return null;
  }

  static List<AuthMethodsListRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthMethodsListRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthMethodsListRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthMethodsListRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, AuthMethodsListRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthMethodsListRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthMethodsListRspAllOfData-objects as value to a dart map
  static Map<String, List<AuthMethodsListRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthMethodsListRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthMethodsListRspAllOfData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'selectedMethods',
    'possibleMethods',
  };
}


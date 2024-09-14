//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginInitReq {
  /// Returns a new [LoginInitReq] instance.
  LoginInitReq({
    required this.identifierValue,
    required this.isPhone,
  });

  String identifierValue;

  bool isPhone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginInitReq &&
          other.identifierValue == identifierValue &&
          other.isPhone == isPhone;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifierValue.hashCode) + (isPhone.hashCode);

  @override
  String toString() =>
      'LoginInitReq[identifierValue=$identifierValue, isPhone=$isPhone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifierValue'] = this.identifierValue;
    json[r'isPhone'] = this.isPhone;
    return json;
  }

  /// Returns a new [LoginInitReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginInitReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LoginInitReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LoginInitReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginInitReq(
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        isPhone: mapValueOfType<bool>(json, r'isPhone')!,
      );
    }
    return null;
  }

  static List<LoginInitReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LoginInitReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginInitReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginInitReq> mapFromJson(dynamic json) {
    final map = <String, LoginInitReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginInitReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginInitReq-objects as value to a dart map
  static Map<String, List<LoginInitReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LoginInitReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginInitReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifierValue',
    'isPhone',
  };
}

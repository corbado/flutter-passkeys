//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignupInitReq {
  /// Returns a new [SignupInitReq] instance.
  SignupInitReq({
    this.identifiers = const [],
    this.fullName,
  });

  List<LoginIdentifier> identifiers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fullName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignupInitReq &&
          _deepEquality.equals(other.identifiers, identifiers) &&
          other.fullName == fullName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifiers.hashCode) + (fullName == null ? 0 : fullName!.hashCode);

  @override
  String toString() =>
      'SignupInitReq[identifiers=$identifiers, fullName=$fullName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifiers'] = this.identifiers;
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    return json;
  }

  /// Returns a new [SignupInitReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignupInitReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SignupInitReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SignupInitReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignupInitReq(
        identifiers: LoginIdentifier.listFromJson(json[r'identifiers']),
        fullName: mapValueOfType<String>(json, r'fullName'),
      );
    }
    return null;
  }

  static List<SignupInitReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignupInitReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignupInitReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignupInitReq> mapFromJson(dynamic json) {
    final map = <String, SignupInitReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignupInitReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignupInitReq-objects as value to a dart map
  static Map<String, List<SignupInitReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SignupInitReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignupInitReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifiers',
  };
}

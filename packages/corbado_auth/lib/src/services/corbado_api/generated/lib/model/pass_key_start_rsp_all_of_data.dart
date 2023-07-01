//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyStartRspAllOfData {
  /// Returns a new [PassKeyStartRspAllOfData] instance.
  PassKeyStartRspAllOfData({
    required this.challenge,
  });

  /// Contains json payload data for start webauthn login challenge
  String challenge;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyStartRspAllOfData &&
     other.challenge == challenge;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (challenge.hashCode);

  @override
  String toString() => 'PassKeyStartRspAllOfData[challenge=$challenge]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'challenge'] = this.challenge;
    return json;
  }

  /// Returns a new [PassKeyStartRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyStartRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyStartRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyStartRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyStartRspAllOfData(
        challenge: mapValueOfType<String>(json, r'challenge')!,
      );
    }
    return null;
  }

  static List<PassKeyStartRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyStartRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyStartRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyStartRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, PassKeyStartRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyStartRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyStartRspAllOfData-objects as value to a dart map
  static Map<String, List<PassKeyStartRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyStartRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyStartRspAllOfData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'challenge',
  };
}


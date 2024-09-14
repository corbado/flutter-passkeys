//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasskeyMediationFinishReq {
  /// Returns a new [PasskeyMediationFinishReq] instance.
  PasskeyMediationFinishReq({
    required this.signedChallenge,
  });

  String signedChallenge;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasskeyMediationFinishReq &&
          other.signedChallenge == signedChallenge;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (signedChallenge.hashCode);

  @override
  String toString() =>
      'PasskeyMediationFinishReq[signedChallenge=$signedChallenge]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'signedChallenge'] = this.signedChallenge;
    return json;
  }

  /// Returns a new [PasskeyMediationFinishReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PasskeyMediationFinishReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PasskeyMediationFinishReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PasskeyMediationFinishReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PasskeyMediationFinishReq(
        signedChallenge: mapValueOfType<String>(json, r'signedChallenge')!,
      );
    }
    return null;
  }

  static List<PasskeyMediationFinishReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyMediationFinishReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyMediationFinishReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PasskeyMediationFinishReq> mapFromJson(dynamic json) {
    final map = <String, PasskeyMediationFinishReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasskeyMediationFinishReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PasskeyMediationFinishReq-objects as value to a dart map
  static Map<String, List<PasskeyMediationFinishReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PasskeyMediationFinishReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PasskeyMediationFinishReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'signedChallenge',
  };
}

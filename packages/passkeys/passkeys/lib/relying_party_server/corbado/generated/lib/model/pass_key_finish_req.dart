//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyFinishReq {
  /// Returns a new [PassKeyFinishReq] instance.
  PassKeyFinishReq({
    required this.signedChallenge,
    this.requestID,
  });

  String signedChallenge;

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyFinishReq &&
     other.signedChallenge == signedChallenge &&
     other.requestID == requestID;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (signedChallenge.hashCode) +
    (requestID == null ? 0 : requestID!.hashCode);

  @override
  String toString() => 'PassKeyFinishReq[signedChallenge=$signedChallenge, requestID=$requestID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'signedChallenge'] = this.signedChallenge;
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    return json;
  }

  /// Returns a new [PassKeyFinishReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyFinishReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyFinishReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyFinishReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyFinishReq(
        signedChallenge: mapValueOfType<String>(json, r'signedChallenge')!,
        requestID: mapValueOfType<String>(json, r'requestID'),
      );
    }
    return null;
  }

  static List<PassKeyFinishReq>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyFinishReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyFinishReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyFinishReq> mapFromJson(dynamic json) {
    final map = <String, PassKeyFinishReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyFinishReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyFinishReq-objects as value to a dart map
  static Map<String, List<PassKeyFinishReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyFinishReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyFinishReq.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'signedChallenge',
  };
}


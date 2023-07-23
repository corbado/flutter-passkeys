//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyMediationStartReq {
  /// Returns a new [PassKeyMediationStartReq] instance.
  PassKeyMediationStartReq({
    this.requestID,
    this.username,
  });

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyMediationStartReq &&
     other.requestID == requestID &&
     other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (requestID == null ? 0 : requestID!.hashCode) +
    (username == null ? 0 : username!.hashCode);

  @override
  String toString() => 'PassKeyMediationStartReq[requestID=$requestID, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [PassKeyMediationStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyMediationStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyMediationStartReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyMediationStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyMediationStartReq(
        requestID: mapValueOfType<String>(json, r'requestID'),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<PassKeyMediationStartReq> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyMediationStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyMediationStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyMediationStartReq> mapFromJson(dynamic json) {
    final map = <String, PassKeyMediationStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyMediationStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyMediationStartReq-objects as value to a dart map
  static Map<String, List<PassKeyMediationStartReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyMediationStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PassKeyMediationStartReq.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


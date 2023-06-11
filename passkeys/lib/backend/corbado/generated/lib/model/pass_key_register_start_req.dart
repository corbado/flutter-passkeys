//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyRegisterStartReq {
  /// Returns a new [PassKeyRegisterStartReq] instance.
  PassKeyRegisterStartReq({
    required this.username,
    this.fullName,
    this.requestID,
  });

  /// Users login name
  String username;

  /// Users full name
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fullName;

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyRegisterStartReq &&
     other.username == username &&
     other.fullName == fullName &&
     other.requestID == requestID;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username.hashCode) +
    (fullName == null ? 0 : fullName!.hashCode) +
    (requestID == null ? 0 : requestID!.hashCode);

  @override
  String toString() => 'PassKeyRegisterStartReq[username=$username, fullName=$fullName, requestID=$requestID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = this.username;
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    return json;
  }

  /// Returns a new [PassKeyRegisterStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyRegisterStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyRegisterStartReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyRegisterStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyRegisterStartReq(
        username: mapValueOfType<String>(json, r'username')!,
        fullName: mapValueOfType<String>(json, r'fullName'),
        requestID: mapValueOfType<String>(json, r'requestID'),
      );
    }
    return null;
  }

  static List<PassKeyRegisterStartReq>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyRegisterStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyRegisterStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyRegisterStartReq> mapFromJson(dynamic json) {
    final map = <String, PassKeyRegisterStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyRegisterStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyRegisterStartReq-objects as value to a dart map
  static Map<String, List<PassKeyRegisterStartReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyRegisterStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyRegisterStartReq.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'username',
  };
}


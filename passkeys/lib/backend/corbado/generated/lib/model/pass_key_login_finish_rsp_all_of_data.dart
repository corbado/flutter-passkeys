//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyLoginFinishRspAllOfData {
  /// Returns a new [PassKeyLoginFinishRspAllOfData] instance.
  PassKeyLoginFinishRspAllOfData({
    required this.username,
    required this.confirmedCredential,
    required this.redirectURL,
    required this.sessionToken,
    this.shortSession,
  });

  String username;

  bool confirmedCredential;

  String redirectURL;

  /// Only given when using session v1, newer versions work with cookies
  String sessionToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShortSession? shortSession;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyLoginFinishRspAllOfData &&
     other.username == username &&
     other.confirmedCredential == confirmedCredential &&
     other.redirectURL == redirectURL &&
     other.sessionToken == sessionToken &&
     other.shortSession == shortSession;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username.hashCode) +
    (confirmedCredential.hashCode) +
    (redirectURL.hashCode) +
    (sessionToken.hashCode) +
    (shortSession == null ? 0 : shortSession!.hashCode);

  @override
  String toString() => 'PassKeyLoginFinishRspAllOfData[username=$username, confirmedCredential=$confirmedCredential, redirectURL=$redirectURL, sessionToken=$sessionToken, shortSession=$shortSession]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = this.username;
      json[r'confirmedCredential'] = this.confirmedCredential;
      json[r'redirectURL'] = this.redirectURL;
      json[r'sessionToken'] = this.sessionToken;
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
    return json;
  }

  /// Returns a new [PassKeyLoginFinishRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyLoginFinishRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyLoginFinishRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyLoginFinishRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyLoginFinishRspAllOfData(
        username: mapValueOfType<String>(json, r'username')!,
        confirmedCredential: mapValueOfType<bool>(json, r'confirmedCredential')!,
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
        sessionToken: mapValueOfType<String>(json, r'sessionToken')!,
        shortSession: ShortSession.fromJson(json[r'shortSession']),
      );
    }
    return null;
  }

  static List<PassKeyLoginFinishRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyLoginFinishRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyLoginFinishRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyLoginFinishRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, PassKeyLoginFinishRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyLoginFinishRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyLoginFinishRspAllOfData-objects as value to a dart map
  static Map<String, List<PassKeyLoginFinishRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyLoginFinishRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyLoginFinishRspAllOfData.listFromJson(entry.value, growable: growable,);
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
    'confirmedCredential',
    'redirectURL',
    'sessionToken',
  };
}


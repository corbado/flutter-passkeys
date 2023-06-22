//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyRegisterFinishRspAllOfData {
  /// Returns a new [PassKeyRegisterFinishRspAllOfData] instance.
  PassKeyRegisterFinishRspAllOfData({
    required this.redirectURL,
    required this.sessionToken,
    this.shortSession,
  });

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
  bool operator ==(Object other) => identical(this, other) || other is PassKeyRegisterFinishRspAllOfData &&
     other.redirectURL == redirectURL &&
     other.sessionToken == sessionToken &&
     other.shortSession == shortSession;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (redirectURL.hashCode) +
    (sessionToken.hashCode) +
    (shortSession == null ? 0 : shortSession!.hashCode);

  @override
  String toString() => 'PassKeyRegisterFinishRspAllOfData[redirectURL=$redirectURL, sessionToken=$sessionToken, shortSession=$shortSession]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'redirectURL'] = this.redirectURL;
      json[r'sessionToken'] = this.sessionToken;
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
    return json;
  }

  /// Returns a new [PassKeyRegisterFinishRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyRegisterFinishRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyRegisterFinishRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyRegisterFinishRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyRegisterFinishRspAllOfData(
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
        sessionToken: mapValueOfType<String>(json, r'sessionToken')!,
        shortSession: ShortSession.fromJson(json[r'shortSession']),
      );
    }
    return null;
  }

  static List<PassKeyRegisterFinishRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyRegisterFinishRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyRegisterFinishRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyRegisterFinishRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, PassKeyRegisterFinishRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyRegisterFinishRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyRegisterFinishRspAllOfData-objects as value to a dart map
  static Map<String, List<PassKeyRegisterFinishRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyRegisterFinishRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyRegisterFinishRspAllOfData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'redirectURL',
    'sessionToken',
  };
}


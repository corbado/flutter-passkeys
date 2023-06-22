//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionRefreshRspAllOf {
  /// Returns a new [SessionRefreshRspAllOf] instance.
  SessionRefreshRspAllOf({
    required this.sessionToken,
    this.shortSession,
    required this.redirectURL,
  });

  String sessionToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShortSession? shortSession;

  String redirectURL;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SessionRefreshRspAllOf &&
     other.sessionToken == sessionToken &&
     other.shortSession == shortSession &&
     other.redirectURL == redirectURL;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sessionToken.hashCode) +
    (shortSession == null ? 0 : shortSession!.hashCode) +
    (redirectURL.hashCode);

  @override
  String toString() => 'SessionRefreshRspAllOf[sessionToken=$sessionToken, shortSession=$shortSession, redirectURL=$redirectURL]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'sessionToken'] = this.sessionToken;
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
      json[r'redirectURL'] = this.redirectURL;
    return json;
  }

  /// Returns a new [SessionRefreshRspAllOf] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionRefreshRspAllOf? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SessionRefreshRspAllOf[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SessionRefreshRspAllOf[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionRefreshRspAllOf(
        sessionToken: mapValueOfType<String>(json, r'sessionToken')!,
        shortSession: ShortSession.fromJson(json[r'shortSession']),
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
      );
    }
    return null;
  }

  static List<SessionRefreshRspAllOf>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SessionRefreshRspAllOf>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionRefreshRspAllOf.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionRefreshRspAllOf> mapFromJson(dynamic json) {
    final map = <String, SessionRefreshRspAllOf>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionRefreshRspAllOf.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionRefreshRspAllOf-objects as value to a dart map
  static Map<String, List<SessionRefreshRspAllOf>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SessionRefreshRspAllOf>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionRefreshRspAllOf.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'sessionToken',
    'redirectURL',
  };
}


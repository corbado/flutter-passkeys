//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionRefreshRsp {
  /// Returns a new [SessionRefreshRsp] instance.
  SessionRefreshRsp({
    required this.httpStatusCode,
    required this.message,
    required this.requestData,
    required this.runtime,
    required this.sessionToken,
    this.shortSession,
    required this.redirectURL,
  });

  /// HTTP status code of operation
  ///
  /// Minimum value: 200
  /// Maximum value: 599
  int httpStatusCode;

  String message;

  RequestData requestData;

  /// Runtime in seconds for this request
  double runtime;

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
  bool operator ==(Object other) => identical(this, other) || other is SessionRefreshRsp &&
     other.httpStatusCode == httpStatusCode &&
     other.message == message &&
     other.requestData == requestData &&
     other.runtime == runtime &&
     other.sessionToken == sessionToken &&
     other.shortSession == shortSession &&
     other.redirectURL == redirectURL;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (httpStatusCode.hashCode) +
    (message.hashCode) +
    (requestData.hashCode) +
    (runtime.hashCode) +
    (sessionToken.hashCode) +
    (shortSession == null ? 0 : shortSession!.hashCode) +
    (redirectURL.hashCode);

  @override
  String toString() => 'SessionRefreshRsp[httpStatusCode=$httpStatusCode, message=$message, requestData=$requestData, runtime=$runtime, sessionToken=$sessionToken, shortSession=$shortSession, redirectURL=$redirectURL]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'httpStatusCode'] = this.httpStatusCode;
      json[r'message'] = this.message;
      json[r'requestData'] = this.requestData;
      json[r'runtime'] = this.runtime;
      json[r'sessionToken'] = this.sessionToken;
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
      json[r'redirectURL'] = this.redirectURL;
    return json;
  }

  /// Returns a new [SessionRefreshRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionRefreshRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SessionRefreshRsp[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SessionRefreshRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionRefreshRsp(
        httpStatusCode: mapValueOfType<int>(json, r'httpStatusCode')!,
        message: mapValueOfType<String>(json, r'message')!,
        requestData: RequestData.fromJson(json[r'requestData'])!,
        runtime: mapValueOfType<double>(json, r'runtime')!,
        sessionToken: mapValueOfType<String>(json, r'sessionToken')!,
        shortSession: ShortSession.fromJson(json[r'shortSession']),
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
      );
    }
    return null;
  }

  static List<SessionRefreshRsp>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SessionRefreshRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionRefreshRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionRefreshRsp> mapFromJson(dynamic json) {
    final map = <String, SessionRefreshRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionRefreshRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionRefreshRsp-objects as value to a dart map
  static Map<String, List<SessionRefreshRsp>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SessionRefreshRsp>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionRefreshRsp.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'httpStatusCode',
    'message',
    'requestData',
    'runtime',
    'sessionToken',
    'redirectURL',
  };
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailCodeConfirmRspAllOfData {
  /// Returns a new [EmailCodeConfirmRspAllOfData] instance.
  EmailCodeConfirmRspAllOfData({
    required this.redirectURL,
    this.authMethods = const [],
    this.sessionToken,
    this.longSession,
    this.shortSession,
  });

  String redirectURL;

  List<AuthMethod> authMethods;

  /// Only given when using session v1
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sessionToken;

  /// Only given when project environment is dev
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? longSession;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ShortSession? shortSession;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailCodeConfirmRspAllOfData &&
          other.redirectURL == redirectURL &&
          _deepEquality.equals(other.authMethods, authMethods) &&
          other.sessionToken == sessionToken &&
          other.longSession == longSession &&
          other.shortSession == shortSession;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (redirectURL.hashCode) +
      (authMethods.hashCode) +
      (sessionToken == null ? 0 : sessionToken!.hashCode) +
      (longSession == null ? 0 : longSession!.hashCode) +
      (shortSession == null ? 0 : shortSession!.hashCode);

  @override
  String toString() =>
      'EmailCodeConfirmRspAllOfData[redirectURL=$redirectURL, authMethods=$authMethods, sessionToken=$sessionToken, longSession=$longSession, shortSession=$shortSession]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'redirectURL'] = this.redirectURL;
    json[r'authMethods'] = this.authMethods;
    if (this.sessionToken != null) {
      json[r'sessionToken'] = this.sessionToken;
    } else {
      json[r'sessionToken'] = null;
    }
    if (this.longSession != null) {
      json[r'longSession'] = this.longSession;
    } else {
      json[r'longSession'] = null;
    }
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
    return json;
  }

  /// Returns a new [EmailCodeConfirmRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailCodeConfirmRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EmailCodeConfirmRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EmailCodeConfirmRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailCodeConfirmRspAllOfData(
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
        authMethods: AuthMethod.listFromJson(json[r'authMethods']),
        sessionToken: mapValueOfType<String>(json, r'sessionToken'),
        longSession: mapValueOfType<String>(json, r'longSession'),
        shortSession: ShortSession.fromJson(json[r'shortSession']),
      );
    }
    return null;
  }

  static List<EmailCodeConfirmRspAllOfData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailCodeConfirmRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailCodeConfirmRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailCodeConfirmRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, EmailCodeConfirmRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailCodeConfirmRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailCodeConfirmRspAllOfData-objects as value to a dart map
  static Map<String, List<EmailCodeConfirmRspAllOfData>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EmailCodeConfirmRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailCodeConfirmRspAllOfData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'redirectURL',
    'authMethods',
  };
}

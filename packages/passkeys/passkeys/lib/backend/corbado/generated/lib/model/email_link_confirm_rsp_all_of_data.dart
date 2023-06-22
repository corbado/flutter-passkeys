//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailLinkConfirmRspAllOfData {
  /// Returns a new [EmailLinkConfirmRspAllOfData] instance.
  EmailLinkConfirmRspAllOfData({
    required this.redirectURL,
    required this.sessionToken,
    this.shortSession,
    this.authMethods = const [],
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

  List<AuthMethod> authMethods;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EmailLinkConfirmRspAllOfData &&
     other.redirectURL == redirectURL &&
     other.sessionToken == sessionToken &&
     other.shortSession == shortSession &&
     other.authMethods == authMethods;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (redirectURL.hashCode) +
    (sessionToken.hashCode) +
    (shortSession == null ? 0 : shortSession!.hashCode) +
    (authMethods.hashCode);

  @override
  String toString() => 'EmailLinkConfirmRspAllOfData[redirectURL=$redirectURL, sessionToken=$sessionToken, shortSession=$shortSession, authMethods=$authMethods]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'redirectURL'] = this.redirectURL;
      json[r'sessionToken'] = this.sessionToken;
    if (this.shortSession != null) {
      json[r'shortSession'] = this.shortSession;
    } else {
      json[r'shortSession'] = null;
    }
      json[r'authMethods'] = this.authMethods;
    return json;
  }

  /// Returns a new [EmailLinkConfirmRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailLinkConfirmRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EmailLinkConfirmRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EmailLinkConfirmRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailLinkConfirmRspAllOfData(
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
        sessionToken: mapValueOfType<String>(json, r'sessionToken')!,
        shortSession: ShortSession.fromJson(json[r'shortSession']),
        authMethods: AuthMethod.listFromJson(json[r'authMethods'])!,
      );
    }
    return null;
  }

  static List<EmailLinkConfirmRspAllOfData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EmailLinkConfirmRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailLinkConfirmRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailLinkConfirmRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, EmailLinkConfirmRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailLinkConfirmRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailLinkConfirmRspAllOfData-objects as value to a dart map
  static Map<String, List<EmailLinkConfirmRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EmailLinkConfirmRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailLinkConfirmRspAllOfData.listFromJson(entry.value, growable: growable,);
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
    'authMethods',
  };
}


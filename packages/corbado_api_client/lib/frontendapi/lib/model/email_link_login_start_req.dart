//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailLinkLoginStartReq {
  /// Returns a new [EmailLinkLoginStartReq] instance.
  EmailLinkLoginStartReq({
    required this.username,
    this.requestID,
  });

  String username;

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailLinkLoginStartReq &&
          other.username == username &&
          other.requestID == requestID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (username.hashCode) + (requestID == null ? 0 : requestID!.hashCode);

  @override
  String toString() =>
      'EmailLinkLoginStartReq[username=$username, requestID=$requestID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'username'] = this.username;
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    return json;
  }

  /// Returns a new [EmailLinkLoginStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailLinkLoginStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EmailLinkLoginStartReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EmailLinkLoginStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailLinkLoginStartReq(
        username: mapValueOfType<String>(json, r'username')!,
        requestID: mapValueOfType<String>(json, r'requestID'),
      );
    }
    return null;
  }

  static List<EmailLinkLoginStartReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailLinkLoginStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailLinkLoginStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailLinkLoginStartReq> mapFromJson(dynamic json) {
    final map = <String, EmailLinkLoginStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailLinkLoginStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailLinkLoginStartReq-objects as value to a dart map
  static Map<String, List<EmailLinkLoginStartReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EmailLinkLoginStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailLinkLoginStartReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'username',
  };
}

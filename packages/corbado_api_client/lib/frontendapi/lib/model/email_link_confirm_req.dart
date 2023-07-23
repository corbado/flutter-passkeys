//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailLinkConfirmReq {
  /// Returns a new [EmailLinkConfirmReq] instance.
  EmailLinkConfirmReq({
    required this.emailLinkID,
    required this.token,
    this.requestID,
  });

  String emailLinkID;

  String token;

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EmailLinkConfirmReq &&
     other.emailLinkID == emailLinkID &&
     other.token == token &&
     other.requestID == requestID;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emailLinkID.hashCode) +
    (token.hashCode) +
    (requestID == null ? 0 : requestID!.hashCode);

  @override
  String toString() => 'EmailLinkConfirmReq[emailLinkID=$emailLinkID, token=$token, requestID=$requestID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'emailLinkID'] = this.emailLinkID;
      json[r'token'] = this.token;
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    return json;
  }

  /// Returns a new [EmailLinkConfirmReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailLinkConfirmReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EmailLinkConfirmReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EmailLinkConfirmReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailLinkConfirmReq(
        emailLinkID: mapValueOfType<String>(json, r'emailLinkID')!,
        token: mapValueOfType<String>(json, r'token')!,
        requestID: mapValueOfType<String>(json, r'requestID'),
      );
    }
    return null;
  }

  static List<EmailLinkConfirmReq> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EmailLinkConfirmReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailLinkConfirmReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailLinkConfirmReq> mapFromJson(dynamic json) {
    final map = <String, EmailLinkConfirmReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailLinkConfirmReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailLinkConfirmReq-objects as value to a dart map
  static Map<String, List<EmailLinkConfirmReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EmailLinkConfirmReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailLinkConfirmReq.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'emailLinkID',
    'token',
  };
}


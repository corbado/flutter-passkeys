//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectManageDeleteReq {
  /// Returns a new [ConnectManageDeleteReq] instance.
  ConnectManageDeleteReq({
    required this.connectToken,
    required this.credentialID,
  });

  String connectToken;

  String credentialID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectManageDeleteReq &&
          other.connectToken == connectToken &&
          other.credentialID == credentialID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (connectToken.hashCode) + (credentialID.hashCode);

  @override
  String toString() =>
      'ConnectManageDeleteReq[connectToken=$connectToken, credentialID=$credentialID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'connectToken'] = this.connectToken;
    json[r'credentialID'] = this.credentialID;
    return json;
  }

  /// Returns a new [ConnectManageDeleteReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectManageDeleteReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectManageDeleteReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectManageDeleteReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectManageDeleteReq(
        connectToken: mapValueOfType<String>(json, r'connectToken')!,
        credentialID: mapValueOfType<String>(json, r'credentialID')!,
      );
    }
    return null;
  }

  static List<ConnectManageDeleteReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectManageDeleteReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectManageDeleteReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectManageDeleteReq> mapFromJson(dynamic json) {
    final map = <String, ConnectManageDeleteReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectManageDeleteReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectManageDeleteReq-objects as value to a dart map
  static Map<String, List<ConnectManageDeleteReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectManageDeleteReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectManageDeleteReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'connectToken',
    'credentialID',
  };
}

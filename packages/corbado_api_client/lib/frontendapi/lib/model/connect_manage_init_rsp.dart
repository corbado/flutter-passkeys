//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectManageInitRsp {
  /// Returns a new [ConnectManageInitRsp] instance.
  ConnectManageInitRsp({
    required this.processID,
    required this.expiresAt,
    required this.frontendApiUrl,
    required this.manageAllowed,
    this.flags = const {},
    this.newClientEnvHandle,
  });

  String processID;

  int expiresAt;

  String frontendApiUrl;

  bool manageAllowed;

  Map<String, String> flags;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newClientEnvHandle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectManageInitRsp &&
          other.processID == processID &&
          other.expiresAt == expiresAt &&
          other.frontendApiUrl == frontendApiUrl &&
          other.manageAllowed == manageAllowed &&
          _deepEquality.equals(other.flags, flags) &&
          other.newClientEnvHandle == newClientEnvHandle;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (processID.hashCode) +
      (expiresAt.hashCode) +
      (frontendApiUrl.hashCode) +
      (manageAllowed.hashCode) +
      (flags.hashCode) +
      (newClientEnvHandle == null ? 0 : newClientEnvHandle!.hashCode);

  @override
  String toString() =>
      'ConnectManageInitRsp[processID=$processID, expiresAt=$expiresAt, frontendApiUrl=$frontendApiUrl, manageAllowed=$manageAllowed, flags=$flags, newClientEnvHandle=$newClientEnvHandle]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'processID'] = this.processID;
    json[r'expiresAt'] = this.expiresAt;
    json[r'frontendApiUrl'] = this.frontendApiUrl;
    json[r'manageAllowed'] = this.manageAllowed;
    json[r'flags'] = this.flags;
    if (this.newClientEnvHandle != null) {
      json[r'newClientEnvHandle'] = this.newClientEnvHandle;
    } else {
      json[r'newClientEnvHandle'] = null;
    }
    return json;
  }

  /// Returns a new [ConnectManageInitRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectManageInitRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectManageInitRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectManageInitRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectManageInitRsp(
        processID: mapValueOfType<String>(json, r'processID')!,
        expiresAt: mapValueOfType<int>(json, r'expiresAt')!,
        frontendApiUrl: mapValueOfType<String>(json, r'frontendApiUrl')!,
        manageAllowed: mapValueOfType<bool>(json, r'manageAllowed')!,
        flags: mapCastOfType<String, String>(json, r'flags')!,
        newClientEnvHandle: mapValueOfType<String>(json, r'newClientEnvHandle'),
      );
    }
    return null;
  }

  static List<ConnectManageInitRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectManageInitRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectManageInitRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectManageInitRsp> mapFromJson(dynamic json) {
    final map = <String, ConnectManageInitRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectManageInitRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectManageInitRsp-objects as value to a dart map
  static Map<String, List<ConnectManageInitRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectManageInitRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectManageInitRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'processID',
    'expiresAt',
    'frontendApiUrl',
    'manageAllowed',
    'flags',
  };
}

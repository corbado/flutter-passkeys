//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectLoginInitRsp {
  /// Returns a new [ConnectLoginInitRsp] instance.
  ConnectLoginInitRsp({
    required this.token,
    required this.expiresAt,
    required this.frontendApiUrl,
    required this.loginAllowed,
    this.flags = const {},
    this.newClientEnvHandle,
    this.conditionalUIChallenge,
  });

  String token;

  int expiresAt;

  String frontendApiUrl;

  bool loginAllowed;

  Map<String, String> flags;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newClientEnvHandle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? conditionalUIChallenge;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectLoginInitRsp &&
          other.token == token &&
          other.expiresAt == expiresAt &&
          other.frontendApiUrl == frontendApiUrl &&
          other.loginAllowed == loginAllowed &&
          _deepEquality.equals(other.flags, flags) &&
          other.newClientEnvHandle == newClientEnvHandle &&
          other.conditionalUIChallenge == conditionalUIChallenge;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (token.hashCode) +
      (expiresAt.hashCode) +
      (frontendApiUrl.hashCode) +
      (loginAllowed.hashCode) +
      (flags.hashCode) +
      (newClientEnvHandle == null ? 0 : newClientEnvHandle!.hashCode) +
      (conditionalUIChallenge == null ? 0 : conditionalUIChallenge!.hashCode);

  @override
  String toString() =>
      'ConnectLoginInitRsp[token=$token, expiresAt=$expiresAt, frontendApiUrl=$frontendApiUrl, loginAllowed=$loginAllowed, flags=$flags, newClientEnvHandle=$newClientEnvHandle, conditionalUIChallenge=$conditionalUIChallenge]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'token'] = this.token;
    json[r'expiresAt'] = this.expiresAt;
    json[r'frontendApiUrl'] = this.frontendApiUrl;
    json[r'loginAllowed'] = this.loginAllowed;
    json[r'flags'] = this.flags;
    if (this.newClientEnvHandle != null) {
      json[r'newClientEnvHandle'] = this.newClientEnvHandle;
    } else {
      json[r'newClientEnvHandle'] = null;
    }
    if (this.conditionalUIChallenge != null) {
      json[r'conditionalUIChallenge'] = this.conditionalUIChallenge;
    } else {
      json[r'conditionalUIChallenge'] = null;
    }
    return json;
  }

  /// Returns a new [ConnectLoginInitRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectLoginInitRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectLoginInitRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectLoginInitRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectLoginInitRsp(
        token: mapValueOfType<String>(json, r'token')!,
        expiresAt: mapValueOfType<int>(json, r'expiresAt')!,
        frontendApiUrl: mapValueOfType<String>(json, r'frontendApiUrl')!,
        loginAllowed: mapValueOfType<bool>(json, r'loginAllowed')!,
        flags: mapCastOfType<String, String>(json, r'flags')!,
        newClientEnvHandle: mapValueOfType<String>(json, r'newClientEnvHandle'),
        conditionalUIChallenge:
            mapValueOfType<String>(json, r'conditionalUIChallenge'),
      );
    }
    return null;
  }

  static List<ConnectLoginInitRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginInitRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginInitRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectLoginInitRsp> mapFromJson(dynamic json) {
    final map = <String, ConnectLoginInitRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectLoginInitRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectLoginInitRsp-objects as value to a dart map
  static Map<String, List<ConnectLoginInitRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectLoginInitRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectLoginInitRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'token',
    'expiresAt',
    'frontendApiUrl',
    'loginAllowed',
    'flags',
  };
}

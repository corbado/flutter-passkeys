//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProcessInitRsp {
  /// Returns a new [ProcessInitRsp] instance.
  ProcessInitRsp({
    required this.token,
    required this.expiresAt,
    required this.processResponse,
    this.newClientEnvHandle,
  });

  String token;

  int expiresAt;

  ProcessResponse processResponse;

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
      other is ProcessInitRsp &&
          other.token == token &&
          other.expiresAt == expiresAt &&
          other.processResponse == processResponse &&
          other.newClientEnvHandle == newClientEnvHandle;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (token.hashCode) +
      (expiresAt.hashCode) +
      (processResponse.hashCode) +
      (newClientEnvHandle == null ? 0 : newClientEnvHandle!.hashCode);

  @override
  String toString() =>
      'ProcessInitRsp[token=$token, expiresAt=$expiresAt, processResponse=$processResponse, newClientEnvHandle=$newClientEnvHandle]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'token'] = this.token;
    json[r'expiresAt'] = this.expiresAt;
    json[r'processResponse'] = this.processResponse;
    if (this.newClientEnvHandle != null) {
      json[r'newClientEnvHandle'] = this.newClientEnvHandle;
    } else {
      json[r'newClientEnvHandle'] = null;
    }
    return json;
  }

  /// Returns a new [ProcessInitRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProcessInitRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProcessInitRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProcessInitRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProcessInitRsp(
        token: mapValueOfType<String>(json, r'token')!,
        expiresAt: mapValueOfType<int>(json, r'expiresAt')!,
        processResponse: ProcessResponse.fromJson(json[r'processResponse'])!,
        newClientEnvHandle: mapValueOfType<String>(json, r'newClientEnvHandle'),
      );
    }
    return null;
  }

  static List<ProcessInitRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProcessInitRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProcessInitRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProcessInitRsp> mapFromJson(dynamic json) {
    final map = <String, ProcessInitRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProcessInitRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProcessInitRsp-objects as value to a dart map
  static Map<String, List<ProcessInitRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProcessInitRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProcessInitRsp.listFromJson(
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
    'processResponse',
  };
}

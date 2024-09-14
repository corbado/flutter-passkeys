//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectLoginFinishRsp {
  /// Returns a new [ConnectLoginFinishRsp] instance.
  ConnectLoginFinishRsp({
    required this.passkeyOperation,
    required this.session,
  });

  PasskeyOperation passkeyOperation;

  String session;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectLoginFinishRsp &&
          other.passkeyOperation == passkeyOperation &&
          other.session == session;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (passkeyOperation.hashCode) + (session.hashCode);

  @override
  String toString() =>
      'ConnectLoginFinishRsp[passkeyOperation=$passkeyOperation, session=$session]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'passkeyOperation'] = this.passkeyOperation;
    json[r'session'] = this.session;
    return json;
  }

  /// Returns a new [ConnectLoginFinishRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectLoginFinishRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectLoginFinishRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectLoginFinishRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectLoginFinishRsp(
        passkeyOperation: PasskeyOperation.fromJson(json[r'passkeyOperation'])!,
        session: mapValueOfType<String>(json, r'session')!,
      );
    }
    return null;
  }

  static List<ConnectLoginFinishRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginFinishRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginFinishRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectLoginFinishRsp> mapFromJson(dynamic json) {
    final map = <String, ConnectLoginFinishRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectLoginFinishRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectLoginFinishRsp-objects as value to a dart map
  static Map<String, List<ConnectLoginFinishRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectLoginFinishRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectLoginFinishRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'passkeyOperation',
    'session',
  };
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectManageListReq {
  /// Returns a new [ConnectManageListReq] instance.
  ConnectManageListReq({
    required this.connectToken,
  });

  String connectToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectManageListReq && other.connectToken == connectToken;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (connectToken.hashCode);

  @override
  String toString() => 'ConnectManageListReq[connectToken=$connectToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'connectToken'] = this.connectToken;
    return json;
  }

  /// Returns a new [ConnectManageListReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectManageListReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectManageListReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectManageListReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectManageListReq(
        connectToken: mapValueOfType<String>(json, r'connectToken')!,
      );
    }
    return null;
  }

  static List<ConnectManageListReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectManageListReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectManageListReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectManageListReq> mapFromJson(dynamic json) {
    final map = <String, ConnectManageListReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectManageListReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectManageListReq-objects as value to a dart map
  static Map<String, List<ConnectManageListReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectManageListReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectManageListReq.listFromJson(
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
  };
}

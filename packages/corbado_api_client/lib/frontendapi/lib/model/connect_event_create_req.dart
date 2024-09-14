//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectEventCreateReq {
  /// Returns a new [ConnectEventCreateReq] instance.
  ConnectEventCreateReq({
    required this.eventType,
  });

  PasskeyEventType eventType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectEventCreateReq && other.eventType == eventType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (eventType.hashCode);

  @override
  String toString() => 'ConnectEventCreateReq[eventType=$eventType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'eventType'] = this.eventType;
    return json;
  }

  /// Returns a new [ConnectEventCreateReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectEventCreateReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectEventCreateReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectEventCreateReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectEventCreateReq(
        eventType: PasskeyEventType.fromJson(json[r'eventType'])!,
      );
    }
    return null;
  }

  static List<ConnectEventCreateReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectEventCreateReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectEventCreateReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectEventCreateReq> mapFromJson(dynamic json) {
    final map = <String, ConnectEventCreateReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectEventCreateReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectEventCreateReq-objects as value to a dart map
  static Map<String, List<ConnectEventCreateReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectEventCreateReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectEventCreateReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'eventType',
  };
}

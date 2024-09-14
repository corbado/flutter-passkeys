//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MeRefreshRsp {
  /// Returns a new [MeRefreshRsp] instance.
  MeRefreshRsp({
    required this.shortSession,
  });

  String shortSession;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeRefreshRsp && other.shortSession == shortSession;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (shortSession.hashCode);

  @override
  String toString() => 'MeRefreshRsp[shortSession=$shortSession]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'shortSession'] = this.shortSession;
    return json;
  }

  /// Returns a new [MeRefreshRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MeRefreshRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MeRefreshRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MeRefreshRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MeRefreshRsp(
        shortSession: mapValueOfType<String>(json, r'shortSession')!,
      );
    }
    return null;
  }

  static List<MeRefreshRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MeRefreshRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MeRefreshRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MeRefreshRsp> mapFromJson(dynamic json) {
    final map = <String, MeRefreshRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MeRefreshRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MeRefreshRsp-objects as value to a dart map
  static Map<String, List<MeRefreshRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MeRefreshRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MeRefreshRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'shortSession',
  };
}

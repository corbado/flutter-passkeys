//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MeIdentifierCreateReq {
  /// Returns a new [MeIdentifierCreateReq] instance.
  MeIdentifierCreateReq({
    required this.identifierType,
    required this.value,
  });

  LoginIdentifierType identifierType;

  String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeIdentifierCreateReq &&
          other.identifierType == identifierType &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifierType.hashCode) + (value.hashCode);

  @override
  String toString() =>
      'MeIdentifierCreateReq[identifierType=$identifierType, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifierType'] = this.identifierType;
    json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [MeIdentifierCreateReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MeIdentifierCreateReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MeIdentifierCreateReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MeIdentifierCreateReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MeIdentifierCreateReq(
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<MeIdentifierCreateReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MeIdentifierCreateReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MeIdentifierCreateReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MeIdentifierCreateReq> mapFromJson(dynamic json) {
    final map = <String, MeIdentifierCreateReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MeIdentifierCreateReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MeIdentifierCreateReq-objects as value to a dart map
  static Map<String, List<MeIdentifierCreateReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MeIdentifierCreateReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MeIdentifierCreateReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifierType',
    'value',
  };
}

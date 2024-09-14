//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MeIdentifierUpdateReq {
  /// Returns a new [MeIdentifierUpdateReq] instance.
  MeIdentifierUpdateReq({
    required this.identifierID,
    required this.identifierType,
    required this.value,
  });

  String identifierID;

  LoginIdentifierType identifierType;

  String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeIdentifierUpdateReq &&
          other.identifierID == identifierID &&
          other.identifierType == identifierType &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifierID.hashCode) + (identifierType.hashCode) + (value.hashCode);

  @override
  String toString() =>
      'MeIdentifierUpdateReq[identifierID=$identifierID, identifierType=$identifierType, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifierID'] = this.identifierID;
    json[r'identifierType'] = this.identifierType;
    json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [MeIdentifierUpdateReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MeIdentifierUpdateReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MeIdentifierUpdateReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MeIdentifierUpdateReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MeIdentifierUpdateReq(
        identifierID: mapValueOfType<String>(json, r'identifierID')!,
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<MeIdentifierUpdateReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MeIdentifierUpdateReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MeIdentifierUpdateReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MeIdentifierUpdateReq> mapFromJson(dynamic json) {
    final map = <String, MeIdentifierUpdateReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MeIdentifierUpdateReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MeIdentifierUpdateReq-objects as value to a dart map
  static Map<String, List<MeIdentifierUpdateReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MeIdentifierUpdateReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MeIdentifierUpdateReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifierID',
    'identifierType',
    'value',
  };
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MeIdentifierVerifyStartReq {
  /// Returns a new [MeIdentifierVerifyStartReq] instance.
  MeIdentifierVerifyStartReq({
    required this.identifierID,
    required this.clientInformation,
  });

  String identifierID;

  ClientInformation clientInformation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeIdentifierVerifyStartReq &&
          other.identifierID == identifierID &&
          other.clientInformation == clientInformation;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifierID.hashCode) + (clientInformation.hashCode);

  @override
  String toString() =>
      'MeIdentifierVerifyStartReq[identifierID=$identifierID, clientInformation=$clientInformation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifierID'] = this.identifierID;
    json[r'clientInformation'] = this.clientInformation;
    return json;
  }

  /// Returns a new [MeIdentifierVerifyStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MeIdentifierVerifyStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MeIdentifierVerifyStartReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MeIdentifierVerifyStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MeIdentifierVerifyStartReq(
        identifierID: mapValueOfType<String>(json, r'identifierID')!,
        clientInformation:
            ClientInformation.fromJson(json[r'clientInformation'])!,
      );
    }
    return null;
  }

  static List<MeIdentifierVerifyStartReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MeIdentifierVerifyStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MeIdentifierVerifyStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MeIdentifierVerifyStartReq> mapFromJson(dynamic json) {
    final map = <String, MeIdentifierVerifyStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MeIdentifierVerifyStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MeIdentifierVerifyStartReq-objects as value to a dart map
  static Map<String, List<MeIdentifierVerifyStartReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MeIdentifierVerifyStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MeIdentifierVerifyStartReq.listFromJson(
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
    'clientInformation',
  };
}

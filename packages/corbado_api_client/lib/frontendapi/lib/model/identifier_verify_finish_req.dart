//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IdentifierVerifyFinishReq {
  /// Returns a new [IdentifierVerifyFinishReq] instance.
  IdentifierVerifyFinishReq({
    required this.code,
    required this.identifierType,
    required this.verificationType,
    required this.isNewDevice,
  });

  String code;

  LoginIdentifierType identifierType;

  VerificationMethod verificationType;

  bool isNewDevice;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentifierVerifyFinishReq &&
          other.code == code &&
          other.identifierType == identifierType &&
          other.verificationType == verificationType &&
          other.isNewDevice == isNewDevice;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) +
      (identifierType.hashCode) +
      (verificationType.hashCode) +
      (isNewDevice.hashCode);

  @override
  String toString() =>
      'IdentifierVerifyFinishReq[code=$code, identifierType=$identifierType, verificationType=$verificationType, isNewDevice=$isNewDevice]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'identifierType'] = this.identifierType;
    json[r'verificationType'] = this.verificationType;
    json[r'isNewDevice'] = this.isNewDevice;
    return json;
  }

  /// Returns a new [IdentifierVerifyFinishReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IdentifierVerifyFinishReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IdentifierVerifyFinishReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IdentifierVerifyFinishReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IdentifierVerifyFinishReq(
        code: mapValueOfType<String>(json, r'code')!,
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        verificationType:
            VerificationMethod.fromJson(json[r'verificationType'])!,
        isNewDevice: mapValueOfType<bool>(json, r'isNewDevice')!,
      );
    }
    return null;
  }

  static List<IdentifierVerifyFinishReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IdentifierVerifyFinishReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IdentifierVerifyFinishReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IdentifierVerifyFinishReq> mapFromJson(dynamic json) {
    final map = <String, IdentifierVerifyFinishReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IdentifierVerifyFinishReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IdentifierVerifyFinishReq-objects as value to a dart map
  static Map<String, List<IdentifierVerifyFinishReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IdentifierVerifyFinishReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IdentifierVerifyFinishReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'code',
    'identifierType',
    'verificationType',
    'isNewDevice',
  };
}

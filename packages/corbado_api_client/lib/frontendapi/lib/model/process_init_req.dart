//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProcessInitReq {
  /// Returns a new [ProcessInitReq] instance.
  ProcessInitReq({
    required this.clientInformation,
    this.passkeyAppendShown,
    this.optOutOfPasskeyAppendAfterHybrid,
    this.preferredBlock,
  });

  ClientInformation clientInformation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? passkeyAppendShown;

  /// deprecated
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? optOutOfPasskeyAppendAfterHybrid;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BlockType? preferredBlock;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessInitReq &&
          other.clientInformation == clientInformation &&
          other.passkeyAppendShown == passkeyAppendShown &&
          other.optOutOfPasskeyAppendAfterHybrid ==
              optOutOfPasskeyAppendAfterHybrid &&
          other.preferredBlock == preferredBlock;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clientInformation.hashCode) +
      (passkeyAppendShown == null ? 0 : passkeyAppendShown!.hashCode) +
      (optOutOfPasskeyAppendAfterHybrid == null
          ? 0
          : optOutOfPasskeyAppendAfterHybrid!.hashCode) +
      (preferredBlock == null ? 0 : preferredBlock!.hashCode);

  @override
  String toString() =>
      'ProcessInitReq[clientInformation=$clientInformation, passkeyAppendShown=$passkeyAppendShown, optOutOfPasskeyAppendAfterHybrid=$optOutOfPasskeyAppendAfterHybrid, preferredBlock=$preferredBlock]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'clientInformation'] = this.clientInformation;
    if (this.passkeyAppendShown != null) {
      json[r'passkeyAppendShown'] = this.passkeyAppendShown;
    } else {
      json[r'passkeyAppendShown'] = null;
    }
    if (this.optOutOfPasskeyAppendAfterHybrid != null) {
      json[r'optOutOfPasskeyAppendAfterHybrid'] =
          this.optOutOfPasskeyAppendAfterHybrid;
    } else {
      json[r'optOutOfPasskeyAppendAfterHybrid'] = null;
    }
    if (this.preferredBlock != null) {
      json[r'preferredBlock'] = this.preferredBlock;
    } else {
      json[r'preferredBlock'] = null;
    }
    return json;
  }

  /// Returns a new [ProcessInitReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProcessInitReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProcessInitReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProcessInitReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProcessInitReq(
        clientInformation:
            ClientInformation.fromJson(json[r'clientInformation'])!,
        passkeyAppendShown: mapValueOfType<int>(json, r'passkeyAppendShown'),
        optOutOfPasskeyAppendAfterHybrid:
            mapValueOfType<bool>(json, r'optOutOfPasskeyAppendAfterHybrid'),
        preferredBlock: BlockType.fromJson(json[r'preferredBlock']),
      );
    }
    return null;
  }

  static List<ProcessInitReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProcessInitReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProcessInitReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProcessInitReq> mapFromJson(dynamic json) {
    final map = <String, ProcessInitReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProcessInitReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProcessInitReq-objects as value to a dart map
  static Map<String, List<ProcessInitReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProcessInitReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProcessInitReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'clientInformation',
  };
}

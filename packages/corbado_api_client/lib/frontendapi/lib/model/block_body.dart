//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlockBody {
  /// Returns a new [BlockBody] instance.
  BlockBody({
    required this.block,
    required this.authType,
    required this.data,
    this.alternatives = const [],
    this.error,
    this.continueOnOtherDevice,
  });

  BlockType block;

  AuthType authType;

  BlockBodyData data;

  List<BlockBody> alternatives;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ContinueOnOtherDevice? continueOnOtherDevice;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockBody &&
          other.block == block &&
          other.authType == authType &&
          other.data == data &&
          _deepEquality.equals(other.alternatives, alternatives) &&
          other.error == error &&
          other.continueOnOtherDevice == continueOnOtherDevice;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (block.hashCode) +
      (authType.hashCode) +
      (data.hashCode) +
      (alternatives.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (continueOnOtherDevice == null ? 0 : continueOnOtherDevice!.hashCode);

  @override
  String toString() =>
      'BlockBody[block=$block, authType=$authType, data=$data, alternatives=$alternatives, error=$error, continueOnOtherDevice=$continueOnOtherDevice]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'block'] = this.block;
    json[r'authType'] = this.authType;
    json[r'data'] = this.data;
    json[r'alternatives'] = this.alternatives;
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.continueOnOtherDevice != null) {
      json[r'continueOnOtherDevice'] = this.continueOnOtherDevice;
    } else {
      json[r'continueOnOtherDevice'] = null;
    }
    return json;
  }

  /// Returns a new [BlockBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BlockBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BlockBody[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BlockBody[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BlockBody(
        block: BlockType.fromJson(json[r'block'])!,
        authType: AuthType.fromJson(json[r'authType'])!,
        data: BlockBodyData.fromJson(json[r'data'])!,
        alternatives: BlockBody.listFromJson(json[r'alternatives']),
        error: RequestError.fromJson(json[r'error']),
        continueOnOtherDevice:
            ContinueOnOtherDevice.fromJson(json[r'continueOnOtherDevice']),
      );
    }
    return null;
  }

  static List<BlockBody> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BlockBody> mapFromJson(dynamic json) {
    final map = <String, BlockBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BlockBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BlockBody-objects as value to a dart map
  static Map<String, List<BlockBody>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BlockBody>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BlockBody.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'block',
    'authType',
    'data',
  };
}

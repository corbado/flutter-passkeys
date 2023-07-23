//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyAppendFinishRspAllOfData {
  /// Returns a new [PassKeyAppendFinishRspAllOfData] instance.
  PassKeyAppendFinishRspAllOfData({
    required this.redirectURL,
  });

  String redirectURL;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassKeyAppendFinishRspAllOfData &&
     other.redirectURL == redirectURL;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (redirectURL.hashCode);

  @override
  String toString() => 'PassKeyAppendFinishRspAllOfData[redirectURL=$redirectURL]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'redirectURL'] = this.redirectURL;
    return json;
  }

  /// Returns a new [PassKeyAppendFinishRspAllOfData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyAppendFinishRspAllOfData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassKeyAppendFinishRspAllOfData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassKeyAppendFinishRspAllOfData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyAppendFinishRspAllOfData(
        redirectURL: mapValueOfType<String>(json, r'redirectURL')!,
      );
    }
    return null;
  }

  static List<PassKeyAppendFinishRspAllOfData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassKeyAppendFinishRspAllOfData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyAppendFinishRspAllOfData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyAppendFinishRspAllOfData> mapFromJson(dynamic json) {
    final map = <String, PassKeyAppendFinishRspAllOfData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyAppendFinishRspAllOfData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyAppendFinishRspAllOfData-objects as value to a dart map
  static Map<String, List<PassKeyAppendFinishRspAllOfData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassKeyAppendFinishRspAllOfData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PassKeyAppendFinishRspAllOfData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'redirectURL',
  };
}


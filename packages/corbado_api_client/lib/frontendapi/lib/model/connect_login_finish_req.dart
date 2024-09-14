//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectLoginFinishReq {
  /// Returns a new [ConnectLoginFinishReq] instance.
  ConnectLoginFinishReq({
    required this.isConditionalUI,
    required this.assertionResponse,
  });

  bool isConditionalUI;

  String assertionResponse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectLoginFinishReq &&
          other.isConditionalUI == isConditionalUI &&
          other.assertionResponse == assertionResponse;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (isConditionalUI.hashCode) + (assertionResponse.hashCode);

  @override
  String toString() =>
      'ConnectLoginFinishReq[isConditionalUI=$isConditionalUI, assertionResponse=$assertionResponse]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'isConditionalUI'] = this.isConditionalUI;
    json[r'assertionResponse'] = this.assertionResponse;
    return json;
  }

  /// Returns a new [ConnectLoginFinishReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectLoginFinishReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectLoginFinishReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectLoginFinishReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectLoginFinishReq(
        isConditionalUI: mapValueOfType<bool>(json, r'isConditionalUI')!,
        assertionResponse: mapValueOfType<String>(json, r'assertionResponse')!,
      );
    }
    return null;
  }

  static List<ConnectLoginFinishReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginFinishReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginFinishReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectLoginFinishReq> mapFromJson(dynamic json) {
    final map = <String, ConnectLoginFinishReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectLoginFinishReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectLoginFinishReq-objects as value to a dart map
  static Map<String, List<ConnectLoginFinishReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectLoginFinishReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectLoginFinishReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'isConditionalUI',
    'assertionResponse',
  };
}

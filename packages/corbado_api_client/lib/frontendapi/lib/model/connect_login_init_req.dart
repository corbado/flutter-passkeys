//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectLoginInitReq {
  /// Returns a new [ConnectLoginInitReq] instance.
  ConnectLoginInitReq({
    required this.clientInformation,
    this.flags = const {},
  });

  ClientInformationV2 clientInformation;

  Map<String, String> flags;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectLoginInitReq &&
          other.clientInformation == clientInformation &&
          _deepEquality.equals(other.flags, flags);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clientInformation.hashCode) + (flags.hashCode);

  @override
  String toString() =>
      'ConnectLoginInitReq[clientInformation=$clientInformation, flags=$flags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'clientInformation'] = this.clientInformation;
    json[r'flags'] = this.flags;
    return json;
  }

  /// Returns a new [ConnectLoginInitReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectLoginInitReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ConnectLoginInitReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ConnectLoginInitReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConnectLoginInitReq(
        clientInformation:
            ClientInformationV2.fromJson(json[r'clientInformation'])!,
        flags: mapCastOfType<String, String>(json, r'flags')!,
      );
    }
    return null;
  }

  static List<ConnectLoginInitReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ConnectLoginInitReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectLoginInitReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectLoginInitReq> mapFromJson(dynamic json) {
    final map = <String, ConnectLoginInitReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectLoginInitReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectLoginInitReq-objects as value to a dart map
  static Map<String, List<ConnectLoginInitReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ConnectLoginInitReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectLoginInitReq.listFromJson(
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
    'flags',
  };
}

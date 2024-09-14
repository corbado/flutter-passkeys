//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Identifier {
  /// Returns a new [Identifier] instance.
  Identifier({
    required this.id,
    required this.value,
    required this.type,
    required this.status,
  });

  String id;

  String value;

  LoginIdentifierType type;

  String status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Identifier &&
          other.id == id &&
          other.value == value &&
          other.type == type &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (value.hashCode) + (type.hashCode) + (status.hashCode);

  @override
  String toString() =>
      'Identifier[id=$id, value=$value, type=$type, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'value'] = this.value;
    json[r'type'] = this.type;
    json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [Identifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Identifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Identifier[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Identifier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Identifier(
        id: mapValueOfType<String>(json, r'id')!,
        value: mapValueOfType<String>(json, r'value')!,
        type: LoginIdentifierType.fromJson(json[r'type'])!,
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<Identifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Identifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Identifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Identifier> mapFromJson(dynamic json) {
    final map = <String, Identifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Identifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Identifier-objects as value to a dart map
  static Map<String, List<Identifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Identifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Identifier.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'value',
    'type',
    'status',
  };
}

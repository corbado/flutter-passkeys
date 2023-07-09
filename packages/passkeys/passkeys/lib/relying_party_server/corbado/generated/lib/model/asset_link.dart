//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssetLink {
  /// Returns a new [AssetLink] instance.
  AssetLink({
    this.relation = const [],
    required this.target,
  });

  List<String> relation;

  AssetLinkTarget target;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssetLink &&
     other.relation == relation &&
     other.target == target;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (relation.hashCode) +
    (target.hashCode);

  @override
  String toString() => 'AssetLink[relation=$relation, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'relation'] = this.relation;
      json[r'target'] = this.target;
    return json;
  }

  /// Returns a new [AssetLink] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssetLink? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AssetLink[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AssetLink[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AssetLink(
        relation: json[r'relation'] is List
            ? (json[r'relation'] as List).cast<String>()
            : const [],
        target: AssetLinkTarget.fromJson(json[r'target'])!,
      );
    }
    return null;
  }

  static List<AssetLink>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssetLink>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssetLink.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssetLink> mapFromJson(dynamic json) {
    final map = <String, AssetLink>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetLink.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssetLink-objects as value to a dart map
  static Map<String, List<AssetLink>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssetLink>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetLink.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'relation',
    'target',
  };
}


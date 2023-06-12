//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppleAppSiteAssociationRspWebcredentials {
  /// Returns a new [AppleAppSiteAssociationRspWebcredentials] instance.
  AppleAppSiteAssociationRspWebcredentials({
    this.apps = const [],
  });

  List<String> apps;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppleAppSiteAssociationRspWebcredentials &&
     other.apps == apps;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (apps.hashCode);

  @override
  String toString() => 'AppleAppSiteAssociationRspWebcredentials[apps=$apps]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'apps'] = this.apps;
    return json;
  }

  /// Returns a new [AppleAppSiteAssociationRspWebcredentials] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppleAppSiteAssociationRspWebcredentials? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppleAppSiteAssociationRspWebcredentials[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppleAppSiteAssociationRspWebcredentials[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppleAppSiteAssociationRspWebcredentials(
        apps: json[r'apps'] is List
            ? (json[r'apps'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<AppleAppSiteAssociationRspWebcredentials>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppleAppSiteAssociationRspWebcredentials>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppleAppSiteAssociationRspWebcredentials.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppleAppSiteAssociationRspWebcredentials> mapFromJson(dynamic json) {
    final map = <String, AppleAppSiteAssociationRspWebcredentials>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspWebcredentials.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppleAppSiteAssociationRspWebcredentials-objects as value to a dart map
  static Map<String, List<AppleAppSiteAssociationRspWebcredentials>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppleAppSiteAssociationRspWebcredentials>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspWebcredentials.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'apps',
  };
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppleAppSiteAssociationRspApplinks {
  /// Returns a new [AppleAppSiteAssociationRspApplinks] instance.
  AppleAppSiteAssociationRspApplinks({
    this.details = const [],
  });

  List<AppleAppSiteAssociationRspApplinksDetailsInner> details;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppleAppSiteAssociationRspApplinks &&
     other.details == details;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (details.hashCode);

  @override
  String toString() => 'AppleAppSiteAssociationRspApplinks[details=$details]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'details'] = this.details;
    return json;
  }

  /// Returns a new [AppleAppSiteAssociationRspApplinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppleAppSiteAssociationRspApplinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppleAppSiteAssociationRspApplinks[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppleAppSiteAssociationRspApplinks[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppleAppSiteAssociationRspApplinks(
        details: AppleAppSiteAssociationRspApplinksDetailsInner.listFromJson(json[r'details'])!,
      );
    }
    return null;
  }

  static List<AppleAppSiteAssociationRspApplinks>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppleAppSiteAssociationRspApplinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppleAppSiteAssociationRspApplinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppleAppSiteAssociationRspApplinks> mapFromJson(dynamic json) {
    final map = <String, AppleAppSiteAssociationRspApplinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspApplinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppleAppSiteAssociationRspApplinks-objects as value to a dart map
  static Map<String, List<AppleAppSiteAssociationRspApplinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppleAppSiteAssociationRspApplinks>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspApplinks.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'details',
  };
}


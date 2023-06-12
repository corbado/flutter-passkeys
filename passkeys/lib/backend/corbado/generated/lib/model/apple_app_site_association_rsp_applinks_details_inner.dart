//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppleAppSiteAssociationRspApplinksDetailsInner {
  /// Returns a new [AppleAppSiteAssociationRspApplinksDetailsInner] instance.
  AppleAppSiteAssociationRspApplinksDetailsInner({
    required this.appID,
    this.paths = const [],
  });

  String appID;

  List<String> paths;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppleAppSiteAssociationRspApplinksDetailsInner &&
     other.appID == appID &&
     other.paths == paths;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (appID.hashCode) +
    (paths.hashCode);

  @override
  String toString() => 'AppleAppSiteAssociationRspApplinksDetailsInner[appID=$appID, paths=$paths]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'appID'] = this.appID;
      json[r'paths'] = this.paths;
    return json;
  }

  /// Returns a new [AppleAppSiteAssociationRspApplinksDetailsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppleAppSiteAssociationRspApplinksDetailsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppleAppSiteAssociationRspApplinksDetailsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppleAppSiteAssociationRspApplinksDetailsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppleAppSiteAssociationRspApplinksDetailsInner(
        appID: mapValueOfType<String>(json, r'appID')!,
        paths: json[r'paths'] is List
            ? (json[r'paths'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<AppleAppSiteAssociationRspApplinksDetailsInner>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppleAppSiteAssociationRspApplinksDetailsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppleAppSiteAssociationRspApplinksDetailsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppleAppSiteAssociationRspApplinksDetailsInner> mapFromJson(dynamic json) {
    final map = <String, AppleAppSiteAssociationRspApplinksDetailsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspApplinksDetailsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppleAppSiteAssociationRspApplinksDetailsInner-objects as value to a dart map
  static Map<String, List<AppleAppSiteAssociationRspApplinksDetailsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppleAppSiteAssociationRspApplinksDetailsInner>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppleAppSiteAssociationRspApplinksDetailsInner.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'appID',
    'paths',
  };
}


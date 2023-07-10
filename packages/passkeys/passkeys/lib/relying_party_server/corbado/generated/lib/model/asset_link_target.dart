//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssetLinkTarget {
  /// Returns a new [AssetLinkTarget] instance.
  AssetLinkTarget({
    required this.namespace,
    this.packageName,
    this.site,
    this.sha256CertFingerprints = const [],
  });

  String namespace;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? packageName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? site;

  List<String> sha256CertFingerprints;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssetLinkTarget &&
     other.namespace == namespace &&
     other.packageName == packageName &&
     other.site == site &&
     other.sha256CertFingerprints == sha256CertFingerprints;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (namespace.hashCode) +
    (packageName == null ? 0 : packageName!.hashCode) +
    (site == null ? 0 : site!.hashCode) +
    (sha256CertFingerprints.hashCode);

  @override
  String toString() => 'AssetLinkTarget[namespace=$namespace, packageName=$packageName, site=$site, sha256CertFingerprints=$sha256CertFingerprints]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'namespace'] = this.namespace;
    if (this.packageName != null) {
      json[r'package_name'] = this.packageName;
    } else {
      json[r'package_name'] = null;
    }
    if (this.site != null) {
      json[r'site'] = this.site;
    } else {
      json[r'site'] = null;
    }
      json[r'sha256_cert_fingerprints'] = this.sha256CertFingerprints;
    return json;
  }

  /// Returns a new [AssetLinkTarget] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssetLinkTarget? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AssetLinkTarget[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AssetLinkTarget[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AssetLinkTarget(
        namespace: mapValueOfType<String>(json, r'namespace')!,
        packageName: mapValueOfType<String>(json, r'package_name'),
        site: mapValueOfType<String>(json, r'site'),
        sha256CertFingerprints: json[r'sha256_cert_fingerprints'] is List
            ? (json[r'sha256_cert_fingerprints'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<AssetLinkTarget>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssetLinkTarget>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssetLinkTarget.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssetLinkTarget> mapFromJson(dynamic json) {
    final map = <String, AssetLinkTarget>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetLinkTarget.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssetLinkTarget-objects as value to a dart map
  static Map<String, List<AssetLinkTarget>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssetLinkTarget>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetLinkTarget.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'namespace',
  };
}


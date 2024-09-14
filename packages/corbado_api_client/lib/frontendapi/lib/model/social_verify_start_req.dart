//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SocialVerifyStartReq {
  /// Returns a new [SocialVerifyStartReq] instance.
  SocialVerifyStartReq({
    required this.providerType,
    required this.redirectUrl,
    required this.authType,
  });

  SocialProviderType providerType;

  String redirectUrl;

  AuthType authType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialVerifyStartReq &&
          other.providerType == providerType &&
          other.redirectUrl == redirectUrl &&
          other.authType == authType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (providerType.hashCode) + (redirectUrl.hashCode) + (authType.hashCode);

  @override
  String toString() =>
      'SocialVerifyStartReq[providerType=$providerType, redirectUrl=$redirectUrl, authType=$authType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'providerType'] = this.providerType;
    json[r'redirectUrl'] = this.redirectUrl;
    json[r'authType'] = this.authType;
    return json;
  }

  /// Returns a new [SocialVerifyStartReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SocialVerifyStartReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SocialVerifyStartReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SocialVerifyStartReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SocialVerifyStartReq(
        providerType: SocialProviderType.fromJson(json[r'providerType'])!,
        redirectUrl: mapValueOfType<String>(json, r'redirectUrl')!,
        authType: AuthType.fromJson(json[r'authType'])!,
      );
    }
    return null;
  }

  static List<SocialVerifyStartReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SocialVerifyStartReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SocialVerifyStartReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SocialVerifyStartReq> mapFromJson(dynamic json) {
    final map = <String, SocialVerifyStartReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SocialVerifyStartReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SocialVerifyStartReq-objects as value to a dart map
  static Map<String, List<SocialVerifyStartReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SocialVerifyStartReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SocialVerifyStartReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'providerType',
    'redirectUrl',
    'authType',
  };
}

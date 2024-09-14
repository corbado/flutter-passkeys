//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SocialAccount {
  /// Returns a new [SocialAccount] instance.
  SocialAccount({
    required this.providerType,
    required this.identifierValue,
    required this.avatarUrl,
    required this.fullName,
  });

  SocialProviderType providerType;

  String identifierValue;

  String avatarUrl;

  String fullName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialAccount &&
          other.providerType == providerType &&
          other.identifierValue == identifierValue &&
          other.avatarUrl == avatarUrl &&
          other.fullName == fullName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (providerType.hashCode) +
      (identifierValue.hashCode) +
      (avatarUrl.hashCode) +
      (fullName.hashCode);

  @override
  String toString() =>
      'SocialAccount[providerType=$providerType, identifierValue=$identifierValue, avatarUrl=$avatarUrl, fullName=$fullName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'providerType'] = this.providerType;
    json[r'identifierValue'] = this.identifierValue;
    json[r'avatarUrl'] = this.avatarUrl;
    json[r'fullName'] = this.fullName;
    return json;
  }

  /// Returns a new [SocialAccount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SocialAccount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SocialAccount[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SocialAccount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SocialAccount(
        providerType: SocialProviderType.fromJson(json[r'providerType'])!,
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl')!,
        fullName: mapValueOfType<String>(json, r'fullName')!,
      );
    }
    return null;
  }

  static List<SocialAccount> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SocialAccount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SocialAccount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SocialAccount> mapFromJson(dynamic json) {
    final map = <String, SocialAccount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SocialAccount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SocialAccount-objects as value to a dart map
  static Map<String, List<SocialAccount>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SocialAccount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SocialAccount.listFromJson(
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
    'identifierValue',
    'avatarUrl',
    'fullName',
  };
}

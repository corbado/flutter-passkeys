//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ShortSession {
  /// Returns a new [ShortSession] instance.
  ShortSession({
    required this.key,
    required this.value,
    required this.domain,
    required this.path,
    required this.secure,
    required this.expires,
    required this.sameSite,
  });

  String key;

  String value;

  String domain;

  String path;

  bool secure;

  String expires;

  String sameSite;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ShortSession &&
     other.key == key &&
     other.value == value &&
     other.domain == domain &&
     other.path == path &&
     other.secure == secure &&
     other.expires == expires &&
     other.sameSite == sameSite;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key.hashCode) +
    (value.hashCode) +
    (domain.hashCode) +
    (path.hashCode) +
    (secure.hashCode) +
    (expires.hashCode) +
    (sameSite.hashCode);

  @override
  String toString() => 'ShortSession[key=$key, value=$value, domain=$domain, path=$path, secure=$secure, expires=$expires, sameSite=$sameSite]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'key'] = this.key;
      json[r'value'] = this.value;
      json[r'domain'] = this.domain;
      json[r'path'] = this.path;
      json[r'secure'] = this.secure;
      json[r'expires'] = this.expires;
      json[r'sameSite'] = this.sameSite;
    return json;
  }

  /// Returns a new [ShortSession] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ShortSession? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ShortSession[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ShortSession[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ShortSession(
        key: mapValueOfType<String>(json, r'key')!,
        value: mapValueOfType<String>(json, r'value')!,
        domain: mapValueOfType<String>(json, r'domain')!,
        path: mapValueOfType<String>(json, r'path')!,
        secure: mapValueOfType<bool>(json, r'secure')!,
        expires: mapValueOfType<String>(json, r'expires')!,
        sameSite: mapValueOfType<String>(json, r'sameSite')!,
      );
    }
    return null;
  }

  static List<ShortSession> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ShortSession>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ShortSession.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ShortSession> mapFromJson(dynamic json) {
    final map = <String, ShortSession>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ShortSession.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ShortSession-objects as value to a dart map
  static Map<String, List<ShortSession>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ShortSession>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ShortSession.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
    'value',
    'domain',
    'path',
    'secure',
    'expires',
    'sameSite',
  };
}


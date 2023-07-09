//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Jwk {
  /// Returns a new [Jwk] instance.
  Jwk({
    required this.alg,
    required this.kty,
    required this.use,
    required this.n,
    required this.e,
    required this.kid,
  });

  /// The specific cryptographic algorithm used with the key
  String alg;

  /// The family of cryptographic algorithms used with the key
  String kty;

  /// How the key was meant to be used; sig represents the signature
  String use;

  /// The modulus for the RSA public key
  String n;

  /// The exponent for the RSA public key
  String e;

  /// The unique identifier for the key
  String kid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Jwk &&
     other.alg == alg &&
     other.kty == kty &&
     other.use == use &&
     other.n == n &&
     other.e == e &&
     other.kid == kid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (alg.hashCode) +
    (kty.hashCode) +
    (use.hashCode) +
    (n.hashCode) +
    (e.hashCode) +
    (kid.hashCode);

  @override
  String toString() => 'Jwk[alg=$alg, kty=$kty, use=$use, n=$n, e=$e, kid=$kid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'alg'] = this.alg;
      json[r'kty'] = this.kty;
      json[r'use'] = this.use;
      json[r'n'] = this.n;
      json[r'e'] = this.e;
      json[r'kid'] = this.kid;
    return json;
  }

  /// Returns a new [Jwk] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Jwk? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Jwk[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Jwk[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Jwk(
        alg: mapValueOfType<String>(json, r'alg')!,
        kty: mapValueOfType<String>(json, r'kty')!,
        use: mapValueOfType<String>(json, r'use')!,
        n: mapValueOfType<String>(json, r'n')!,
        e: mapValueOfType<String>(json, r'e')!,
        kid: mapValueOfType<String>(json, r'kid')!,
      );
    }
    return null;
  }

  static List<Jwk>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Jwk>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Jwk.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Jwk> mapFromJson(dynamic json) {
    final map = <String, Jwk>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Jwk.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Jwk-objects as value to a dart map
  static Map<String, List<Jwk>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Jwk>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Jwk.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'alg',
    'kty',
    'use',
    'n',
    'e',
    'kid',
  };
}


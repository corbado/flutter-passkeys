//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ClientCapabilities {
  /// Returns a new [ClientCapabilities] instance.
  ClientCapabilities({
    this.conditionalCreate,
    this.conditionalMediation,
    this.hybridTransport,
    this.passkeyPlatformAuthenticator,
    this.userVerifyingPlatformAuthenticator,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? conditionalCreate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? conditionalMediation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hybridTransport;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? passkeyPlatformAuthenticator;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? userVerifyingPlatformAuthenticator;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientCapabilities &&
          other.conditionalCreate == conditionalCreate &&
          other.conditionalMediation == conditionalMediation &&
          other.hybridTransport == hybridTransport &&
          other.passkeyPlatformAuthenticator == passkeyPlatformAuthenticator &&
          other.userVerifyingPlatformAuthenticator ==
              userVerifyingPlatformAuthenticator;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditionalCreate == null ? 0 : conditionalCreate!.hashCode) +
      (conditionalMediation == null ? 0 : conditionalMediation!.hashCode) +
      (hybridTransport == null ? 0 : hybridTransport!.hashCode) +
      (passkeyPlatformAuthenticator == null
          ? 0
          : passkeyPlatformAuthenticator!.hashCode) +
      (userVerifyingPlatformAuthenticator == null
          ? 0
          : userVerifyingPlatformAuthenticator!.hashCode);

  @override
  String toString() =>
      'ClientCapabilities[conditionalCreate=$conditionalCreate, conditionalMediation=$conditionalMediation, hybridTransport=$hybridTransport, passkeyPlatformAuthenticator=$passkeyPlatformAuthenticator, userVerifyingPlatformAuthenticator=$userVerifyingPlatformAuthenticator]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.conditionalCreate != null) {
      json[r'conditionalCreate'] = this.conditionalCreate;
    } else {
      json[r'conditionalCreate'] = null;
    }
    if (this.conditionalMediation != null) {
      json[r'conditionalMediation'] = this.conditionalMediation;
    } else {
      json[r'conditionalMediation'] = null;
    }
    if (this.hybridTransport != null) {
      json[r'hybridTransport'] = this.hybridTransport;
    } else {
      json[r'hybridTransport'] = null;
    }
    if (this.passkeyPlatformAuthenticator != null) {
      json[r'passkeyPlatformAuthenticator'] = this.passkeyPlatformAuthenticator;
    } else {
      json[r'passkeyPlatformAuthenticator'] = null;
    }
    if (this.userVerifyingPlatformAuthenticator != null) {
      json[r'userVerifyingPlatformAuthenticator'] =
          this.userVerifyingPlatformAuthenticator;
    } else {
      json[r'userVerifyingPlatformAuthenticator'] = null;
    }
    return json;
  }

  /// Returns a new [ClientCapabilities] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ClientCapabilities? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ClientCapabilities[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ClientCapabilities[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ClientCapabilities(
        conditionalCreate: mapValueOfType<bool>(json, r'conditionalCreate'),
        conditionalMediation:
            mapValueOfType<bool>(json, r'conditionalMediation'),
        hybridTransport: mapValueOfType<bool>(json, r'hybridTransport'),
        passkeyPlatformAuthenticator:
            mapValueOfType<bool>(json, r'passkeyPlatformAuthenticator'),
        userVerifyingPlatformAuthenticator:
            mapValueOfType<bool>(json, r'userVerifyingPlatformAuthenticator'),
      );
    }
    return null;
  }

  static List<ClientCapabilities> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ClientCapabilities>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientCapabilities.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ClientCapabilities> mapFromJson(dynamic json) {
    final map = <String, ClientCapabilities>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClientCapabilities.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ClientCapabilities-objects as value to a dart map
  static Map<String, List<ClientCapabilities>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ClientCapabilities>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ClientCapabilities.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}

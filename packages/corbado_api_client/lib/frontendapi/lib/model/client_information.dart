//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ClientInformation {
  /// Returns a new [ClientInformation] instance.
  ClientInformation({
    this.bluetoothAvailable,
    this.clientEnvHandle,
    this.visitorId,
    this.canUsePasskeys,
    this.isUserVerifyingPlatformAuthenticatorAvailable,
    this.isConditionalMediationAvailable,
    this.clientCapabilities,
    this.javaScriptHighEntropy,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? bluetoothAvailable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clientEnvHandle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? visitorId;

  /// Deprecated, use isUserVerifyingPlatformAuthenticatorAvailable instead
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canUsePasskeys;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isUserVerifyingPlatformAuthenticatorAvailable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isConditionalMediationAvailable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ClientCapabilities? clientCapabilities;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JavaScriptHighEntropy? javaScriptHighEntropy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientInformation &&
          other.bluetoothAvailable == bluetoothAvailable &&
          other.clientEnvHandle == clientEnvHandle &&
          other.visitorId == visitorId &&
          other.canUsePasskeys == canUsePasskeys &&
          other.isUserVerifyingPlatformAuthenticatorAvailable ==
              isUserVerifyingPlatformAuthenticatorAvailable &&
          other.isConditionalMediationAvailable ==
              isConditionalMediationAvailable &&
          other.clientCapabilities == clientCapabilities &&
          other.javaScriptHighEntropy == javaScriptHighEntropy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (bluetoothAvailable == null ? 0 : bluetoothAvailable!.hashCode) +
      (clientEnvHandle == null ? 0 : clientEnvHandle!.hashCode) +
      (visitorId == null ? 0 : visitorId!.hashCode) +
      (canUsePasskeys == null ? 0 : canUsePasskeys!.hashCode) +
      (isUserVerifyingPlatformAuthenticatorAvailable == null
          ? 0
          : isUserVerifyingPlatformAuthenticatorAvailable!.hashCode) +
      (isConditionalMediationAvailable == null
          ? 0
          : isConditionalMediationAvailable!.hashCode) +
      (clientCapabilities == null ? 0 : clientCapabilities!.hashCode) +
      (javaScriptHighEntropy == null ? 0 : javaScriptHighEntropy!.hashCode);

  @override
  String toString() =>
      'ClientInformation[bluetoothAvailable=$bluetoothAvailable, clientEnvHandle=$clientEnvHandle, visitorId=$visitorId, canUsePasskeys=$canUsePasskeys, isUserVerifyingPlatformAuthenticatorAvailable=$isUserVerifyingPlatformAuthenticatorAvailable, isConditionalMediationAvailable=$isConditionalMediationAvailable, clientCapabilities=$clientCapabilities, javaScriptHighEntropy=$javaScriptHighEntropy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.bluetoothAvailable != null) {
      json[r'bluetoothAvailable'] = this.bluetoothAvailable;
    } else {
      json[r'bluetoothAvailable'] = null;
    }
    if (this.clientEnvHandle != null) {
      json[r'clientEnvHandle'] = this.clientEnvHandle;
    } else {
      json[r'clientEnvHandle'] = null;
    }
    if (this.visitorId != null) {
      json[r'visitorId'] = this.visitorId;
    } else {
      json[r'visitorId'] = null;
    }
    if (this.canUsePasskeys != null) {
      json[r'canUsePasskeys'] = this.canUsePasskeys;
    } else {
      json[r'canUsePasskeys'] = null;
    }
    if (this.isUserVerifyingPlatformAuthenticatorAvailable != null) {
      json[r'isUserVerifyingPlatformAuthenticatorAvailable'] =
          this.isUserVerifyingPlatformAuthenticatorAvailable;
    } else {
      json[r'isUserVerifyingPlatformAuthenticatorAvailable'] = null;
    }
    if (this.isConditionalMediationAvailable != null) {
      json[r'isConditionalMediationAvailable'] =
          this.isConditionalMediationAvailable;
    } else {
      json[r'isConditionalMediationAvailable'] = null;
    }
    if (this.clientCapabilities != null) {
      json[r'clientCapabilities'] = this.clientCapabilities;
    } else {
      json[r'clientCapabilities'] = null;
    }
    if (this.javaScriptHighEntropy != null) {
      json[r'javaScriptHighEntropy'] = this.javaScriptHighEntropy;
    } else {
      json[r'javaScriptHighEntropy'] = null;
    }
    return json;
  }

  /// Returns a new [ClientInformation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ClientInformation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ClientInformation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ClientInformation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ClientInformation(
        bluetoothAvailable: mapValueOfType<bool>(json, r'bluetoothAvailable'),
        clientEnvHandle: mapValueOfType<String>(json, r'clientEnvHandle'),
        visitorId: mapValueOfType<String>(json, r'visitorId'),
        canUsePasskeys: mapValueOfType<bool>(json, r'canUsePasskeys'),
        isUserVerifyingPlatformAuthenticatorAvailable: mapValueOfType<bool>(
            json, r'isUserVerifyingPlatformAuthenticatorAvailable'),
        isConditionalMediationAvailable:
            mapValueOfType<bool>(json, r'isConditionalMediationAvailable'),
        clientCapabilities:
            ClientCapabilities.fromJson(json[r'clientCapabilities']),
        javaScriptHighEntropy:
            JavaScriptHighEntropy.fromJson(json[r'javaScriptHighEntropy']),
      );
    }
    return null;
  }

  static List<ClientInformation> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ClientInformation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientInformation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ClientInformation> mapFromJson(dynamic json) {
    final map = <String, ClientInformation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClientInformation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ClientInformation-objects as value to a dart map
  static Map<String, List<ClientInformation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ClientInformation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ClientInformation.listFromJson(
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

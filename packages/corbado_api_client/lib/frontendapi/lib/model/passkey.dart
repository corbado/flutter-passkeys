//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Passkey {
  /// Returns a new [Passkey] instance.
  Passkey({
    required this.id,
    required this.credentialID,
    required this.attestationType,
    this.transport = const [],
    required this.backupEligible,
    required this.backupState,
    required this.authenticatorAAGUID,
    required this.sourceOS,
    required this.sourceBrowser,
    required this.lastUsed,
    required this.created,
    required this.status,
  });

  String id;

  String credentialID;

  String attestationType;

  List<PasskeyTransportEnum> transport;

  bool backupEligible;

  bool backupState;

  String authenticatorAAGUID;

  String sourceOS;

  String sourceBrowser;

  /// Timestamp of when the passkey was last used in yyyy-MM-dd'T'HH:mm:ss format
  String lastUsed;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  String created;

  /// Status
  PasskeyStatusEnum status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Passkey &&
          other.id == id &&
          other.credentialID == credentialID &&
          other.attestationType == attestationType &&
          _deepEquality.equals(other.transport, transport) &&
          other.backupEligible == backupEligible &&
          other.backupState == backupState &&
          other.authenticatorAAGUID == authenticatorAAGUID &&
          other.sourceOS == sourceOS &&
          other.sourceBrowser == sourceBrowser &&
          other.lastUsed == lastUsed &&
          other.created == created &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (credentialID.hashCode) +
      (attestationType.hashCode) +
      (transport.hashCode) +
      (backupEligible.hashCode) +
      (backupState.hashCode) +
      (authenticatorAAGUID.hashCode) +
      (sourceOS.hashCode) +
      (sourceBrowser.hashCode) +
      (lastUsed.hashCode) +
      (created.hashCode) +
      (status.hashCode);

  @override
  String toString() =>
      'Passkey[id=$id, credentialID=$credentialID, attestationType=$attestationType, transport=$transport, backupEligible=$backupEligible, backupState=$backupState, authenticatorAAGUID=$authenticatorAAGUID, sourceOS=$sourceOS, sourceBrowser=$sourceBrowser, lastUsed=$lastUsed, created=$created, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'credentialID'] = this.credentialID;
    json[r'attestationType'] = this.attestationType;
    json[r'transport'] = this.transport;
    json[r'backupEligible'] = this.backupEligible;
    json[r'backupState'] = this.backupState;
    json[r'authenticatorAAGUID'] = this.authenticatorAAGUID;
    json[r'sourceOS'] = this.sourceOS;
    json[r'sourceBrowser'] = this.sourceBrowser;
    json[r'lastUsed'] = this.lastUsed;
    json[r'created'] = this.created;
    json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [Passkey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Passkey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Passkey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Passkey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Passkey(
        id: mapValueOfType<String>(json, r'id')!,
        credentialID: mapValueOfType<String>(json, r'credentialID')!,
        attestationType: mapValueOfType<String>(json, r'attestationType')!,
        transport: PasskeyTransportEnum.listFromJson(json[r'transport']),
        backupEligible: mapValueOfType<bool>(json, r'backupEligible')!,
        backupState: mapValueOfType<bool>(json, r'backupState')!,
        authenticatorAAGUID:
            mapValueOfType<String>(json, r'authenticatorAAGUID')!,
        sourceOS: mapValueOfType<String>(json, r'sourceOS')!,
        sourceBrowser: mapValueOfType<String>(json, r'sourceBrowser')!,
        lastUsed: mapValueOfType<String>(json, r'lastUsed')!,
        created: mapValueOfType<String>(json, r'created')!,
        status: PasskeyStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<Passkey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Passkey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Passkey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Passkey> mapFromJson(dynamic json) {
    final map = <String, Passkey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Passkey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Passkey-objects as value to a dart map
  static Map<String, List<Passkey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Passkey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Passkey.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'credentialID',
    'attestationType',
    'transport',
    'backupEligible',
    'backupState',
    'authenticatorAAGUID',
    'sourceOS',
    'sourceBrowser',
    'lastUsed',
    'created',
    'status',
  };
}

class PasskeyTransportEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyTransportEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const usb = PasskeyTransportEnum._(r'usb');
  static const nfc = PasskeyTransportEnum._(r'nfc');
  static const ble = PasskeyTransportEnum._(r'ble');
  static const internal = PasskeyTransportEnum._(r'internal');
  static const hybrid = PasskeyTransportEnum._(r'hybrid');
  static const smartCard = PasskeyTransportEnum._(r'smart-card');

  /// List of all possible values in this [enum][PasskeyTransportEnum].
  static const values = <PasskeyTransportEnum>[
    usb,
    nfc,
    ble,
    internal,
    hybrid,
    smartCard,
  ];

  static PasskeyTransportEnum? fromJson(dynamic value) =>
      PasskeyTransportEnumTypeTransformer().decode(value);

  static List<PasskeyTransportEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyTransportEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyTransportEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyTransportEnum] to String,
/// and [decode] dynamic data back to [PasskeyTransportEnum].
class PasskeyTransportEnumTypeTransformer {
  factory PasskeyTransportEnumTypeTransformer() =>
      _instance ??= const PasskeyTransportEnumTypeTransformer._();

  const PasskeyTransportEnumTypeTransformer._();

  String encode(PasskeyTransportEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyTransportEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyTransportEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'usb':
          return PasskeyTransportEnum.usb;
        case r'nfc':
          return PasskeyTransportEnum.nfc;
        case r'ble':
          return PasskeyTransportEnum.ble;
        case r'internal':
          return PasskeyTransportEnum.internal;
        case r'hybrid':
          return PasskeyTransportEnum.hybrid;
        case r'smart-card':
          return PasskeyTransportEnum.smartCard;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyTransportEnumTypeTransformer] instance.
  static PasskeyTransportEnumTypeTransformer? _instance;
}

/// Status
class PasskeyStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PasskeyStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = PasskeyStatusEnum._(r'pending');
  static const active = PasskeyStatusEnum._(r'active');

  /// List of all possible values in this [enum][PasskeyStatusEnum].
  static const values = <PasskeyStatusEnum>[
    pending,
    active,
  ];

  static PasskeyStatusEnum? fromJson(dynamic value) =>
      PasskeyStatusEnumTypeTransformer().decode(value);

  static List<PasskeyStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyStatusEnum] to String,
/// and [decode] dynamic data back to [PasskeyStatusEnum].
class PasskeyStatusEnumTypeTransformer {
  factory PasskeyStatusEnumTypeTransformer() =>
      _instance ??= const PasskeyStatusEnumTypeTransformer._();

  const PasskeyStatusEnumTypeTransformer._();

  String encode(PasskeyStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return PasskeyStatusEnum.pending;
        case r'active':
          return PasskeyStatusEnum.active;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyStatusEnumTypeTransformer] instance.
  static PasskeyStatusEnumTypeTransformer? _instance;
}

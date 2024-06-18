//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassKeyItem {
  /// Returns a new [PassKeyItem] instance.
  PassKeyItem({
    required this.id,
    required this.aaguid,
    required this.userAgent,
    required this.attestationType,
    this.transport = const [],
    required this.backupEligible,
    required this.backupState,
    required this.status,
    required this.created,
  });

  String id;

  String aaguid;

  String userAgent;

  String attestationType;

  List<String> transport;

  bool backupEligible;

  bool backupState;

  /// Status
  PassKeyItemStatusEnum status;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  String created;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassKeyItem &&
          other.id == id &&
          other.aaguid == aaguid &&
          other.userAgent == userAgent &&
          other.attestationType == attestationType &&
          _deepEquality.equals(other.transport, transport) &&
          other.backupEligible == backupEligible &&
          other.backupState == backupState &&
          other.status == status &&
          other.created == created;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (aaguid.hashCode) +
      (userAgent.hashCode) +
      (attestationType.hashCode) +
      (transport.hashCode) +
      (backupEligible.hashCode) +
      (backupState.hashCode) +
      (status.hashCode) +
      (created.hashCode);

  @override
  String toString() =>
      'PassKeyItem[id=$id, aaguid=$aaguid, userAgent=$userAgent, attestationType=$attestationType, transport=$transport, backupEligible=$backupEligible, backupState=$backupState, status=$status, created=$created]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'aaguid'] = this.aaguid;
    json[r'userAgent'] = this.userAgent;
    json[r'attestationType'] = this.attestationType;
    json[r'transport'] = this.transport;
    json[r'backupEligible'] = this.backupEligible;
    json[r'backupState'] = this.backupState;
    json[r'status'] = this.status;
    json[r'created'] = this.created;
    return json;
  }

  /// Returns a new [PassKeyItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassKeyItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PassKeyItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PassKeyItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassKeyItem(
        id: mapValueOfType<String>(json, r'id')!,
        aaguid: mapValueOfType<String>(json, r'aaguid')!,
        userAgent: mapValueOfType<String>(json, r'userAgent')!,
        attestationType: mapValueOfType<String>(json, r'attestationType')!,
        transport: json[r'transport'] is Iterable
            ? (json[r'transport'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        backupEligible: mapValueOfType<bool>(json, r'backupEligible')!,
        backupState: mapValueOfType<bool>(json, r'backupState')!,
        status: PassKeyItemStatusEnum.fromJson(json[r'status'])!,
        created: mapValueOfType<String>(json, r'created')!,
      );
    }
    return null;
  }

  static List<PassKeyItem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PassKeyItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassKeyItem> mapFromJson(dynamic json) {
    final map = <String, PassKeyItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassKeyItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassKeyItem-objects as value to a dart map
  static Map<String, List<PassKeyItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PassKeyItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PassKeyItem.listFromJson(
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
    'aaguid',
    'userAgent',
    'attestationType',
    'transport',
    'backupEligible',
    'backupState',
    'status',
    'created',
  };
}

/// Status
class PassKeyItemStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PassKeyItemStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = PassKeyItemStatusEnum._(r'pending');
  static const active = PassKeyItemStatusEnum._(r'active');

  /// List of all possible values in this [enum][PassKeyItemStatusEnum].
  static const values = <PassKeyItemStatusEnum>[
    pending,
    active,
  ];

  static PassKeyItemStatusEnum? fromJson(dynamic value) =>
      PassKeyItemStatusEnumTypeTransformer().decode(value);

  static List<PassKeyItemStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PassKeyItemStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassKeyItemStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PassKeyItemStatusEnum] to String,
/// and [decode] dynamic data back to [PassKeyItemStatusEnum].
class PassKeyItemStatusEnumTypeTransformer {
  factory PassKeyItemStatusEnumTypeTransformer() =>
      _instance ??= const PassKeyItemStatusEnumTypeTransformer._();

  const PassKeyItemStatusEnumTypeTransformer._();

  String encode(PassKeyItemStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PassKeyItemStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PassKeyItemStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return PassKeyItemStatusEnum.pending;
        case r'active':
          return PassKeyItemStatusEnum.active;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PassKeyItemStatusEnumTypeTransformer] instance.
  static PassKeyItemStatusEnumTypeTransformer? _instance;
}

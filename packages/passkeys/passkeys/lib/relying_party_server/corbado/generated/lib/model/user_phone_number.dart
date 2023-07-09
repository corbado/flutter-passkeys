//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserPhoneNumber {
  /// Returns a new [UserPhoneNumber] instance.
  UserPhoneNumber({
    required this.ID,
    required this.phoneNumber,
    required this.created,
    required this.updated,
    required this.status,
  });

  /// generic ID
  String ID;

  String phoneNumber;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  String created;

  /// Timestamp of when the entity was last updated in yyyy-MM-dd'T'HH:mm:ss format
  String updated;

  Status status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserPhoneNumber &&
     other.ID == ID &&
     other.phoneNumber == phoneNumber &&
     other.created == created &&
     other.updated == updated &&
     other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ID.hashCode) +
    (phoneNumber.hashCode) +
    (created.hashCode) +
    (updated.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'UserPhoneNumber[ID=$ID, phoneNumber=$phoneNumber, created=$created, updated=$updated, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'ID'] = this.ID;
      json[r'phoneNumber'] = this.phoneNumber;
      json[r'created'] = this.created;
      json[r'updated'] = this.updated;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [UserPhoneNumber] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserPhoneNumber? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserPhoneNumber[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserPhoneNumber[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserPhoneNumber(
        ID: mapValueOfType<String>(json, r'ID')!,
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber')!,
        created: mapValueOfType<String>(json, r'created')!,
        updated: mapValueOfType<String>(json, r'updated')!,
        status: Status.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<UserPhoneNumber>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPhoneNumber>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPhoneNumber.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserPhoneNumber> mapFromJson(dynamic json) {
    final map = <String, UserPhoneNumber>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserPhoneNumber.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserPhoneNumber-objects as value to a dart map
  static Map<String, List<UserPhoneNumber>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserPhoneNumber>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserPhoneNumber.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ID',
    'phoneNumber',
    'created',
    'updated',
    'status',
  };
}


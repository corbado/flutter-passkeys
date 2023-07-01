//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FullUser {
  /// Returns a new [FullUser] instance.
  FullUser({
    required this.ID,
    required this.name,
    required this.fullName,
    required this.created,
    required this.updated,
    required this.status,
    this.emails = const [],
    this.phoneNumbers = const [],
  });

  /// ID of the user
  String ID;

  String name;

  String fullName;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  String created;

  /// Timestamp of when the entity was last updated in yyyy-MM-dd'T'HH:mm:ss format
  String updated;

  Status status;

  List<UserEmail> emails;

  List<UserPhoneNumber> phoneNumbers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FullUser &&
     other.ID == ID &&
     other.name == name &&
     other.fullName == fullName &&
     other.created == created &&
     other.updated == updated &&
     other.status == status &&
     other.emails == emails &&
     other.phoneNumbers == phoneNumbers;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ID.hashCode) +
    (name.hashCode) +
    (fullName.hashCode) +
    (created.hashCode) +
    (updated.hashCode) +
    (status.hashCode) +
    (emails.hashCode) +
    (phoneNumbers.hashCode);

  @override
  String toString() => 'FullUser[ID=$ID, name=$name, fullName=$fullName, created=$created, updated=$updated, status=$status, emails=$emails, phoneNumbers=$phoneNumbers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'ID'] = this.ID;
      json[r'name'] = this.name;
      json[r'fullName'] = this.fullName;
      json[r'created'] = this.created;
      json[r'updated'] = this.updated;
      json[r'status'] = this.status;
      json[r'emails'] = this.emails;
      json[r'phoneNumbers'] = this.phoneNumbers;
    return json;
  }

  /// Returns a new [FullUser] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FullUser? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FullUser[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FullUser[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FullUser(
        ID: mapValueOfType<String>(json, r'ID')!,
        name: mapValueOfType<String>(json, r'name')!,
        fullName: mapValueOfType<String>(json, r'fullName')!,
        created: mapValueOfType<String>(json, r'created')!,
        updated: mapValueOfType<String>(json, r'updated')!,
        status: Status.fromJson(json[r'status'])!,
        emails: UserEmail.listFromJson(json[r'emails'])!,
        phoneNumbers: UserPhoneNumber.listFromJson(json[r'phoneNumbers'])!,
      );
    }
    return null;
  }

  static List<FullUser>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FullUser>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FullUser.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FullUser> mapFromJson(dynamic json) {
    final map = <String, FullUser>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FullUser.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FullUser-objects as value to a dart map
  static Map<String, List<FullUser>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FullUser>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FullUser.listFromJson(entry.value, growable: growable,);
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
    'name',
    'fullName',
    'created',
    'updated',
    'status',
    'emails',
    'phoneNumbers',
  };
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserEmail {
  /// Returns a new [UserEmail] instance.
  UserEmail({
    required this.ID,
    required this.email,
    required this.created,
    required this.updated,
    required this.status,
  });

  /// generic ID
  String ID;

  String email;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  String created;

  /// Timestamp of when the entity was last updated in yyyy-MM-dd'T'HH:mm:ss format
  String updated;

  Status status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserEmail &&
     other.ID == ID &&
     other.email == email &&
     other.created == created &&
     other.updated == updated &&
     other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ID.hashCode) +
    (email.hashCode) +
    (created.hashCode) +
    (updated.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'UserEmail[ID=$ID, email=$email, created=$created, updated=$updated, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'ID'] = this.ID;
      json[r'email'] = this.email;
      json[r'created'] = this.created;
      json[r'updated'] = this.updated;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [UserEmail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserEmail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserEmail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserEmail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserEmail(
        ID: mapValueOfType<String>(json, r'ID')!,
        email: mapValueOfType<String>(json, r'email')!,
        created: mapValueOfType<String>(json, r'created')!,
        updated: mapValueOfType<String>(json, r'updated')!,
        status: Status.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<UserEmail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserEmail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserEmail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserEmail> mapFromJson(dynamic json) {
    final map = <String, UserEmail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserEmail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserEmail-objects as value to a dart map
  static Map<String, List<UserEmail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserEmail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserEmail.listFromJson(entry.value, growable: growable,);
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
    'email',
    'created',
    'updated',
    'status',
  };
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ErrorRspAllOfError {
  /// Returns a new [ErrorRspAllOfError] instance.
  ErrorRspAllOfError({
    required this.type,
    this.details,
    this.validation = const [],
    this.links = const [],
  });

  /// Type of error
  String type;

  /// Details of error
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? details;

  /// Validation errors per field
  List<ErrorRspAllOfErrorValidation> validation;

  /// Additional links to help understand the error
  List<String> links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorRspAllOfError &&
     other.type == type &&
     other.details == details &&
     other.validation == validation &&
     other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (details == null ? 0 : details!.hashCode) +
    (validation.hashCode) +
    (links.hashCode);

  @override
  String toString() => 'ErrorRspAllOfError[type=$type, details=$details, validation=$validation, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
    if (this.details != null) {
      json[r'details'] = this.details;
    } else {
      json[r'details'] = null;
    }
      json[r'validation'] = this.validation;
      json[r'links'] = this.links;
    return json;
  }

  /// Returns a new [ErrorRspAllOfError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ErrorRspAllOfError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ErrorRspAllOfError[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ErrorRspAllOfError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ErrorRspAllOfError(
        type: mapValueOfType<String>(json, r'type')!,
        details: mapValueOfType<String>(json, r'details'),
        validation: ErrorRspAllOfErrorValidation.listFromJson(json[r'validation']) ?? const [],
        links: json[r'links'] is List
            ? (json[r'links'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<ErrorRspAllOfError>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ErrorRspAllOfError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ErrorRspAllOfError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ErrorRspAllOfError> mapFromJson(dynamic json) {
    final map = <String, ErrorRspAllOfError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorRspAllOfError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ErrorRspAllOfError-objects as value to a dart map
  static Map<String, List<ErrorRspAllOfError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ErrorRspAllOfError>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorRspAllOfError.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'links',
  };
}


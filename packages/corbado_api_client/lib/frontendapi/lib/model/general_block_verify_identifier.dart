//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneralBlockVerifyIdentifier {
  /// Returns a new [GeneralBlockVerifyIdentifier] instance.
  GeneralBlockVerifyIdentifier({
    required this.verificationMethod,
    required this.identifier,
    this.alternativeVerificationMethods = const [],
    required this.isPostLoginVerification,
    this.retryNotBefore,
    this.error,
  });

  VerificationMethod verificationMethod;

  String identifier;

  List<Object> alternativeVerificationMethods;

  bool isPostLoginVerification;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retryNotBefore;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralBlockVerifyIdentifier &&
          other.verificationMethod == verificationMethod &&
          other.identifier == identifier &&
          other.alternativeVerificationMethods ==
              alternativeVerificationMethods &&
          other.isPostLoginVerification == isPostLoginVerification &&
          other.retryNotBefore == retryNotBefore &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (verificationMethod.hashCode) +
      (identifier.hashCode) +
      (alternativeVerificationMethods.hashCode) +
      (isPostLoginVerification.hashCode) +
      (retryNotBefore == null ? 0 : retryNotBefore!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'GeneralBlockVerifyIdentifier[verificationMethod=$verificationMethod, identifier=$identifier, alternativeVerificationMethods=$alternativeVerificationMethods, isPostLoginVerification=$isPostLoginVerification, retryNotBefore=$retryNotBefore, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'verificationMethod'] = this.verificationMethod;
    json[r'identifier'] = this.identifier;
    json[r'alternativeVerificationMethods'] =
        this.alternativeVerificationMethods;
    json[r'isPostLoginVerification'] = this.isPostLoginVerification;
    if (this.retryNotBefore != null) {
      json[r'retryNotBefore'] = this.retryNotBefore;
    } else {
      json[r'retryNotBefore'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [GeneralBlockVerifyIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneralBlockVerifyIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneralBlockVerifyIdentifier[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneralBlockVerifyIdentifier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneralBlockVerifyIdentifier(
        verificationMethod:
            VerificationMethod.fromJson(json[r'verificationMethod'])!,
        identifier: mapValueOfType<String>(json, r'identifier')!,
        alternativeVerificationMethods:
            Object.fromJson(json[r'alternativeVerificationMethods'])!,
        isPostLoginVerification:
            mapValueOfType<bool>(json, r'isPostLoginVerification')!,
        retryNotBefore: mapValueOfType<int>(json, r'retryNotBefore'),
        error: RequestError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<GeneralBlockVerifyIdentifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneralBlockVerifyIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneralBlockVerifyIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneralBlockVerifyIdentifier> mapFromJson(dynamic json) {
    final map = <String, GeneralBlockVerifyIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneralBlockVerifyIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneralBlockVerifyIdentifier-objects as value to a dart map
  static Map<String, List<GeneralBlockVerifyIdentifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneralBlockVerifyIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneralBlockVerifyIdentifier.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'verificationMethod',
    'identifier',
    'alternativeVerificationMethods',
    'isPostLoginVerification',
  };
}

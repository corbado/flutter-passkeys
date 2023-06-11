//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestData {
  /// Returns a new [RequestData] instance.
  RequestData({
    required this.requestID,
    required this.link,
  });

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  String requestID;

  /// Link to dashboard with details about request
  String link;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestData &&
     other.requestID == requestID &&
     other.link == link;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (requestID.hashCode) +
    (link.hashCode);

  @override
  String toString() => 'RequestData[requestID=$requestID, link=$link]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'requestID'] = this.requestID;
      json[r'link'] = this.link;
    return json;
  }

  /// Returns a new [RequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RequestData(
        requestID: mapValueOfType<String>(json, r'requestID')!,
        link: mapValueOfType<String>(json, r'link')!,
      );
    }
    return null;
  }

  static List<RequestData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RequestData> mapFromJson(dynamic json) {
    final map = <String, RequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RequestData-objects as value to a dart map
  static Map<String, List<RequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RequestData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'requestID',
    'link',
  };
}


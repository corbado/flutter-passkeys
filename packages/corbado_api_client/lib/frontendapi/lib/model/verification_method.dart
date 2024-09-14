//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerificationMethod {
  /// Instantiate a new enum with the provided [value].
  const VerificationMethod._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailLink = VerificationMethod._(r'email-link');
  static const emailOtp = VerificationMethod._(r'email-otp');
  static const phoneOtp = VerificationMethod._(r'phone-otp');

  /// List of all possible values in this [enum][VerificationMethod].
  static const values = <VerificationMethod>[
    emailLink,
    emailOtp,
    phoneOtp,
  ];

  static VerificationMethod? fromJson(dynamic value) =>
      VerificationMethodTypeTransformer().decode(value);

  static List<VerificationMethod> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerificationMethod>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerificationMethod.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerificationMethod] to String,
/// and [decode] dynamic data back to [VerificationMethod].
class VerificationMethodTypeTransformer {
  factory VerificationMethodTypeTransformer() =>
      _instance ??= const VerificationMethodTypeTransformer._();

  const VerificationMethodTypeTransformer._();

  String encode(VerificationMethod data) => data.value;

  /// Decodes a [dynamic value][data] to a VerificationMethod.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerificationMethod? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email-link':
          return VerificationMethod.emailLink;
        case r'email-otp':
          return VerificationMethod.emailOtp;
        case r'phone-otp':
          return VerificationMethod.phoneOtp;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerificationMethodTypeTransformer] instance.
  static VerificationMethodTypeTransformer? _instance;
}

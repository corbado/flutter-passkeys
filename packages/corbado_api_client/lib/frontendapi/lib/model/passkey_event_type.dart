//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasskeyEventType {
  /// Instantiate a new enum with the provided [value].
  const PasskeyEventType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const loginExplicitAbort = PasskeyEventType._(r'login-explicit-abort');
  static const loginError = PasskeyEventType._(r'login-error');
  static const loginOneTapSwitch = PasskeyEventType._(r'login-one-tap-switch');
  static const userAppendAfterCrossPlatformBlacklisted =
      PasskeyEventType._(r'user-append-after-cross-platform-blacklisted');
  static const userAppendAfterLoginErrorBlacklisted =
      PasskeyEventType._(r'user-append-after-login-error-blacklisted');
  static const appendCredentialExists =
      PasskeyEventType._(r'append-credential-exists');
  static const appendExplicitAbort =
      PasskeyEventType._(r'append-explicit-abort');
  static const appendError = PasskeyEventType._(r'append-error');

  /// List of all possible values in this [enum][PasskeyEventType].
  static const values = <PasskeyEventType>[
    loginExplicitAbort,
    loginError,
    loginOneTapSwitch,
    userAppendAfterCrossPlatformBlacklisted,
    userAppendAfterLoginErrorBlacklisted,
    appendCredentialExists,
    appendExplicitAbort,
    appendError,
  ];

  static PasskeyEventType? fromJson(dynamic value) =>
      PasskeyEventTypeTypeTransformer().decode(value);

  static List<PasskeyEventType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PasskeyEventType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasskeyEventType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PasskeyEventType] to String,
/// and [decode] dynamic data back to [PasskeyEventType].
class PasskeyEventTypeTypeTransformer {
  factory PasskeyEventTypeTypeTransformer() =>
      _instance ??= const PasskeyEventTypeTypeTransformer._();

  const PasskeyEventTypeTypeTransformer._();

  String encode(PasskeyEventType data) => data.value;

  /// Decodes a [dynamic value][data] to a PasskeyEventType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PasskeyEventType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'login-explicit-abort':
          return PasskeyEventType.loginExplicitAbort;
        case r'login-error':
          return PasskeyEventType.loginError;
        case r'login-one-tap-switch':
          return PasskeyEventType.loginOneTapSwitch;
        case r'user-append-after-cross-platform-blacklisted':
          return PasskeyEventType.userAppendAfterCrossPlatformBlacklisted;
        case r'user-append-after-login-error-blacklisted':
          return PasskeyEventType.userAppendAfterLoginErrorBlacklisted;
        case r'append-credential-exists':
          return PasskeyEventType.appendCredentialExists;
        case r'append-explicit-abort':
          return PasskeyEventType.appendExplicitAbort;
        case r'append-error':
          return PasskeyEventType.appendError;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PasskeyEventTypeTypeTransformer] instance.
  static PasskeyEventTypeTypeTransformer? _instance;
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlockType {
  /// Instantiate a new enum with the provided [value].
  const BlockType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const signupInit = BlockType._(r'signup-init');
  static const passkeyAppend = BlockType._(r'passkey-append');
  static const phoneVerify = BlockType._(r'phone-verify');
  static const emailVerify = BlockType._(r'email-verify');
  static const passkeyAppended = BlockType._(r'passkey-appended');
  static const completed = BlockType._(r'completed');
  static const socialVerify = BlockType._(r'social-verify');
  static const usernameCollect = BlockType._(r'username-collect');
  static const phoneCollect = BlockType._(r'phone-collect');
  static const loginInit = BlockType._(r'login-init');
  static const passkeyVerify = BlockType._(r'passkey-verify');
  static const conditionalUiCompleted =
      BlockType._(r'conditional-ui-completed');
  static const postSignupEmailVerify = BlockType._(r'post-signup-email-verify');
  static const passkeyAppendAfterHybrid =
      BlockType._(r'passkey-append-after-hybrid');

  /// List of all possible values in this [enum][BlockType].
  static const values = <BlockType>[
    signupInit,
    passkeyAppend,
    phoneVerify,
    emailVerify,
    passkeyAppended,
    completed,
    socialVerify,
    usernameCollect,
    phoneCollect,
    loginInit,
    passkeyVerify,
    conditionalUiCompleted,
    postSignupEmailVerify,
    passkeyAppendAfterHybrid,
  ];

  static BlockType? fromJson(dynamic value) =>
      BlockTypeTypeTransformer().decode(value);

  static List<BlockType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlockType] to String,
/// and [decode] dynamic data back to [BlockType].
class BlockTypeTypeTransformer {
  factory BlockTypeTypeTransformer() =>
      _instance ??= const BlockTypeTypeTransformer._();

  const BlockTypeTypeTransformer._();

  String encode(BlockType data) => data.value;

  /// Decodes a [dynamic value][data] to a BlockType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlockType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'signup-init':
          return BlockType.signupInit;
        case r'passkey-append':
          return BlockType.passkeyAppend;
        case r'phone-verify':
          return BlockType.phoneVerify;
        case r'email-verify':
          return BlockType.emailVerify;
        case r'passkey-appended':
          return BlockType.passkeyAppended;
        case r'completed':
          return BlockType.completed;
        case r'social-verify':
          return BlockType.socialVerify;
        case r'username-collect':
          return BlockType.usernameCollect;
        case r'phone-collect':
          return BlockType.phoneCollect;
        case r'login-init':
          return BlockType.loginInit;
        case r'passkey-verify':
          return BlockType.passkeyVerify;
        case r'conditional-ui-completed':
          return BlockType.conditionalUiCompleted;
        case r'post-signup-email-verify':
          return BlockType.postSignupEmailVerify;
        case r'passkey-append-after-hybrid':
          return BlockType.passkeyAppendAfterHybrid;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BlockTypeTypeTransformer] instance.
  static BlockTypeTypeTransformer? _instance;
}

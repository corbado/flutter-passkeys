// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BlockType _$signupInit = const BlockType._('signupInit');
const BlockType _$passkeyAppend = const BlockType._('passkeyAppend');
const BlockType _$phoneVerify = const BlockType._('phoneVerify');
const BlockType _$emailVerify = const BlockType._('emailVerify');
const BlockType _$passkeyAppended = const BlockType._('passkeyAppended');
const BlockType _$completed = const BlockType._('completed');
const BlockType _$socialVerify = const BlockType._('socialVerify');
const BlockType _$loginInit = const BlockType._('loginInit');
const BlockType _$passkeyVerify = const BlockType._('passkeyVerify');
const BlockType _$conditionalUiCompleted =
    const BlockType._('conditionalUiCompleted');
const BlockType _$postSignupEmailVerify =
    const BlockType._('postSignupEmailVerify');
const BlockType _$passkeyAppendAfterHybrid =
    const BlockType._('passkeyAppendAfterHybrid');

BlockType _$valueOf(String name) {
  switch (name) {
    case 'signupInit':
      return _$signupInit;
    case 'passkeyAppend':
      return _$passkeyAppend;
    case 'phoneVerify':
      return _$phoneVerify;
    case 'emailVerify':
      return _$emailVerify;
    case 'passkeyAppended':
      return _$passkeyAppended;
    case 'completed':
      return _$completed;
    case 'socialVerify':
      return _$socialVerify;
    case 'loginInit':
      return _$loginInit;
    case 'passkeyVerify':
      return _$passkeyVerify;
    case 'conditionalUiCompleted':
      return _$conditionalUiCompleted;
    case 'postSignupEmailVerify':
      return _$postSignupEmailVerify;
    case 'passkeyAppendAfterHybrid':
      return _$passkeyAppendAfterHybrid;
    default:
      return _$passkeyAppendAfterHybrid;
  }
}

final BuiltSet<BlockType> _$values = new BuiltSet<BlockType>(const <BlockType>[
  _$signupInit,
  _$passkeyAppend,
  _$phoneVerify,
  _$emailVerify,
  _$passkeyAppended,
  _$completed,
  _$socialVerify,
  _$loginInit,
  _$passkeyVerify,
  _$conditionalUiCompleted,
  _$postSignupEmailVerify,
  _$passkeyAppendAfterHybrid,
]);

class _$BlockTypeMeta {
  const _$BlockTypeMeta();
  BlockType get signupInit => _$signupInit;
  BlockType get passkeyAppend => _$passkeyAppend;
  BlockType get phoneVerify => _$phoneVerify;
  BlockType get emailVerify => _$emailVerify;
  BlockType get passkeyAppended => _$passkeyAppended;
  BlockType get completed => _$completed;
  BlockType get socialVerify => _$socialVerify;
  BlockType get loginInit => _$loginInit;
  BlockType get passkeyVerify => _$passkeyVerify;
  BlockType get conditionalUiCompleted => _$conditionalUiCompleted;
  BlockType get postSignupEmailVerify => _$postSignupEmailVerify;
  BlockType get passkeyAppendAfterHybrid => _$passkeyAppendAfterHybrid;
  BlockType valueOf(String name) => _$valueOf(name);
  BuiltSet<BlockType> get values => _$values;
}

abstract class _$BlockTypeMixin {
  // ignore: non_constant_identifier_names
  _$BlockTypeMeta get BlockType => const _$BlockTypeMeta();
}

Serializer<BlockType> _$blockTypeSerializer = new _$BlockTypeSerializer();

class _$BlockTypeSerializer implements PrimitiveSerializer<BlockType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'signupInit': 'signup-init',
    'passkeyAppend': 'passkey-append',
    'phoneVerify': 'phone-verify',
    'emailVerify': 'email-verify',
    'passkeyAppended': 'passkey-appended',
    'completed': 'completed',
    'socialVerify': 'social-verify',
    'loginInit': 'login-init',
    'passkeyVerify': 'passkey-verify',
    'conditionalUiCompleted': 'conditional-ui-completed',
    'postSignupEmailVerify': 'post-signup-email-verify',
    'passkeyAppendAfterHybrid': 'passkey-append-after-hybrid',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'signup-init': 'signupInit',
    'passkey-append': 'passkeyAppend',
    'phone-verify': 'phoneVerify',
    'email-verify': 'emailVerify',
    'passkey-appended': 'passkeyAppended',
    'completed': 'completed',
    'social-verify': 'socialVerify',
    'login-init': 'loginInit',
    'passkey-verify': 'passkeyVerify',
    'conditional-ui-completed': 'conditionalUiCompleted',
    'post-signup-email-verify': 'postSignupEmailVerify',
    'passkey-append-after-hybrid': 'passkeyAppendAfterHybrid',
  };

  @override
  final Iterable<Type> types = const <Type>[BlockType];
  @override
  final String wireName = 'BlockType';

  @override
  Object serialize(Serializers serializers, BlockType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BlockType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BlockType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

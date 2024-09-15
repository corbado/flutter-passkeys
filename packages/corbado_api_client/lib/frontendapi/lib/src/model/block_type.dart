//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'block_type.g.dart';

class BlockType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'signup-init')
  static const BlockType signupInit = _$signupInit;
  @BuiltValueEnumConst(wireName: r'passkey-append')
  static const BlockType passkeyAppend = _$passkeyAppend;
  @BuiltValueEnumConst(wireName: r'phone-verify')
  static const BlockType phoneVerify = _$phoneVerify;
  @BuiltValueEnumConst(wireName: r'email-verify')
  static const BlockType emailVerify = _$emailVerify;
  @BuiltValueEnumConst(wireName: r'passkey-appended')
  static const BlockType passkeyAppended = _$passkeyAppended;
  @BuiltValueEnumConst(wireName: r'completed')
  static const BlockType completed = _$completed;
  @BuiltValueEnumConst(wireName: r'social-verify')
  static const BlockType socialVerify = _$socialVerify;
  @BuiltValueEnumConst(wireName: r'login-init')
  static const BlockType loginInit = _$loginInit;
  @BuiltValueEnumConst(wireName: r'passkey-verify')
  static const BlockType passkeyVerify = _$passkeyVerify;
  @BuiltValueEnumConst(wireName: r'conditional-ui-completed')
  static const BlockType conditionalUiCompleted = _$conditionalUiCompleted;
  @BuiltValueEnumConst(wireName: r'post-signup-email-verify')
  static const BlockType postSignupEmailVerify = _$postSignupEmailVerify;
  @BuiltValueEnumConst(wireName: r'passkey-append-after-hybrid', fallback: true)
  static const BlockType passkeyAppendAfterHybrid = _$passkeyAppendAfterHybrid;

  static Serializer<BlockType> get serializer => _$blockTypeSerializer;

  const BlockType._(String name) : super(name);

  static BuiltSet<BlockType> get values => _$values;
  static BlockType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class BlockTypeMixin = Object with _$BlockTypeMixin;

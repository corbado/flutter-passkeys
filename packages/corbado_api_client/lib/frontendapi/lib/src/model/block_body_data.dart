//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/social_data.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_login_init.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_verify_identifier_alternative_verification_methods_inner.dart';
import 'package:corbado_frontend_api_client/src/model/full_name_with_error.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_append.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_with_error.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_icon_set.dart';
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_completed.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_verify_identifier.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_appended.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_signup_init.dart';
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_verify.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_post_signup_email_verify.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'block_body_data.g.dart';

/// BlockBodyData
///
/// Properties:
/// * [blockType]
/// * [challenge]
/// * [identifierValue]
/// * [identifierType]
/// * [autoSubmit]
/// * [passkeyIconSet]
/// * [variant]
/// * [verificationMethod]
/// * [identifier]
/// * [alternativeVerificationMethods]
/// * [isPostLoginVerification]
/// * [shortSession]
/// * [identifiers]
/// * [socialData]
/// * [isPhone]
/// * [isPhoneAvailable]
/// * [isEmailAvailable]
/// * [isUsernameAvailable]
/// * [loginHint]
/// * [retryNotBefore]
/// * [error]
/// * [longSession] - Only given when project environment is dev 1
/// * [passkeyOperation]
/// * [fullName]
/// * [conditionalUIChallenge]
/// * [fieldError]
@BuiltValue()
abstract class BlockBodyData
    implements Built<BlockBodyData, BlockBodyDataBuilder> {
  /// One Of [GeneralBlockCompleted], [GeneralBlockLoginInit], [GeneralBlockPasskeyAppend], [GeneralBlockPasskeyAppended], [GeneralBlockPasskeyVerify], [GeneralBlockPostSignupEmailVerify], [GeneralBlockSignupInit], [GeneralBlockVerifyIdentifier]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'blockType';

  static const Map<String, Type> discriminatorMapping = {
    r'generalBlockCompleted': GeneralBlockCompleted,
    r'generalBlockLoginInit': GeneralBlockLoginInit,
    r'generalBlockPasskeyAppend': GeneralBlockPasskeyAppend,
    r'generalBlockPasskeyAppended': GeneralBlockPasskeyAppended,
    r'generalBlockPasskeyVerify': GeneralBlockPasskeyVerify,
    r'generalBlockPostSignupEmailVerify': GeneralBlockPostSignupEmailVerify,
    r'generalBlockSignupInit': GeneralBlockSignupInit,
    r'generalBlockVerifyIdentifier': GeneralBlockVerifyIdentifier,
  };

  BlockBodyData._();

  factory BlockBodyData([void updates(BlockBodyDataBuilder b)]) =
      _$BlockBodyData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BlockBodyDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BlockBodyData> get serializer =>
      _$BlockBodyDataSerializer();
}

extension BlockBodyDataDiscriminatorExt on BlockBodyData {
  String? get discriminatorValue {
    if (this is GeneralBlockCompleted) {
      return r'generalBlockCompleted';
    }
    if (this is GeneralBlockLoginInit) {
      return r'generalBlockLoginInit';
    }
    if (this is GeneralBlockPasskeyAppend) {
      return r'generalBlockPasskeyAppend';
    }
    if (this is GeneralBlockPasskeyAppended) {
      return r'generalBlockPasskeyAppended';
    }
    if (this is GeneralBlockPasskeyVerify) {
      return r'generalBlockPasskeyVerify';
    }
    if (this is GeneralBlockPostSignupEmailVerify) {
      return r'generalBlockPostSignupEmailVerify';
    }
    if (this is GeneralBlockSignupInit) {
      return r'generalBlockSignupInit';
    }
    if (this is GeneralBlockVerifyIdentifier) {
      return r'generalBlockVerifyIdentifier';
    }
    return null;
  }
}

extension BlockBodyDataBuilderDiscriminatorExt on BlockBodyDataBuilder {
  String? get discriminatorValue {
    if (this is GeneralBlockCompletedBuilder) {
      return r'generalBlockCompleted';
    }
    if (this is GeneralBlockLoginInitBuilder) {
      return r'generalBlockLoginInit';
    }
    if (this is GeneralBlockPasskeyAppendBuilder) {
      return r'generalBlockPasskeyAppend';
    }
    if (this is GeneralBlockPasskeyAppendedBuilder) {
      return r'generalBlockPasskeyAppended';
    }
    if (this is GeneralBlockPasskeyVerifyBuilder) {
      return r'generalBlockPasskeyVerify';
    }
    if (this is GeneralBlockPostSignupEmailVerifyBuilder) {
      return r'generalBlockPostSignupEmailVerify';
    }
    if (this is GeneralBlockSignupInitBuilder) {
      return r'generalBlockSignupInit';
    }
    if (this is GeneralBlockVerifyIdentifierBuilder) {
      return r'generalBlockVerifyIdentifier';
    }
    return null;
  }
}

class _$BlockBodyDataSerializer implements PrimitiveSerializer<BlockBodyData> {
  @override
  final Iterable<Type> types = const [BlockBodyData, _$BlockBodyData];

  @override
  final String wireName = r'BlockBodyData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BlockBodyData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    BlockBodyData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  BlockBodyData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BlockBodyDataBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(BlockBodyData.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      GeneralBlockCompleted,
      GeneralBlockLoginInit,
      GeneralBlockPasskeyAppend,
      GeneralBlockPasskeyAppended,
      GeneralBlockPasskeyVerify,
      GeneralBlockPostSignupEmailVerify,
      GeneralBlockSignupInit,
      GeneralBlockVerifyIdentifier,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'generalBlockCompleted':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockCompleted),
        ) as GeneralBlockCompleted;
        oneOfType = GeneralBlockCompleted;
        break;
      case r'generalBlockLoginInit':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockLoginInit),
        ) as GeneralBlockLoginInit;
        oneOfType = GeneralBlockLoginInit;
        break;
      case r'generalBlockPasskeyAppend':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockPasskeyAppend),
        ) as GeneralBlockPasskeyAppend;
        oneOfType = GeneralBlockPasskeyAppend;
        break;
      case r'generalBlockPasskeyAppended':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockPasskeyAppended),
        ) as GeneralBlockPasskeyAppended;
        oneOfType = GeneralBlockPasskeyAppended;
        break;
      case r'generalBlockPasskeyVerify':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockPasskeyVerify),
        ) as GeneralBlockPasskeyVerify;
        oneOfType = GeneralBlockPasskeyVerify;
        break;
      case r'generalBlockPostSignupEmailVerify':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockPostSignupEmailVerify),
        ) as GeneralBlockPostSignupEmailVerify;
        oneOfType = GeneralBlockPostSignupEmailVerify;
        break;
      case r'generalBlockSignupInit':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockSignupInit),
        ) as GeneralBlockSignupInit;
        oneOfType = GeneralBlockSignupInit;
        break;
      case r'generalBlockVerifyIdentifier':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(GeneralBlockVerifyIdentifier),
        ) as GeneralBlockVerifyIdentifier;
        oneOfType = GeneralBlockVerifyIdentifier;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}

class BlockBodyDataVariantEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'default')
  static const BlockBodyDataVariantEnum default_ =
      _$blockBodyDataVariantEnum_default_;
  @BuiltValueEnumConst(wireName: r'after-hybrid')
  static const BlockBodyDataVariantEnum afterHybrid =
      _$blockBodyDataVariantEnum_afterHybrid;
  @BuiltValueEnumConst(wireName: r'after-error', fallback: true)
  static const BlockBodyDataVariantEnum afterError =
      _$blockBodyDataVariantEnum_afterError;

  static Serializer<BlockBodyDataVariantEnum> get serializer =>
      _$blockBodyDataVariantEnumSerializer;

  const BlockBodyDataVariantEnum._(String name) : super(name);

  static BuiltSet<BlockBodyDataVariantEnum> get values =>
      _$blockBodyDataVariantEnumValues;
  static BlockBodyDataVariantEnum valueOf(String name) =>
      _$blockBodyDataVariantEnumValueOf(name);
}

class BlockBodyDataLoginHintEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cda', fallback: true)
  static const BlockBodyDataLoginHintEnum cda =
      _$blockBodyDataLoginHintEnum_cda;

  static Serializer<BlockBodyDataLoginHintEnum> get serializer =>
      _$blockBodyDataLoginHintEnumSerializer;

  const BlockBodyDataLoginHintEnum._(String name) : super(name);

  static BuiltSet<BlockBodyDataLoginHintEnum> get values =>
      _$blockBodyDataLoginHintEnumValues;
  static BlockBodyDataLoginHintEnum valueOf(String name) =>
      _$blockBodyDataLoginHintEnumValueOf(name);
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_icon_set.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_passkey_append.g.dart';

/// GeneralBlockPasskeyAppend
///
/// Properties:
/// * [blockType]
/// * [challenge]
/// * [identifierValue]
/// * [identifierType]
/// * [autoSubmit]
/// * [passkeyIconSet]
/// * [variant]
@BuiltValue()
abstract class GeneralBlockPasskeyAppend
    implements
        Built<GeneralBlockPasskeyAppend, GeneralBlockPasskeyAppendBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'challenge')
  String get challenge;

  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'autoSubmit')
  bool get autoSubmit;

  @BuiltValueField(wireName: r'passkeyIconSet')
  PasskeyIconSet get passkeyIconSet;
  // enum passkeyIconSetEnum {  default,  apple,  android,  windows,  };

  @BuiltValueField(wireName: r'variant')
  GeneralBlockPasskeyAppendVariantEnum get variant;
  // enum variantEnum {  default,  after-hybrid,  after-error,  };

  GeneralBlockPasskeyAppend._();

  factory GeneralBlockPasskeyAppend(
          [void updates(GeneralBlockPasskeyAppendBuilder b)]) =
      _$GeneralBlockPasskeyAppend;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockPasskeyAppendBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockPasskeyAppend> get serializer =>
      _$GeneralBlockPasskeyAppendSerializer();
}

class _$GeneralBlockPasskeyAppendSerializer
    implements PrimitiveSerializer<GeneralBlockPasskeyAppend> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockPasskeyAppend,
    _$GeneralBlockPasskeyAppend
  ];

  @override
  final String wireName = r'GeneralBlockPasskeyAppend';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockPasskeyAppend object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
    yield r'challenge';
    yield serializers.serialize(
      object.challenge,
      specifiedType: const FullType(String),
    );
    yield r'identifierValue';
    yield serializers.serialize(
      object.identifierValue,
      specifiedType: const FullType(String),
    );
    yield r'identifierType';
    yield serializers.serialize(
      object.identifierType,
      specifiedType: const FullType(LoginIdentifierType),
    );
    yield r'autoSubmit';
    yield serializers.serialize(
      object.autoSubmit,
      specifiedType: const FullType(bool),
    );
    yield r'passkeyIconSet';
    yield serializers.serialize(
      object.passkeyIconSet,
      specifiedType: const FullType(PasskeyIconSet),
    );
    yield r'variant';
    yield serializers.serialize(
      object.variant,
      specifiedType: const FullType(GeneralBlockPasskeyAppendVariantEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockPasskeyAppend object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GeneralBlockPasskeyAppendBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'blockType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.blockType = valueDes;
          break;
        case r'challenge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.challenge = valueDes;
          break;
        case r'identifierValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierValue = valueDes;
          break;
        case r'identifierType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LoginIdentifierType),
          ) as LoginIdentifierType;
          result.identifierType = valueDes;
          break;
        case r'autoSubmit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.autoSubmit = valueDes;
          break;
        case r'passkeyIconSet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyIconSet),
          ) as PasskeyIconSet;
          result.passkeyIconSet = valueDes;
          break;
        case r'variant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GeneralBlockPasskeyAppendVariantEnum),
          ) as GeneralBlockPasskeyAppendVariantEnum;
          result.variant = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockPasskeyAppend deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockPasskeyAppendBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class GeneralBlockPasskeyAppendVariantEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'default')
  static const GeneralBlockPasskeyAppendVariantEnum default_ =
      _$generalBlockPasskeyAppendVariantEnum_default_;
  @BuiltValueEnumConst(wireName: r'after-hybrid')
  static const GeneralBlockPasskeyAppendVariantEnum afterHybrid =
      _$generalBlockPasskeyAppendVariantEnum_afterHybrid;
  @BuiltValueEnumConst(wireName: r'after-error', fallback: true)
  static const GeneralBlockPasskeyAppendVariantEnum afterError =
      _$generalBlockPasskeyAppendVariantEnum_afterError;

  static Serializer<GeneralBlockPasskeyAppendVariantEnum> get serializer =>
      _$generalBlockPasskeyAppendVariantEnumSerializer;

  const GeneralBlockPasskeyAppendVariantEnum._(String name) : super(name);

  static BuiltSet<GeneralBlockPasskeyAppendVariantEnum> get values =>
      _$generalBlockPasskeyAppendVariantEnumValues;
  static GeneralBlockPasskeyAppendVariantEnum valueOf(String name) =>
      _$generalBlockPasskeyAppendVariantEnumValueOf(name);
}

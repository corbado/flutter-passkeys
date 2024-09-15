//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_passkey_verify.g.dart';

/// GeneralBlockPasskeyVerify
///
/// Properties:
/// * [blockType]
/// * [challenge]
/// * [identifierValue]
/// * [loginHint]
@BuiltValue()
abstract class GeneralBlockPasskeyVerify
    implements
        Built<GeneralBlockPasskeyVerify, GeneralBlockPasskeyVerifyBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'challenge')
  String get challenge;

  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'loginHint')
  GeneralBlockPasskeyVerifyLoginHintEnum? get loginHint;
  // enum loginHintEnum {  cda,  };

  GeneralBlockPasskeyVerify._();

  factory GeneralBlockPasskeyVerify(
          [void updates(GeneralBlockPasskeyVerifyBuilder b)]) =
      _$GeneralBlockPasskeyVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockPasskeyVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockPasskeyVerify> get serializer =>
      _$GeneralBlockPasskeyVerifySerializer();
}

class _$GeneralBlockPasskeyVerifySerializer
    implements PrimitiveSerializer<GeneralBlockPasskeyVerify> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockPasskeyVerify,
    _$GeneralBlockPasskeyVerify
  ];

  @override
  final String wireName = r'GeneralBlockPasskeyVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockPasskeyVerify object, {
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
    if (object.loginHint != null) {
      yield r'loginHint';
      yield serializers.serialize(
        object.loginHint,
        specifiedType: const FullType(GeneralBlockPasskeyVerifyLoginHintEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockPasskeyVerify object, {
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
    required GeneralBlockPasskeyVerifyBuilder result,
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
        case r'loginHint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(GeneralBlockPasskeyVerifyLoginHintEnum),
          ) as GeneralBlockPasskeyVerifyLoginHintEnum;
          result.loginHint = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockPasskeyVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockPasskeyVerifyBuilder();
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

class GeneralBlockPasskeyVerifyLoginHintEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cda', fallback: true)
  static const GeneralBlockPasskeyVerifyLoginHintEnum cda =
      _$generalBlockPasskeyVerifyLoginHintEnum_cda;

  static Serializer<GeneralBlockPasskeyVerifyLoginHintEnum> get serializer =>
      _$generalBlockPasskeyVerifyLoginHintEnumSerializer;

  const GeneralBlockPasskeyVerifyLoginHintEnum._(String name) : super(name);

  static BuiltSet<GeneralBlockPasskeyVerifyLoginHintEnum> get values =>
      _$generalBlockPasskeyVerifyLoginHintEnumValues;
  static GeneralBlockPasskeyVerifyLoginHintEnum valueOf(String name) =>
      _$generalBlockPasskeyVerifyLoginHintEnumValueOf(name);
}

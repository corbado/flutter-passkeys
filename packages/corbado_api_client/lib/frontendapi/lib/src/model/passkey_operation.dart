//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_operation.g.dart';

/// PasskeyOperation
///
/// Properties:
/// * [operationType]
/// * [identifierValue]
/// * [identifierType]
/// * [ceremonyType]
@BuiltValue()
abstract class PasskeyOperation
    implements Built<PasskeyOperation, PasskeyOperationBuilder> {
  @BuiltValueField(wireName: r'operationType')
  PasskeyOperationOperationTypeEnum get operationType;
  // enum operationTypeEnum {  append,  verify,  };

  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'ceremonyType')
  PasskeyOperationCeremonyTypeEnum get ceremonyType;
  // enum ceremonyTypeEnum {  local,  cda,  security-key,  };

  PasskeyOperation._();

  factory PasskeyOperation([void updates(PasskeyOperationBuilder b)]) =
      _$PasskeyOperation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyOperationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyOperation> get serializer =>
      _$PasskeyOperationSerializer();
}

class _$PasskeyOperationSerializer
    implements PrimitiveSerializer<PasskeyOperation> {
  @override
  final Iterable<Type> types = const [PasskeyOperation, _$PasskeyOperation];

  @override
  final String wireName = r'PasskeyOperation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyOperation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'operationType';
    yield serializers.serialize(
      object.operationType,
      specifiedType: const FullType(PasskeyOperationOperationTypeEnum),
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
    yield r'ceremonyType';
    yield serializers.serialize(
      object.ceremonyType,
      specifiedType: const FullType(PasskeyOperationCeremonyTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasskeyOperation object, {
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
    required PasskeyOperationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyOperationOperationTypeEnum),
          ) as PasskeyOperationOperationTypeEnum;
          result.operationType = valueDes;
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
        case r'ceremonyType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyOperationCeremonyTypeEnum),
          ) as PasskeyOperationCeremonyTypeEnum;
          result.ceremonyType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasskeyOperation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyOperationBuilder();
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

class PasskeyOperationOperationTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'append')
  static const PasskeyOperationOperationTypeEnum append =
      _$passkeyOperationOperationTypeEnum_append;
  @BuiltValueEnumConst(wireName: r'verify', fallback: true)
  static const PasskeyOperationOperationTypeEnum verify =
      _$passkeyOperationOperationTypeEnum_verify;

  static Serializer<PasskeyOperationOperationTypeEnum> get serializer =>
      _$passkeyOperationOperationTypeEnumSerializer;

  const PasskeyOperationOperationTypeEnum._(String name) : super(name);

  static BuiltSet<PasskeyOperationOperationTypeEnum> get values =>
      _$passkeyOperationOperationTypeEnumValues;
  static PasskeyOperationOperationTypeEnum valueOf(String name) =>
      _$passkeyOperationOperationTypeEnumValueOf(name);
}

class PasskeyOperationCeremonyTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'local')
  static const PasskeyOperationCeremonyTypeEnum local =
      _$passkeyOperationCeremonyTypeEnum_local;
  @BuiltValueEnumConst(wireName: r'cda')
  static const PasskeyOperationCeremonyTypeEnum cda =
      _$passkeyOperationCeremonyTypeEnum_cda;
  @BuiltValueEnumConst(wireName: r'security-key', fallback: true)
  static const PasskeyOperationCeremonyTypeEnum securityKey =
      _$passkeyOperationCeremonyTypeEnum_securityKey;

  static Serializer<PasskeyOperationCeremonyTypeEnum> get serializer =>
      _$passkeyOperationCeremonyTypeEnumSerializer;

  const PasskeyOperationCeremonyTypeEnum._(String name) : super(name);

  static BuiltSet<PasskeyOperationCeremonyTypeEnum> get values =>
      _$passkeyOperationCeremonyTypeEnumValues;
  static PasskeyOperationCeremonyTypeEnum valueOf(String name) =>
      _$passkeyOperationCeremonyTypeEnumValueOf(name);
}

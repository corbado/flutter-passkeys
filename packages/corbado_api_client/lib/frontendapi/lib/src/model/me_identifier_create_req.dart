//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_identifier_create_req.g.dart';

/// MeIdentifierCreateReq
///
/// Properties:
/// * [identifierType]
/// * [value]
@BuiltValue()
abstract class MeIdentifierCreateReq
    implements Built<MeIdentifierCreateReq, MeIdentifierCreateReqBuilder> {
  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'value')
  String get value;

  MeIdentifierCreateReq._();

  factory MeIdentifierCreateReq(
      [void updates(MeIdentifierCreateReqBuilder b)]) = _$MeIdentifierCreateReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeIdentifierCreateReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeIdentifierCreateReq> get serializer =>
      _$MeIdentifierCreateReqSerializer();
}

class _$MeIdentifierCreateReqSerializer
    implements PrimitiveSerializer<MeIdentifierCreateReq> {
  @override
  final Iterable<Type> types = const [
    MeIdentifierCreateReq,
    _$MeIdentifierCreateReq
  ];

  @override
  final String wireName = r'MeIdentifierCreateReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeIdentifierCreateReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierType';
    yield serializers.serialize(
      object.identifierType,
      specifiedType: const FullType(LoginIdentifierType),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MeIdentifierCreateReq object, {
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
    required MeIdentifierCreateReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifierType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LoginIdentifierType),
          ) as LoginIdentifierType;
          result.identifierType = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MeIdentifierCreateReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeIdentifierCreateReqBuilder();
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

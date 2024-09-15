//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'identifier_update_req.g.dart';

/// IdentifierUpdateReq
///
/// Properties:
/// * [identifierType]
/// * [value]
@BuiltValue()
abstract class IdentifierUpdateReq
    implements Built<IdentifierUpdateReq, IdentifierUpdateReqBuilder> {
  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'value')
  String get value;

  IdentifierUpdateReq._();

  factory IdentifierUpdateReq([void updates(IdentifierUpdateReqBuilder b)]) =
      _$IdentifierUpdateReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IdentifierUpdateReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IdentifierUpdateReq> get serializer =>
      _$IdentifierUpdateReqSerializer();
}

class _$IdentifierUpdateReqSerializer
    implements PrimitiveSerializer<IdentifierUpdateReq> {
  @override
  final Iterable<Type> types = const [
    IdentifierUpdateReq,
    _$IdentifierUpdateReq
  ];

  @override
  final String wireName = r'IdentifierUpdateReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IdentifierUpdateReq object, {
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
    IdentifierUpdateReq object, {
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
    required IdentifierUpdateReqBuilder result,
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
  IdentifierUpdateReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IdentifierUpdateReqBuilder();
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

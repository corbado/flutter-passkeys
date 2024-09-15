//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'phone_collect_req.g.dart';

/// PhoneCollectReq
///
/// Properties:
/// * [value]
@BuiltValue()
abstract class PhoneCollectReq
    implements Built<PhoneCollectReq, PhoneCollectReqBuilder> {
  @BuiltValueField(wireName: r'value')
  String get value;

  PhoneCollectReq._();

  factory PhoneCollectReq([void updates(PhoneCollectReqBuilder b)]) =
      _$PhoneCollectReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PhoneCollectReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PhoneCollectReq> get serializer =>
      _$PhoneCollectReqSerializer();
}

class _$PhoneCollectReqSerializer
    implements PrimitiveSerializer<PhoneCollectReq> {
  @override
  final Iterable<Type> types = const [PhoneCollectReq, _$PhoneCollectReq];

  @override
  final String wireName = r'PhoneCollectReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PhoneCollectReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PhoneCollectReq object, {
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
    required PhoneCollectReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  PhoneCollectReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PhoneCollectReqBuilder();
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

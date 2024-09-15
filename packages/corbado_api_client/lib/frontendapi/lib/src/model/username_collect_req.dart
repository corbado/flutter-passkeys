//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'username_collect_req.g.dart';

/// UsernameCollectReq
///
/// Properties:
/// * [value]
@BuiltValue()
abstract class UsernameCollectReq
    implements Built<UsernameCollectReq, UsernameCollectReqBuilder> {
  @BuiltValueField(wireName: r'value')
  String get value;

  UsernameCollectReq._();

  factory UsernameCollectReq([void updates(UsernameCollectReqBuilder b)]) =
      _$UsernameCollectReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UsernameCollectReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UsernameCollectReq> get serializer =>
      _$UsernameCollectReqSerializer();
}

class _$UsernameCollectReqSerializer
    implements PrimitiveSerializer<UsernameCollectReq> {
  @override
  final Iterable<Type> types = const [UsernameCollectReq, _$UsernameCollectReq];

  @override
  final String wireName = r'UsernameCollectReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UsernameCollectReq object, {
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
    UsernameCollectReq object, {
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
    required UsernameCollectReqBuilder result,
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
  UsernameCollectReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsernameCollectReqBuilder();
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

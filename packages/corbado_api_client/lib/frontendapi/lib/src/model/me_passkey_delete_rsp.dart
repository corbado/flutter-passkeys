//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_passkey_delete_rsp.g.dart';

/// MePasskeyDeleteRsp
///
/// Properties:
/// * [id]
@BuiltValue()
abstract class MePasskeyDeleteRsp
    implements Built<MePasskeyDeleteRsp, MePasskeyDeleteRspBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  MePasskeyDeleteRsp._();

  factory MePasskeyDeleteRsp([void updates(MePasskeyDeleteRspBuilder b)]) =
      _$MePasskeyDeleteRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MePasskeyDeleteRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MePasskeyDeleteRsp> get serializer =>
      _$MePasskeyDeleteRspSerializer();
}

class _$MePasskeyDeleteRspSerializer
    implements PrimitiveSerializer<MePasskeyDeleteRsp> {
  @override
  final Iterable<Type> types = const [MePasskeyDeleteRsp, _$MePasskeyDeleteRsp];

  @override
  final String wireName = r'MePasskeyDeleteRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MePasskeyDeleteRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MePasskeyDeleteRsp object, {
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
    required MePasskeyDeleteRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MePasskeyDeleteRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MePasskeyDeleteRspBuilder();
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

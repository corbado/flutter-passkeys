//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_append_finish_req.g.dart';

/// ConnectAppendFinishReq
///
/// Properties:
/// * [attestationResponse]
@BuiltValue()
abstract class ConnectAppendFinishReq
    implements Built<ConnectAppendFinishReq, ConnectAppendFinishReqBuilder> {
  @BuiltValueField(wireName: r'attestationResponse')
  String get attestationResponse;

  ConnectAppendFinishReq._();

  factory ConnectAppendFinishReq(
          [void updates(ConnectAppendFinishReqBuilder b)]) =
      _$ConnectAppendFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectAppendFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectAppendFinishReq> get serializer =>
      _$ConnectAppendFinishReqSerializer();
}

class _$ConnectAppendFinishReqSerializer
    implements PrimitiveSerializer<ConnectAppendFinishReq> {
  @override
  final Iterable<Type> types = const [
    ConnectAppendFinishReq,
    _$ConnectAppendFinishReq
  ];

  @override
  final String wireName = r'ConnectAppendFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectAppendFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attestationResponse';
    yield serializers.serialize(
      object.attestationResponse,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectAppendFinishReq object, {
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
    required ConnectAppendFinishReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attestationResponse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attestationResponse = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectAppendFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectAppendFinishReqBuilder();
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

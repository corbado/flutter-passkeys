//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_append_finish_rsp.g.dart';

/// ConnectAppendFinishRsp
///
/// Properties:
/// * [passkeyOperation]
@BuiltValue()
abstract class ConnectAppendFinishRsp
    implements Built<ConnectAppendFinishRsp, ConnectAppendFinishRspBuilder> {
  @BuiltValueField(wireName: r'passkeyOperation')
  PasskeyOperation get passkeyOperation;

  ConnectAppendFinishRsp._();

  factory ConnectAppendFinishRsp(
          [void updates(ConnectAppendFinishRspBuilder b)]) =
      _$ConnectAppendFinishRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectAppendFinishRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectAppendFinishRsp> get serializer =>
      _$ConnectAppendFinishRspSerializer();
}

class _$ConnectAppendFinishRspSerializer
    implements PrimitiveSerializer<ConnectAppendFinishRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectAppendFinishRsp,
    _$ConnectAppendFinishRsp
  ];

  @override
  final String wireName = r'ConnectAppendFinishRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectAppendFinishRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'passkeyOperation';
    yield serializers.serialize(
      object.passkeyOperation,
      specifiedType: const FullType(PasskeyOperation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectAppendFinishRsp object, {
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
    required ConnectAppendFinishRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'passkeyOperation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyOperation),
          ) as PasskeyOperation;
          result.passkeyOperation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectAppendFinishRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectAppendFinishRspBuilder();
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

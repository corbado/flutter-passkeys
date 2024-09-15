//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_finish_rsp.g.dart';

/// ConnectLoginFinishRsp
///
/// Properties:
/// * [passkeyOperation]
/// * [session]
@BuiltValue()
abstract class ConnectLoginFinishRsp
    implements Built<ConnectLoginFinishRsp, ConnectLoginFinishRspBuilder> {
  @BuiltValueField(wireName: r'passkeyOperation')
  PasskeyOperation get passkeyOperation;

  @BuiltValueField(wireName: r'session')
  String get session;

  ConnectLoginFinishRsp._();

  factory ConnectLoginFinishRsp(
      [void updates(ConnectLoginFinishRspBuilder b)]) = _$ConnectLoginFinishRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginFinishRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginFinishRsp> get serializer =>
      _$ConnectLoginFinishRspSerializer();
}

class _$ConnectLoginFinishRspSerializer
    implements PrimitiveSerializer<ConnectLoginFinishRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginFinishRsp,
    _$ConnectLoginFinishRsp
  ];

  @override
  final String wireName = r'ConnectLoginFinishRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginFinishRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'passkeyOperation';
    yield serializers.serialize(
      object.passkeyOperation,
      specifiedType: const FullType(PasskeyOperation),
    );
    yield r'session';
    yield serializers.serialize(
      object.session,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectLoginFinishRsp object, {
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
    required ConnectLoginFinishRspBuilder result,
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
        case r'session':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.session = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectLoginFinishRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginFinishRspBuilder();
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

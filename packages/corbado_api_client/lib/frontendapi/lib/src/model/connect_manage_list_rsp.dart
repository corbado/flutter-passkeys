//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_list_rsp.g.dart';

/// ConnectManageListRsp
///
/// Properties:
/// * [passkeys]
@BuiltValue()
abstract class ConnectManageListRsp
    implements Built<ConnectManageListRsp, ConnectManageListRspBuilder> {
  @BuiltValueField(wireName: r'passkeys')
  BuiltList<Passkey> get passkeys;

  ConnectManageListRsp._();

  factory ConnectManageListRsp([void updates(ConnectManageListRspBuilder b)]) =
      _$ConnectManageListRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageListRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageListRsp> get serializer =>
      _$ConnectManageListRspSerializer();
}

class _$ConnectManageListRspSerializer
    implements PrimitiveSerializer<ConnectManageListRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectManageListRsp,
    _$ConnectManageListRsp
  ];

  @override
  final String wireName = r'ConnectManageListRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageListRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'passkeys';
    yield serializers.serialize(
      object.passkeys,
      specifiedType: const FullType(BuiltList, [FullType(Passkey)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectManageListRsp object, {
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
    required ConnectManageListRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'passkeys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Passkey)]),
          ) as BuiltList<Passkey>;
          result.passkeys.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectManageListRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageListRspBuilder();
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

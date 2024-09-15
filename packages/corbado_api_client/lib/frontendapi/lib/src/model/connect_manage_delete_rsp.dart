//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_delete_rsp.g.dart';

/// ConnectManageDeleteRsp
///
/// Properties:
/// * [credentialID]
@BuiltValue()
abstract class ConnectManageDeleteRsp
    implements Built<ConnectManageDeleteRsp, ConnectManageDeleteRspBuilder> {
  @BuiltValueField(wireName: r'credentialID')
  String get credentialID;

  ConnectManageDeleteRsp._();

  factory ConnectManageDeleteRsp(
          [void updates(ConnectManageDeleteRspBuilder b)]) =
      _$ConnectManageDeleteRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageDeleteRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageDeleteRsp> get serializer =>
      _$ConnectManageDeleteRspSerializer();
}

class _$ConnectManageDeleteRspSerializer
    implements PrimitiveSerializer<ConnectManageDeleteRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectManageDeleteRsp,
    _$ConnectManageDeleteRsp
  ];

  @override
  final String wireName = r'ConnectManageDeleteRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageDeleteRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'credentialID';
    yield serializers.serialize(
      object.credentialID,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectManageDeleteRsp object, {
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
    required ConnectManageDeleteRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'credentialID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.credentialID = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectManageDeleteRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageDeleteRspBuilder();
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

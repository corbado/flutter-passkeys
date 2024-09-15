//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_list_req.g.dart';

/// ConnectManageListReq
///
/// Properties:
/// * [connectToken]
@BuiltValue()
abstract class ConnectManageListReq
    implements Built<ConnectManageListReq, ConnectManageListReqBuilder> {
  @BuiltValueField(wireName: r'connectToken')
  String get connectToken;

  ConnectManageListReq._();

  factory ConnectManageListReq([void updates(ConnectManageListReqBuilder b)]) =
      _$ConnectManageListReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageListReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageListReq> get serializer =>
      _$ConnectManageListReqSerializer();
}

class _$ConnectManageListReqSerializer
    implements PrimitiveSerializer<ConnectManageListReq> {
  @override
  final Iterable<Type> types = const [
    ConnectManageListReq,
    _$ConnectManageListReq
  ];

  @override
  final String wireName = r'ConnectManageListReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageListReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'connectToken';
    yield serializers.serialize(
      object.connectToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectManageListReq object, {
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
    required ConnectManageListReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'connectToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.connectToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectManageListReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageListReqBuilder();
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

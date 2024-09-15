//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_delete_req.g.dart';

/// ConnectManageDeleteReq
///
/// Properties:
/// * [connectToken]
/// * [credentialID]
@BuiltValue()
abstract class ConnectManageDeleteReq
    implements Built<ConnectManageDeleteReq, ConnectManageDeleteReqBuilder> {
  @BuiltValueField(wireName: r'connectToken')
  String get connectToken;

  @BuiltValueField(wireName: r'credentialID')
  String get credentialID;

  ConnectManageDeleteReq._();

  factory ConnectManageDeleteReq(
          [void updates(ConnectManageDeleteReqBuilder b)]) =
      _$ConnectManageDeleteReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageDeleteReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageDeleteReq> get serializer =>
      _$ConnectManageDeleteReqSerializer();
}

class _$ConnectManageDeleteReqSerializer
    implements PrimitiveSerializer<ConnectManageDeleteReq> {
  @override
  final Iterable<Type> types = const [
    ConnectManageDeleteReq,
    _$ConnectManageDeleteReq
  ];

  @override
  final String wireName = r'ConnectManageDeleteReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageDeleteReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'connectToken';
    yield serializers.serialize(
      object.connectToken,
      specifiedType: const FullType(String),
    );
    yield r'credentialID';
    yield serializers.serialize(
      object.credentialID,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectManageDeleteReq object, {
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
    required ConnectManageDeleteReqBuilder result,
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
  ConnectManageDeleteReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageDeleteReqBuilder();
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

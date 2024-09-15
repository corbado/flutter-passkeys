//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/client_information_v2.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_init_req.g.dart';

/// ConnectManageInitReq
///
/// Properties:
/// * [clientInformation]
/// * [flags]
@BuiltValue()
abstract class ConnectManageInitReq
    implements Built<ConnectManageInitReq, ConnectManageInitReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformationV2 get clientInformation;

  @BuiltValueField(wireName: r'flags')
  BuiltMap<String, String> get flags;

  ConnectManageInitReq._();

  factory ConnectManageInitReq([void updates(ConnectManageInitReqBuilder b)]) =
      _$ConnectManageInitReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageInitReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageInitReq> get serializer =>
      _$ConnectManageInitReqSerializer();
}

class _$ConnectManageInitReqSerializer
    implements PrimitiveSerializer<ConnectManageInitReq> {
  @override
  final Iterable<Type> types = const [
    ConnectManageInitReq,
    _$ConnectManageInitReq
  ];

  @override
  final String wireName = r'ConnectManageInitReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageInitReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clientInformation';
    yield serializers.serialize(
      object.clientInformation,
      specifiedType: const FullType(ClientInformationV2),
    );
    yield r'flags';
    yield serializers.serialize(
      object.flags,
      specifiedType:
          const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectManageInitReq object, {
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
    required ConnectManageInitReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clientInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClientInformationV2),
          ) as ClientInformationV2;
          result.clientInformation.replace(valueDes);
          break;
        case r'flags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.flags.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectManageInitReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageInitReqBuilder();
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

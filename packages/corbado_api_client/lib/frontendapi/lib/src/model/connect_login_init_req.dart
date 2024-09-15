//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/client_information_v2.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_init_req.g.dart';

/// ConnectLoginInitReq
///
/// Properties:
/// * [clientInformation]
/// * [flags]
@BuiltValue()
abstract class ConnectLoginInitReq
    implements Built<ConnectLoginInitReq, ConnectLoginInitReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformationV2 get clientInformation;

  @BuiltValueField(wireName: r'flags')
  BuiltMap<String, String> get flags;

  ConnectLoginInitReq._();

  factory ConnectLoginInitReq([void updates(ConnectLoginInitReqBuilder b)]) =
      _$ConnectLoginInitReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginInitReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginInitReq> get serializer =>
      _$ConnectLoginInitReqSerializer();
}

class _$ConnectLoginInitReqSerializer
    implements PrimitiveSerializer<ConnectLoginInitReq> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginInitReq,
    _$ConnectLoginInitReq
  ];

  @override
  final String wireName = r'ConnectLoginInitReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginInitReq object, {
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
    ConnectLoginInitReq object, {
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
    required ConnectLoginInitReqBuilder result,
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
  ConnectLoginInitReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginInitReqBuilder();
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

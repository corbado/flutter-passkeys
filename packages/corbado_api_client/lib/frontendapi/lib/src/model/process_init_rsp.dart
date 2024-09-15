//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/process_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_init_rsp.g.dart';

/// tbd.
///
/// Properties:
/// * [token]
/// * [expiresAt]
/// * [processResponse]
/// * [newClientEnvHandle]
@BuiltValue()
abstract class ProcessInitRsp
    implements Built<ProcessInitRsp, ProcessInitRspBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  @BuiltValueField(wireName: r'processResponse')
  ProcessResponse get processResponse;

  @BuiltValueField(wireName: r'newClientEnvHandle')
  String? get newClientEnvHandle;

  ProcessInitRsp._();

  factory ProcessInitRsp([void updates(ProcessInitRspBuilder b)]) =
      _$ProcessInitRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessInitRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessInitRsp> get serializer =>
      _$ProcessInitRspSerializer();
}

class _$ProcessInitRspSerializer
    implements PrimitiveSerializer<ProcessInitRsp> {
  @override
  final Iterable<Type> types = const [ProcessInitRsp, _$ProcessInitRsp];

  @override
  final String wireName = r'ProcessInitRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessInitRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'expiresAt';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(int),
    );
    yield r'processResponse';
    yield serializers.serialize(
      object.processResponse,
      specifiedType: const FullType(ProcessResponse),
    );
    if (object.newClientEnvHandle != null) {
      yield r'newClientEnvHandle';
      yield serializers.serialize(
        object.newClientEnvHandle,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessInitRsp object, {
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
    required ProcessInitRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresAt = valueDes;
          break;
        case r'processResponse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProcessResponse),
          ) as ProcessResponse;
          result.processResponse.replace(valueDes);
          break;
        case r'newClientEnvHandle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newClientEnvHandle = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessInitRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessInitRspBuilder();
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

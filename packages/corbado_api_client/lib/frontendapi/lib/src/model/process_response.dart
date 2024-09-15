//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/process_common.dart';
import 'package:corbado_frontend_api_client/src/model/process_static_info.dart';
import 'package:corbado_frontend_api_client/src/model/block_body.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_response.g.dart';

/// ProcessResponse
///
/// Properties:
/// * [blockBody]
/// * [common]
/// * [newProcess]
@BuiltValue()
abstract class ProcessResponse
    implements Built<ProcessResponse, ProcessResponseBuilder> {
  @BuiltValueField(wireName: r'blockBody')
  BlockBody get blockBody;

  @BuiltValueField(wireName: r'common')
  ProcessCommon get common;

  @BuiltValueField(wireName: r'newProcess')
  ProcessStaticInfo? get newProcess;

  ProcessResponse._();

  factory ProcessResponse([void updates(ProcessResponseBuilder b)]) =
      _$ProcessResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessResponse> get serializer =>
      _$ProcessResponseSerializer();
}

class _$ProcessResponseSerializer
    implements PrimitiveSerializer<ProcessResponse> {
  @override
  final Iterable<Type> types = const [ProcessResponse, _$ProcessResponse];

  @override
  final String wireName = r'ProcessResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockBody';
    yield serializers.serialize(
      object.blockBody,
      specifiedType: const FullType(BlockBody),
    );
    yield r'common';
    yield serializers.serialize(
      object.common,
      specifiedType: const FullType(ProcessCommon),
    );
    if (object.newProcess != null) {
      yield r'newProcess';
      yield serializers.serialize(
        object.newProcess,
        specifiedType: const FullType(ProcessStaticInfo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessResponse object, {
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
    required ProcessResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'blockBody':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockBody),
          ) as BlockBody;
          result.blockBody.replace(valueDes);
          break;
        case r'common':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProcessCommon),
          ) as ProcessCommon;
          result.common.replace(valueDes);
          break;
        case r'newProcess':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProcessStaticInfo),
          ) as ProcessStaticInfo;
          result.newProcess.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessResponseBuilder();
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

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_information.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_passkeys_append_start_req.g.dart';

/// MePasskeysAppendStartReq
///
/// Properties:
/// * [clientInformation]
@BuiltValue()
abstract class MePasskeysAppendStartReq
    implements
        Built<MePasskeysAppendStartReq, MePasskeysAppendStartReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformation get clientInformation;

  MePasskeysAppendStartReq._();

  factory MePasskeysAppendStartReq(
          [void updates(MePasskeysAppendStartReqBuilder b)]) =
      _$MePasskeysAppendStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MePasskeysAppendStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MePasskeysAppendStartReq> get serializer =>
      _$MePasskeysAppendStartReqSerializer();
}

class _$MePasskeysAppendStartReqSerializer
    implements PrimitiveSerializer<MePasskeysAppendStartReq> {
  @override
  final Iterable<Type> types = const [
    MePasskeysAppendStartReq,
    _$MePasskeysAppendStartReq
  ];

  @override
  final String wireName = r'MePasskeysAppendStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MePasskeysAppendStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clientInformation';
    yield serializers.serialize(
      object.clientInformation,
      specifiedType: const FullType(ClientInformation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MePasskeysAppendStartReq object, {
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
    required MePasskeysAppendStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clientInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClientInformation),
          ) as ClientInformation;
          result.clientInformation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MePasskeysAppendStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MePasskeysAppendStartReqBuilder();
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

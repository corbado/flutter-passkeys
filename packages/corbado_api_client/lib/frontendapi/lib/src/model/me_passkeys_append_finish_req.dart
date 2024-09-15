//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_information.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_passkeys_append_finish_req.g.dart';

/// MePasskeysAppendFinishReq
///
/// Properties:
/// * [attestationResponse]
/// * [clientInformation]
@BuiltValue()
abstract class MePasskeysAppendFinishReq
    implements
        Built<MePasskeysAppendFinishReq, MePasskeysAppendFinishReqBuilder> {
  @BuiltValueField(wireName: r'attestationResponse')
  String get attestationResponse;

  @BuiltValueField(wireName: r'clientInformation')
  ClientInformation get clientInformation;

  MePasskeysAppendFinishReq._();

  factory MePasskeysAppendFinishReq(
          [void updates(MePasskeysAppendFinishReqBuilder b)]) =
      _$MePasskeysAppendFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MePasskeysAppendFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MePasskeysAppendFinishReq> get serializer =>
      _$MePasskeysAppendFinishReqSerializer();
}

class _$MePasskeysAppendFinishReqSerializer
    implements PrimitiveSerializer<MePasskeysAppendFinishReq> {
  @override
  final Iterable<Type> types = const [
    MePasskeysAppendFinishReq,
    _$MePasskeysAppendFinishReq
  ];

  @override
  final String wireName = r'MePasskeysAppendFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MePasskeysAppendFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attestationResponse';
    yield serializers.serialize(
      object.attestationResponse,
      specifiedType: const FullType(String),
    );
    yield r'clientInformation';
    yield serializers.serialize(
      object.clientInformation,
      specifiedType: const FullType(ClientInformation),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MePasskeysAppendFinishReq object, {
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
    required MePasskeysAppendFinishReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attestationResponse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attestationResponse = valueDes;
          break;
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
  MePasskeysAppendFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MePasskeysAppendFinishReqBuilder();
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

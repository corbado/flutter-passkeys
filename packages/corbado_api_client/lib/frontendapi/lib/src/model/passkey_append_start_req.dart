//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_information_v2.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_append_start_req.g.dart';

/// PasskeyAppendStartReq
///
/// Properties:
/// * [clientInformation]
@BuiltValue()
abstract class PasskeyAppendStartReq
    implements Built<PasskeyAppendStartReq, PasskeyAppendStartReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformationV2? get clientInformation;

  PasskeyAppendStartReq._();

  factory PasskeyAppendStartReq(
      [void updates(PasskeyAppendStartReqBuilder b)]) = _$PasskeyAppendStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyAppendStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyAppendStartReq> get serializer =>
      _$PasskeyAppendStartReqSerializer();
}

class _$PasskeyAppendStartReqSerializer
    implements PrimitiveSerializer<PasskeyAppendStartReq> {
  @override
  final Iterable<Type> types = const [
    PasskeyAppendStartReq,
    _$PasskeyAppendStartReq
  ];

  @override
  final String wireName = r'PasskeyAppendStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyAppendStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.clientInformation != null) {
      yield r'clientInformation';
      yield serializers.serialize(
        object.clientInformation,
        specifiedType: const FullType(ClientInformationV2),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PasskeyAppendStartReq object, {
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
    required PasskeyAppendStartReqBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasskeyAppendStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyAppendStartReqBuilder();
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

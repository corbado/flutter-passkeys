//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_information_v2.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_login_start_req.g.dart';

/// PasskeyLoginStartReq
///
/// Properties:
/// * [clientInformation]
@BuiltValue()
abstract class PasskeyLoginStartReq
    implements Built<PasskeyLoginStartReq, PasskeyLoginStartReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformationV2? get clientInformation;

  PasskeyLoginStartReq._();

  factory PasskeyLoginStartReq([void updates(PasskeyLoginStartReqBuilder b)]) =
      _$PasskeyLoginStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyLoginStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyLoginStartReq> get serializer =>
      _$PasskeyLoginStartReqSerializer();
}

class _$PasskeyLoginStartReqSerializer
    implements PrimitiveSerializer<PasskeyLoginStartReq> {
  @override
  final Iterable<Type> types = const [
    PasskeyLoginStartReq,
    _$PasskeyLoginStartReq
  ];

  @override
  final String wireName = r'PasskeyLoginStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyLoginStartReq object, {
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
    PasskeyLoginStartReq object, {
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
    required PasskeyLoginStartReqBuilder result,
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
  PasskeyLoginStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyLoginStartReqBuilder();
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

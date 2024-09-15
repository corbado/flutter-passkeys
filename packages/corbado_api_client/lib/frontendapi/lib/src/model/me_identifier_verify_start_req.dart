//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_information.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_identifier_verify_start_req.g.dart';

/// tbd.
///
/// Properties:
/// * [identifierID]
/// * [clientInformation]
@BuiltValue()
abstract class MeIdentifierVerifyStartReq
    implements
        Built<MeIdentifierVerifyStartReq, MeIdentifierVerifyStartReqBuilder> {
  @BuiltValueField(wireName: r'identifierID')
  String get identifierID;

  @BuiltValueField(wireName: r'clientInformation')
  ClientInformation get clientInformation;

  MeIdentifierVerifyStartReq._();

  factory MeIdentifierVerifyStartReq(
          [void updates(MeIdentifierVerifyStartReqBuilder b)]) =
      _$MeIdentifierVerifyStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeIdentifierVerifyStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeIdentifierVerifyStartReq> get serializer =>
      _$MeIdentifierVerifyStartReqSerializer();
}

class _$MeIdentifierVerifyStartReqSerializer
    implements PrimitiveSerializer<MeIdentifierVerifyStartReq> {
  @override
  final Iterable<Type> types = const [
    MeIdentifierVerifyStartReq,
    _$MeIdentifierVerifyStartReq
  ];

  @override
  final String wireName = r'MeIdentifierVerifyStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeIdentifierVerifyStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierID';
    yield serializers.serialize(
      object.identifierID,
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
    MeIdentifierVerifyStartReq object, {
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
    required MeIdentifierVerifyStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifierID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierID = valueDes;
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
  MeIdentifierVerifyStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeIdentifierVerifyStartReqBuilder();
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

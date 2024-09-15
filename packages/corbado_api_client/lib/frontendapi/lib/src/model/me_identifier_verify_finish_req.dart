//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_identifier_verify_finish_req.g.dart';

/// MeIdentifierVerifyFinishReq
///
/// Properties:
/// * [identifierID]
/// * [code]
@BuiltValue()
abstract class MeIdentifierVerifyFinishReq
    implements
        Built<MeIdentifierVerifyFinishReq, MeIdentifierVerifyFinishReqBuilder> {
  @BuiltValueField(wireName: r'identifierID')
  String get identifierID;

  @BuiltValueField(wireName: r'code')
  String get code;

  MeIdentifierVerifyFinishReq._();

  factory MeIdentifierVerifyFinishReq(
          [void updates(MeIdentifierVerifyFinishReqBuilder b)]) =
      _$MeIdentifierVerifyFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeIdentifierVerifyFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeIdentifierVerifyFinishReq> get serializer =>
      _$MeIdentifierVerifyFinishReqSerializer();
}

class _$MeIdentifierVerifyFinishReqSerializer
    implements PrimitiveSerializer<MeIdentifierVerifyFinishReq> {
  @override
  final Iterable<Type> types = const [
    MeIdentifierVerifyFinishReq,
    _$MeIdentifierVerifyFinishReq
  ];

  @override
  final String wireName = r'MeIdentifierVerifyFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeIdentifierVerifyFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierID';
    yield serializers.serialize(
      object.identifierID,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MeIdentifierVerifyFinishReq object, {
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
    required MeIdentifierVerifyFinishReqBuilder result,
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
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MeIdentifierVerifyFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeIdentifierVerifyFinishReqBuilder();
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

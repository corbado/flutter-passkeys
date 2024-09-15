//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'identifier_verify_start_req.g.dart';

/// tbd.
///
/// Properties:
/// * [identifierType]
/// * [verificationType]
@BuiltValue()
abstract class IdentifierVerifyStartReq
    implements
        Built<IdentifierVerifyStartReq, IdentifierVerifyStartReqBuilder> {
  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'verificationType')
  VerificationMethod get verificationType;
  // enum verificationTypeEnum {  email-link,  email-otp,  phone-otp,  };

  IdentifierVerifyStartReq._();

  factory IdentifierVerifyStartReq(
          [void updates(IdentifierVerifyStartReqBuilder b)]) =
      _$IdentifierVerifyStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IdentifierVerifyStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IdentifierVerifyStartReq> get serializer =>
      _$IdentifierVerifyStartReqSerializer();
}

class _$IdentifierVerifyStartReqSerializer
    implements PrimitiveSerializer<IdentifierVerifyStartReq> {
  @override
  final Iterable<Type> types = const [
    IdentifierVerifyStartReq,
    _$IdentifierVerifyStartReq
  ];

  @override
  final String wireName = r'IdentifierVerifyStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IdentifierVerifyStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierType';
    yield serializers.serialize(
      object.identifierType,
      specifiedType: const FullType(LoginIdentifierType),
    );
    yield r'verificationType';
    yield serializers.serialize(
      object.verificationType,
      specifiedType: const FullType(VerificationMethod),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IdentifierVerifyStartReq object, {
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
    required IdentifierVerifyStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifierType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LoginIdentifierType),
          ) as LoginIdentifierType;
          result.identifierType = valueDes;
          break;
        case r'verificationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VerificationMethod),
          ) as VerificationMethod;
          result.verificationType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IdentifierVerifyStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IdentifierVerifyStartReqBuilder();
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

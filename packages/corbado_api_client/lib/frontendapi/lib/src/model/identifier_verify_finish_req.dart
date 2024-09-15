//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'identifier_verify_finish_req.g.dart';

/// IdentifierVerifyFinishReq
///
/// Properties:
/// * [code]
/// * [identifierType]
/// * [verificationType]
/// * [isNewDevice]
@BuiltValue()
abstract class IdentifierVerifyFinishReq
    implements
        Built<IdentifierVerifyFinishReq, IdentifierVerifyFinishReqBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'identifierType')
  LoginIdentifierType get identifierType;
  // enum identifierTypeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'verificationType')
  VerificationMethod get verificationType;
  // enum verificationTypeEnum {  email-link,  email-otp,  phone-otp,  };

  @BuiltValueField(wireName: r'isNewDevice')
  bool get isNewDevice;

  IdentifierVerifyFinishReq._();

  factory IdentifierVerifyFinishReq(
          [void updates(IdentifierVerifyFinishReqBuilder b)]) =
      _$IdentifierVerifyFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IdentifierVerifyFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IdentifierVerifyFinishReq> get serializer =>
      _$IdentifierVerifyFinishReqSerializer();
}

class _$IdentifierVerifyFinishReqSerializer
    implements PrimitiveSerializer<IdentifierVerifyFinishReq> {
  @override
  final Iterable<Type> types = const [
    IdentifierVerifyFinishReq,
    _$IdentifierVerifyFinishReq
  ];

  @override
  final String wireName = r'IdentifierVerifyFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IdentifierVerifyFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
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
    yield r'isNewDevice';
    yield serializers.serialize(
      object.isNewDevice,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IdentifierVerifyFinishReq object, {
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
    required IdentifierVerifyFinishReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
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
        case r'isNewDevice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isNewDevice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IdentifierVerifyFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IdentifierVerifyFinishReqBuilder();
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

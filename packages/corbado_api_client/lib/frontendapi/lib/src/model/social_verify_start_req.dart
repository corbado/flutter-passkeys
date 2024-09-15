//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/auth_type.dart';
import 'package:corbado_frontend_api_client/src/model/social_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_verify_start_req.g.dart';

/// SocialVerifyStartReq
///
/// Properties:
/// * [providerType]
/// * [redirectUrl]
/// * [authType]
@BuiltValue()
abstract class SocialVerifyStartReq
    implements Built<SocialVerifyStartReq, SocialVerifyStartReqBuilder> {
  @BuiltValueField(wireName: r'providerType')
  SocialProviderType get providerType;
  // enum providerTypeEnum {  google,  microsoft,  github,  };

  @BuiltValueField(wireName: r'redirectUrl')
  String get redirectUrl;

  @BuiltValueField(wireName: r'authType')
  AuthType get authType;
  // enum authTypeEnum {  signup,  login,  };

  SocialVerifyStartReq._();

  factory SocialVerifyStartReq([void updates(SocialVerifyStartReqBuilder b)]) =
      _$SocialVerifyStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SocialVerifyStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SocialVerifyStartReq> get serializer =>
      _$SocialVerifyStartReqSerializer();
}

class _$SocialVerifyStartReqSerializer
    implements PrimitiveSerializer<SocialVerifyStartReq> {
  @override
  final Iterable<Type> types = const [
    SocialVerifyStartReq,
    _$SocialVerifyStartReq
  ];

  @override
  final String wireName = r'SocialVerifyStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SocialVerifyStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'providerType';
    yield serializers.serialize(
      object.providerType,
      specifiedType: const FullType(SocialProviderType),
    );
    yield r'redirectUrl';
    yield serializers.serialize(
      object.redirectUrl,
      specifiedType: const FullType(String),
    );
    yield r'authType';
    yield serializers.serialize(
      object.authType,
      specifiedType: const FullType(AuthType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SocialVerifyStartReq object, {
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
    required SocialVerifyStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'providerType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SocialProviderType),
          ) as SocialProviderType;
          result.providerType = valueDes;
          break;
        case r'redirectUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.redirectUrl = valueDes;
          break;
        case r'authType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AuthType),
          ) as AuthType;
          result.authType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SocialVerifyStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SocialVerifyStartReqBuilder();
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

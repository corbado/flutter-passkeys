//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/social_data.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_login_init.g.dart';

/// GeneralBlockLoginInit
///
/// Properties:
/// * [blockType]
/// * [identifierValue]
/// * [isPhone]
/// * [isPhoneAvailable]
/// * [isEmailAvailable]
/// * [isUsernameAvailable]
/// * [socialData]
/// * [conditionalUIChallenge]
/// * [fieldError]
/// * [error]
@BuiltValue()
abstract class GeneralBlockLoginInit
    implements Built<GeneralBlockLoginInit, GeneralBlockLoginInitBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'isPhone')
  bool get isPhone;

  @BuiltValueField(wireName: r'isPhoneAvailable')
  bool get isPhoneAvailable;

  @BuiltValueField(wireName: r'isEmailAvailable')
  bool get isEmailAvailable;

  @BuiltValueField(wireName: r'isUsernameAvailable')
  bool get isUsernameAvailable;

  @BuiltValueField(wireName: r'socialData')
  SocialData get socialData;

  @BuiltValueField(wireName: r'conditionalUIChallenge')
  String? get conditionalUIChallenge;

  @BuiltValueField(wireName: r'fieldError')
  RequestError? get fieldError;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  GeneralBlockLoginInit._();

  factory GeneralBlockLoginInit(
      [void updates(GeneralBlockLoginInitBuilder b)]) = _$GeneralBlockLoginInit;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockLoginInitBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockLoginInit> get serializer =>
      _$GeneralBlockLoginInitSerializer();
}

class _$GeneralBlockLoginInitSerializer
    implements PrimitiveSerializer<GeneralBlockLoginInit> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockLoginInit,
    _$GeneralBlockLoginInit
  ];

  @override
  final String wireName = r'GeneralBlockLoginInit';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockLoginInit object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
    yield r'identifierValue';
    yield serializers.serialize(
      object.identifierValue,
      specifiedType: const FullType(String),
    );
    yield r'isPhone';
    yield serializers.serialize(
      object.isPhone,
      specifiedType: const FullType(bool),
    );
    yield r'isPhoneAvailable';
    yield serializers.serialize(
      object.isPhoneAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'isEmailAvailable';
    yield serializers.serialize(
      object.isEmailAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'isUsernameAvailable';
    yield serializers.serialize(
      object.isUsernameAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'socialData';
    yield serializers.serialize(
      object.socialData,
      specifiedType: const FullType(SocialData),
    );
    if (object.conditionalUIChallenge != null) {
      yield r'conditionalUIChallenge';
      yield serializers.serialize(
        object.conditionalUIChallenge,
        specifiedType: const FullType(String),
      );
    }
    if (object.fieldError != null) {
      yield r'fieldError';
      yield serializers.serialize(
        object.fieldError,
        specifiedType: const FullType(RequestError),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(RequestError),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockLoginInit object, {
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
    required GeneralBlockLoginInitBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'blockType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.blockType = valueDes;
          break;
        case r'identifierValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierValue = valueDes;
          break;
        case r'isPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPhone = valueDes;
          break;
        case r'isPhoneAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPhoneAvailable = valueDes;
          break;
        case r'isEmailAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isEmailAvailable = valueDes;
          break;
        case r'isUsernameAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isUsernameAvailable = valueDes;
          break;
        case r'socialData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SocialData),
          ) as SocialData;
          result.socialData.replace(valueDes);
          break;
        case r'conditionalUIChallenge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conditionalUIChallenge = valueDes;
          break;
        case r'fieldError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RequestError),
          ) as RequestError;
          result.fieldError.replace(valueDes);
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RequestError),
          ) as RequestError;
          result.error.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockLoginInit deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockLoginInitBuilder();
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

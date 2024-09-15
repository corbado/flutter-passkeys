//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/social_data.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/full_name_with_error.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_with_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_signup_init.g.dart';

/// GeneralBlockSignupInit
///
/// Properties:
/// * [blockType]
/// * [identifiers]
/// * [fullName]
/// * [socialData]
/// * [error]
@BuiltValue()
abstract class GeneralBlockSignupInit
    implements Built<GeneralBlockSignupInit, GeneralBlockSignupInitBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'identifiers')
  BuiltList<LoginIdentifierWithError> get identifiers;

  @BuiltValueField(wireName: r'fullName')
  FullNameWithError? get fullName;

  @BuiltValueField(wireName: r'socialData')
  SocialData? get socialData;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  GeneralBlockSignupInit._();

  factory GeneralBlockSignupInit(
          [void updates(GeneralBlockSignupInitBuilder b)]) =
      _$GeneralBlockSignupInit;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockSignupInitBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockSignupInit> get serializer =>
      _$GeneralBlockSignupInitSerializer();
}

class _$GeneralBlockSignupInitSerializer
    implements PrimitiveSerializer<GeneralBlockSignupInit> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockSignupInit,
    _$GeneralBlockSignupInit
  ];

  @override
  final String wireName = r'GeneralBlockSignupInit';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockSignupInit object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
    yield r'identifiers';
    yield serializers.serialize(
      object.identifiers,
      specifiedType:
          const FullType(BuiltList, [FullType(LoginIdentifierWithError)]),
    );
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(FullNameWithError),
      );
    }
    if (object.socialData != null) {
      yield r'socialData';
      yield serializers.serialize(
        object.socialData,
        specifiedType: const FullType(SocialData),
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
    GeneralBlockSignupInit object, {
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
    required GeneralBlockSignupInitBuilder result,
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
        case r'identifiers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(LoginIdentifierWithError)]),
          ) as BuiltList<LoginIdentifierWithError>;
          result.identifiers.replace(valueDes);
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FullNameWithError),
          ) as FullNameWithError;
          result.fullName.replace(valueDes);
          break;
        case r'socialData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SocialData),
          ) as SocialData;
          result.socialData.replace(valueDes);
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
  GeneralBlockSignupInit deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockSignupInitBuilder();
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

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_verify_identifier_alternative_verification_methods_inner.dart';
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_verify_identifier.g.dart';

/// GeneralBlockVerifyIdentifier
///
/// Properties:
/// * [blockType]
/// * [verificationMethod]
/// * [identifier]
/// * [alternativeVerificationMethods]
/// * [isPostLoginVerification]
/// * [retryNotBefore]
/// * [error]
@BuiltValue()
abstract class GeneralBlockVerifyIdentifier
    implements
        Built<GeneralBlockVerifyIdentifier,
            GeneralBlockVerifyIdentifierBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'verificationMethod')
  VerificationMethod get verificationMethod;
  // enum verificationMethodEnum {  email-link,  email-otp,  phone-otp,  };

  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  @BuiltValueField(wireName: r'alternativeVerificationMethods')
  BuiltList<GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>
      get alternativeVerificationMethods;

  @BuiltValueField(wireName: r'isPostLoginVerification')
  bool get isPostLoginVerification;

  @BuiltValueField(wireName: r'retryNotBefore')
  int? get retryNotBefore;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  GeneralBlockVerifyIdentifier._();

  factory GeneralBlockVerifyIdentifier(
          [void updates(GeneralBlockVerifyIdentifierBuilder b)]) =
      _$GeneralBlockVerifyIdentifier;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockVerifyIdentifierBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockVerifyIdentifier> get serializer =>
      _$GeneralBlockVerifyIdentifierSerializer();
}

class _$GeneralBlockVerifyIdentifierSerializer
    implements PrimitiveSerializer<GeneralBlockVerifyIdentifier> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockVerifyIdentifier,
    _$GeneralBlockVerifyIdentifier
  ];

  @override
  final String wireName = r'GeneralBlockVerifyIdentifier';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockVerifyIdentifier object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
    yield r'verificationMethod';
    yield serializers.serialize(
      object.verificationMethod,
      specifiedType: const FullType(VerificationMethod),
    );
    yield r'identifier';
    yield serializers.serialize(
      object.identifier,
      specifiedType: const FullType(String),
    );
    yield r'alternativeVerificationMethods';
    yield serializers.serialize(
      object.alternativeVerificationMethods,
      specifiedType: const FullType(BuiltList, [
        FullType(
            GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner)
      ]),
    );
    yield r'isPostLoginVerification';
    yield serializers.serialize(
      object.isPostLoginVerification,
      specifiedType: const FullType(bool),
    );
    if (object.retryNotBefore != null) {
      yield r'retryNotBefore';
      yield serializers.serialize(
        object.retryNotBefore,
        specifiedType: const FullType(int),
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
    GeneralBlockVerifyIdentifier object, {
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
    required GeneralBlockVerifyIdentifierBuilder result,
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
        case r'verificationMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VerificationMethod),
          ) as VerificationMethod;
          result.verificationMethod = valueDes;
          break;
        case r'identifier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifier = valueDes;
          break;
        case r'alternativeVerificationMethods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [
              FullType(
                  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner)
            ]),
          ) as BuiltList<
              GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>;
          result.alternativeVerificationMethods.replace(valueDes);
          break;
        case r'isPostLoginVerification':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPostLoginVerification = valueDes;
          break;
        case r'retryNotBefore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.retryNotBefore = valueDes;
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
  GeneralBlockVerifyIdentifier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockVerifyIdentifierBuilder();
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

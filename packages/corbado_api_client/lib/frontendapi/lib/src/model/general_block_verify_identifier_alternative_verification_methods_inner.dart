//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_verify_identifier_alternative_verification_methods_inner.g.dart';

/// GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner
///
/// Properties:
/// * [verificationMethod]
/// * [identifier]
@BuiltValue()
abstract class GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner
    implements
        Built<GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner,
            GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder> {
  @BuiltValueField(wireName: r'verificationMethod')
  VerificationMethod get verificationMethod;
  // enum verificationMethodEnum {  email-link,  email-otp,  phone-otp,  };

  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner._();

  factory GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner(
          [void updates(
              GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
                  b)]) =
      _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
              b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<
          GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>
      get serializer =>
          _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerSerializer();
}

class _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerSerializer
    implements
        PrimitiveSerializer<
            GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner,
    _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner
  ];

  @override
  final String wireName =
      r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner object, {
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
    required GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
        result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder();
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

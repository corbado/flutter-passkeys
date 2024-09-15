//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_post_signup_email_verify.g.dart';

/// GeneralBlockPostSignupEmailVerify
///
/// Properties:
/// * [blockType]
/// * [error]
@BuiltValue()
abstract class GeneralBlockPostSignupEmailVerify
    implements
        Built<GeneralBlockPostSignupEmailVerify,
            GeneralBlockPostSignupEmailVerifyBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  GeneralBlockPostSignupEmailVerify._();

  factory GeneralBlockPostSignupEmailVerify(
          [void updates(GeneralBlockPostSignupEmailVerifyBuilder b)]) =
      _$GeneralBlockPostSignupEmailVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockPostSignupEmailVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockPostSignupEmailVerify> get serializer =>
      _$GeneralBlockPostSignupEmailVerifySerializer();
}

class _$GeneralBlockPostSignupEmailVerifySerializer
    implements PrimitiveSerializer<GeneralBlockPostSignupEmailVerify> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockPostSignupEmailVerify,
    _$GeneralBlockPostSignupEmailVerify
  ];

  @override
  final String wireName = r'GeneralBlockPostSignupEmailVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockPostSignupEmailVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
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
    GeneralBlockPostSignupEmailVerify object, {
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
    required GeneralBlockPostSignupEmailVerifyBuilder result,
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
  GeneralBlockPostSignupEmailVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockPostSignupEmailVerifyBuilder();
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

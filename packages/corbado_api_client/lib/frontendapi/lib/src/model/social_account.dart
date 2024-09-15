//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/social_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_account.g.dart';

/// SocialAccount
///
/// Properties:
/// * [providerType]
/// * [identifierValue]
/// * [avatarUrl]
/// * [fullName]
@BuiltValue()
abstract class SocialAccount
    implements Built<SocialAccount, SocialAccountBuilder> {
  @BuiltValueField(wireName: r'providerType')
  SocialProviderType get providerType;
  // enum providerTypeEnum {  google,  microsoft,  github,  };

  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'avatarUrl')
  String get avatarUrl;

  @BuiltValueField(wireName: r'fullName')
  String get fullName;

  SocialAccount._();

  factory SocialAccount([void updates(SocialAccountBuilder b)]) =
      _$SocialAccount;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SocialAccountBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SocialAccount> get serializer =>
      _$SocialAccountSerializer();
}

class _$SocialAccountSerializer implements PrimitiveSerializer<SocialAccount> {
  @override
  final Iterable<Type> types = const [SocialAccount, _$SocialAccount];

  @override
  final String wireName = r'SocialAccount';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SocialAccount object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'providerType';
    yield serializers.serialize(
      object.providerType,
      specifiedType: const FullType(SocialProviderType),
    );
    yield r'identifierValue';
    yield serializers.serialize(
      object.identifierValue,
      specifiedType: const FullType(String),
    );
    yield r'avatarUrl';
    yield serializers.serialize(
      object.avatarUrl,
      specifiedType: const FullType(String),
    );
    yield r'fullName';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SocialAccount object, {
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
    required SocialAccountBuilder result,
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
        case r'identifierValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierValue = valueDes;
          break;
        case r'avatarUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.avatarUrl = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SocialAccount deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SocialAccountBuilder();
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

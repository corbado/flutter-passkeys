//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_identifier_config.g.dart';

/// LoginIdentifierConfig
///
/// Properties:
/// * [type]
@BuiltValue()
abstract class LoginIdentifierConfig
    implements Built<LoginIdentifierConfig, LoginIdentifierConfigBuilder> {
  @BuiltValueField(wireName: r'type')
  LoginIdentifierType get type;
  // enum typeEnum {  email,  phone,  username,  };

  LoginIdentifierConfig._();

  factory LoginIdentifierConfig(
      [void updates(LoginIdentifierConfigBuilder b)]) = _$LoginIdentifierConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginIdentifierConfigBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginIdentifierConfig> get serializer =>
      _$LoginIdentifierConfigSerializer();
}

class _$LoginIdentifierConfigSerializer
    implements PrimitiveSerializer<LoginIdentifierConfig> {
  @override
  final Iterable<Type> types = const [
    LoginIdentifierConfig,
    _$LoginIdentifierConfig
  ];

  @override
  final String wireName = r'LoginIdentifierConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginIdentifierConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(LoginIdentifierType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginIdentifierConfig object, {
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
    required LoginIdentifierConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LoginIdentifierType),
          ) as LoginIdentifierType;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginIdentifierConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginIdentifierConfigBuilder();
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

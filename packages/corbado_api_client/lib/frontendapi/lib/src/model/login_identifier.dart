//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_identifier.g.dart';

/// LoginIdentifier
///
/// Properties:
/// * [type]
/// * [identifier]
@BuiltValue()
abstract class LoginIdentifier
    implements Built<LoginIdentifier, LoginIdentifierBuilder> {
  @BuiltValueField(wireName: r'type')
  LoginIdentifierType get type;
  // enum typeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  LoginIdentifier._();

  factory LoginIdentifier([void updates(LoginIdentifierBuilder b)]) =
      _$LoginIdentifier;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginIdentifierBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginIdentifier> get serializer =>
      _$LoginIdentifierSerializer();
}

class _$LoginIdentifierSerializer
    implements PrimitiveSerializer<LoginIdentifier> {
  @override
  final Iterable<Type> types = const [LoginIdentifier, _$LoginIdentifier];

  @override
  final String wireName = r'LoginIdentifier';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginIdentifier object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(LoginIdentifierType),
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
    LoginIdentifier object, {
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
    required LoginIdentifierBuilder result,
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
  LoginIdentifier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginIdentifierBuilder();
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

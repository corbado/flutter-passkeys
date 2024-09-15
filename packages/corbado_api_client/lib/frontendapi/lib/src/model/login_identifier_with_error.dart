//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_identifier_with_error.g.dart';

/// LoginIdentifierWithError
///
/// Properties:
/// * [type]
/// * [identifier]
/// * [error]
@BuiltValue()
abstract class LoginIdentifierWithError
    implements
        Built<LoginIdentifierWithError, LoginIdentifierWithErrorBuilder> {
  @BuiltValueField(wireName: r'type')
  LoginIdentifierType get type;
  // enum typeEnum {  email,  phone,  username,  };

  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  LoginIdentifierWithError._();

  factory LoginIdentifierWithError(
          [void updates(LoginIdentifierWithErrorBuilder b)]) =
      _$LoginIdentifierWithError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginIdentifierWithErrorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginIdentifierWithError> get serializer =>
      _$LoginIdentifierWithErrorSerializer();
}

class _$LoginIdentifierWithErrorSerializer
    implements PrimitiveSerializer<LoginIdentifierWithError> {
  @override
  final Iterable<Type> types = const [
    LoginIdentifierWithError,
    _$LoginIdentifierWithError
  ];

  @override
  final String wireName = r'LoginIdentifierWithError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginIdentifierWithError object, {
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
    LoginIdentifierWithError object, {
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
    required LoginIdentifierWithErrorBuilder result,
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
  LoginIdentifierWithError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginIdentifierWithErrorBuilder();
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

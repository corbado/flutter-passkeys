// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AuthType _$signup = const AuthType._('signup');
const AuthType _$login = const AuthType._('login');

AuthType _$valueOf(String name) {
  switch (name) {
    case 'signup':
      return _$signup;
    case 'login':
      return _$login;
    default:
      return _$login;
  }
}

final BuiltSet<AuthType> _$values = new BuiltSet<AuthType>(const <AuthType>[
  _$signup,
  _$login,
]);

class _$AuthTypeMeta {
  const _$AuthTypeMeta();
  AuthType get signup => _$signup;
  AuthType get login => _$login;
  AuthType valueOf(String name) => _$valueOf(name);
  BuiltSet<AuthType> get values => _$values;
}

abstract class _$AuthTypeMixin {
  // ignore: non_constant_identifier_names
  _$AuthTypeMeta get AuthType => const _$AuthTypeMeta();
}

Serializer<AuthType> _$authTypeSerializer = new _$AuthTypeSerializer();

class _$AuthTypeSerializer implements PrimitiveSerializer<AuthType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'signup': 'signup',
    'login': 'login',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'signup': 'signup',
    'login': 'login',
  };

  @override
  final Iterable<Type> types = const <Type>[AuthType];
  @override
  final String wireName = 'AuthType';

  @override
  Object serialize(Serializers serializers, AuthType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AuthType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

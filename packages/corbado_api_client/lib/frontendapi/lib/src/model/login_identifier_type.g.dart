// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_identifier_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LoginIdentifierType _$email = const LoginIdentifierType._('email');
const LoginIdentifierType _$phone = const LoginIdentifierType._('phone');
const LoginIdentifierType _$username = const LoginIdentifierType._('username');

LoginIdentifierType _$valueOf(String name) {
  switch (name) {
    case 'email':
      return _$email;
    case 'phone':
      return _$phone;
    case 'username':
      return _$username;
    default:
      return _$username;
  }
}

final BuiltSet<LoginIdentifierType> _$values =
    new BuiltSet<LoginIdentifierType>(const <LoginIdentifierType>[
  _$email,
  _$phone,
  _$username,
]);

class _$LoginIdentifierTypeMeta {
  const _$LoginIdentifierTypeMeta();
  LoginIdentifierType get email => _$email;
  LoginIdentifierType get phone => _$phone;
  LoginIdentifierType get username => _$username;
  LoginIdentifierType valueOf(String name) => _$valueOf(name);
  BuiltSet<LoginIdentifierType> get values => _$values;
}

abstract class _$LoginIdentifierTypeMixin {
  // ignore: non_constant_identifier_names
  _$LoginIdentifierTypeMeta get LoginIdentifierType =>
      const _$LoginIdentifierTypeMeta();
}

Serializer<LoginIdentifierType> _$loginIdentifierTypeSerializer =
    new _$LoginIdentifierTypeSerializer();

class _$LoginIdentifierTypeSerializer
    implements PrimitiveSerializer<LoginIdentifierType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'email': 'email',
    'phone': 'phone',
    'username': 'username',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'email': 'email',
    'phone': 'phone',
    'username': 'username',
  };

  @override
  final Iterable<Type> types = const <Type>[LoginIdentifierType];
  @override
  final String wireName = 'LoginIdentifierType';

  @override
  Object serialize(Serializers serializers, LoginIdentifierType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LoginIdentifierType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LoginIdentifierType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

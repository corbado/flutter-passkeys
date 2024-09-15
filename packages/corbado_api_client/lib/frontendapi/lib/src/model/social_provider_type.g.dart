// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_provider_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SocialProviderType _$google = const SocialProviderType._('google');
const SocialProviderType _$microsoft = const SocialProviderType._('microsoft');
const SocialProviderType _$github = const SocialProviderType._('github');

SocialProviderType _$valueOf(String name) {
  switch (name) {
    case 'google':
      return _$google;
    case 'microsoft':
      return _$microsoft;
    case 'github':
      return _$github;
    default:
      return _$github;
  }
}

final BuiltSet<SocialProviderType> _$values =
    new BuiltSet<SocialProviderType>(const <SocialProviderType>[
  _$google,
  _$microsoft,
  _$github,
]);

class _$SocialProviderTypeMeta {
  const _$SocialProviderTypeMeta();
  SocialProviderType get google => _$google;
  SocialProviderType get microsoft => _$microsoft;
  SocialProviderType get github => _$github;
  SocialProviderType valueOf(String name) => _$valueOf(name);
  BuiltSet<SocialProviderType> get values => _$values;
}

abstract class _$SocialProviderTypeMixin {
  // ignore: non_constant_identifier_names
  _$SocialProviderTypeMeta get SocialProviderType =>
      const _$SocialProviderTypeMeta();
}

Serializer<SocialProviderType> _$socialProviderTypeSerializer =
    new _$SocialProviderTypeSerializer();

class _$SocialProviderTypeSerializer
    implements PrimitiveSerializer<SocialProviderType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'google': 'google',
    'microsoft': 'microsoft',
    'github': 'github',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'google': 'google',
    'microsoft': 'microsoft',
    'github': 'github',
  };

  @override
  final Iterable<Type> types = const <Type>[SocialProviderType];
  @override
  final String wireName = 'SocialProviderType';

  @override
  Object serialize(Serializers serializers, SocialProviderType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SocialProviderType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SocialProviderType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_icon_set.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PasskeyIconSet _$default_ = const PasskeyIconSet._('default_');
const PasskeyIconSet _$apple = const PasskeyIconSet._('apple');
const PasskeyIconSet _$android = const PasskeyIconSet._('android');
const PasskeyIconSet _$windows = const PasskeyIconSet._('windows');

PasskeyIconSet _$valueOf(String name) {
  switch (name) {
    case 'default_':
      return _$default_;
    case 'apple':
      return _$apple;
    case 'android':
      return _$android;
    case 'windows':
      return _$windows;
    default:
      return _$windows;
  }
}

final BuiltSet<PasskeyIconSet> _$values =
    new BuiltSet<PasskeyIconSet>(const <PasskeyIconSet>[
  _$default_,
  _$apple,
  _$android,
  _$windows,
]);

class _$PasskeyIconSetMeta {
  const _$PasskeyIconSetMeta();
  PasskeyIconSet get default_ => _$default_;
  PasskeyIconSet get apple => _$apple;
  PasskeyIconSet get android => _$android;
  PasskeyIconSet get windows => _$windows;
  PasskeyIconSet valueOf(String name) => _$valueOf(name);
  BuiltSet<PasskeyIconSet> get values => _$values;
}

abstract class _$PasskeyIconSetMixin {
  // ignore: non_constant_identifier_names
  _$PasskeyIconSetMeta get PasskeyIconSet => const _$PasskeyIconSetMeta();
}

Serializer<PasskeyIconSet> _$passkeyIconSetSerializer =
    new _$PasskeyIconSetSerializer();

class _$PasskeyIconSetSerializer
    implements PrimitiveSerializer<PasskeyIconSet> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'default_': 'default',
    'apple': 'apple',
    'android': 'android',
    'windows': 'windows',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'default': 'default_',
    'apple': 'apple',
    'android': 'android',
    'windows': 'windows',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyIconSet];
  @override
  final String wireName = 'PasskeyIconSet';

  @override
  Object serialize(Serializers serializers, PasskeyIconSet object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyIconSet deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyIconSet.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

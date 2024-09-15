// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VerificationMethod _$emailLink = const VerificationMethod._('emailLink');
const VerificationMethod _$emailOtp = const VerificationMethod._('emailOtp');
const VerificationMethod _$phoneOtp = const VerificationMethod._('phoneOtp');

VerificationMethod _$valueOf(String name) {
  switch (name) {
    case 'emailLink':
      return _$emailLink;
    case 'emailOtp':
      return _$emailOtp;
    case 'phoneOtp':
      return _$phoneOtp;
    default:
      return _$phoneOtp;
  }
}

final BuiltSet<VerificationMethod> _$values =
    new BuiltSet<VerificationMethod>(const <VerificationMethod>[
  _$emailLink,
  _$emailOtp,
  _$phoneOtp,
]);

class _$VerificationMethodMeta {
  const _$VerificationMethodMeta();
  VerificationMethod get emailLink => _$emailLink;
  VerificationMethod get emailOtp => _$emailOtp;
  VerificationMethod get phoneOtp => _$phoneOtp;
  VerificationMethod valueOf(String name) => _$valueOf(name);
  BuiltSet<VerificationMethod> get values => _$values;
}

abstract class _$VerificationMethodMixin {
  // ignore: non_constant_identifier_names
  _$VerificationMethodMeta get VerificationMethod =>
      const _$VerificationMethodMeta();
}

Serializer<VerificationMethod> _$verificationMethodSerializer =
    new _$VerificationMethodSerializer();

class _$VerificationMethodSerializer
    implements PrimitiveSerializer<VerificationMethod> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'emailLink': 'email-link',
    'emailOtp': 'email-otp',
    'phoneOtp': 'phone-otp',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'email-link': 'emailLink',
    'email-otp': 'emailOtp',
    'phone-otp': 'phoneOtp',
  };

  @override
  final Iterable<Type> types = const <Type>[VerificationMethod];
  @override
  final String wireName = 'VerificationMethod';

  @override
  Object serialize(Serializers serializers, VerificationMethod object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  VerificationMethod deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VerificationMethod.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

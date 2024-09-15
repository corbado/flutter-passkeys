// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_event_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PasskeyEventType _$loginExplicitAbort =
    const PasskeyEventType._('loginExplicitAbort');
const PasskeyEventType _$loginError = const PasskeyEventType._('loginError');
const PasskeyEventType _$loginOneTapSwitch =
    const PasskeyEventType._('loginOneTapSwitch');
const PasskeyEventType _$userAppendAfterCrossPlatformBlacklisted =
    const PasskeyEventType._('userAppendAfterCrossPlatformBlacklisted');
const PasskeyEventType _$userAppendAfterLoginErrorBlacklisted =
    const PasskeyEventType._('userAppendAfterLoginErrorBlacklisted');
const PasskeyEventType _$appendCredentialExists =
    const PasskeyEventType._('appendCredentialExists');
const PasskeyEventType _$appendExplicitAbort =
    const PasskeyEventType._('appendExplicitAbort');
const PasskeyEventType _$appendError = const PasskeyEventType._('appendError');

PasskeyEventType _$valueOf(String name) {
  switch (name) {
    case 'loginExplicitAbort':
      return _$loginExplicitAbort;
    case 'loginError':
      return _$loginError;
    case 'loginOneTapSwitch':
      return _$loginOneTapSwitch;
    case 'userAppendAfterCrossPlatformBlacklisted':
      return _$userAppendAfterCrossPlatformBlacklisted;
    case 'userAppendAfterLoginErrorBlacklisted':
      return _$userAppendAfterLoginErrorBlacklisted;
    case 'appendCredentialExists':
      return _$appendCredentialExists;
    case 'appendExplicitAbort':
      return _$appendExplicitAbort;
    case 'appendError':
      return _$appendError;
    default:
      return _$appendError;
  }
}

final BuiltSet<PasskeyEventType> _$values =
    new BuiltSet<PasskeyEventType>(const <PasskeyEventType>[
  _$loginExplicitAbort,
  _$loginError,
  _$loginOneTapSwitch,
  _$userAppendAfterCrossPlatformBlacklisted,
  _$userAppendAfterLoginErrorBlacklisted,
  _$appendCredentialExists,
  _$appendExplicitAbort,
  _$appendError,
]);

class _$PasskeyEventTypeMeta {
  const _$PasskeyEventTypeMeta();
  PasskeyEventType get loginExplicitAbort => _$loginExplicitAbort;
  PasskeyEventType get loginError => _$loginError;
  PasskeyEventType get loginOneTapSwitch => _$loginOneTapSwitch;
  PasskeyEventType get userAppendAfterCrossPlatformBlacklisted =>
      _$userAppendAfterCrossPlatformBlacklisted;
  PasskeyEventType get userAppendAfterLoginErrorBlacklisted =>
      _$userAppendAfterLoginErrorBlacklisted;
  PasskeyEventType get appendCredentialExists => _$appendCredentialExists;
  PasskeyEventType get appendExplicitAbort => _$appendExplicitAbort;
  PasskeyEventType get appendError => _$appendError;
  PasskeyEventType valueOf(String name) => _$valueOf(name);
  BuiltSet<PasskeyEventType> get values => _$values;
}

abstract class _$PasskeyEventTypeMixin {
  // ignore: non_constant_identifier_names
  _$PasskeyEventTypeMeta get PasskeyEventType => const _$PasskeyEventTypeMeta();
}

Serializer<PasskeyEventType> _$passkeyEventTypeSerializer =
    new _$PasskeyEventTypeSerializer();

class _$PasskeyEventTypeSerializer
    implements PrimitiveSerializer<PasskeyEventType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'loginExplicitAbort': 'login-explicit-abort',
    'loginError': 'login-error',
    'loginOneTapSwitch': 'login-one-tap-switch',
    'userAppendAfterCrossPlatformBlacklisted':
        'user-append-after-cross-platform-blacklisted',
    'userAppendAfterLoginErrorBlacklisted':
        'user-append-after-login-error-blacklisted',
    'appendCredentialExists': 'append-credential-exists',
    'appendExplicitAbort': 'append-explicit-abort',
    'appendError': 'append-error',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'login-explicit-abort': 'loginExplicitAbort',
    'login-error': 'loginError',
    'login-one-tap-switch': 'loginOneTapSwitch',
    'user-append-after-cross-platform-blacklisted':
        'userAppendAfterCrossPlatformBlacklisted',
    'user-append-after-login-error-blacklisted':
        'userAppendAfterLoginErrorBlacklisted',
    'append-credential-exists': 'appendCredentialExists',
    'append-explicit-abort': 'appendExplicitAbort',
    'append-error': 'appendError',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyEventType];
  @override
  final String wireName = 'PasskeyEventType';

  @override
  Object serialize(Serializers serializers, PasskeyEventType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyEventType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyEventType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

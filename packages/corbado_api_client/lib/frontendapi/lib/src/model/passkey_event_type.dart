//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_event_type.g.dart';

class PasskeyEventType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'login-explicit-abort')
  static const PasskeyEventType loginExplicitAbort = _$loginExplicitAbort;
  @BuiltValueEnumConst(wireName: r'login-error')
  static const PasskeyEventType loginError = _$loginError;
  @BuiltValueEnumConst(wireName: r'login-error-untyped')
  static const PasskeyEventType loginErrorUntyped = _$loginErrorUntyped;
  @BuiltValueEnumConst(wireName: r'login-one-tap-switch')
  static const PasskeyEventType loginOneTapSwitch = _$loginOneTapSwitch;
  @BuiltValueEnumConst(
      wireName: r'user-append-after-cross-platform-blacklisted')
  static const PasskeyEventType userAppendAfterCrossPlatformBlacklisted =
      _$userAppendAfterCrossPlatformBlacklisted;
  @BuiltValueEnumConst(wireName: r'user-append-after-login-error-blacklisted')
  static const PasskeyEventType userAppendAfterLoginErrorBlacklisted =
      _$userAppendAfterLoginErrorBlacklisted;
  @BuiltValueEnumConst(wireName: r'append-credential-exists')
  static const PasskeyEventType appendCredentialExists =
      _$appendCredentialExists;
  @BuiltValueEnumConst(wireName: r'append-explicit-abort')
  static const PasskeyEventType appendExplicitAbort = _$appendExplicitAbort;
  @BuiltValueEnumConst(wireName: r'append-error', fallback: true)
  static const PasskeyEventType appendError = _$appendError;

  static Serializer<PasskeyEventType> get serializer =>
      _$passkeyEventTypeSerializer;

  const PasskeyEventType._(String name) : super(name);

  static BuiltSet<PasskeyEventType> get values => _$values;
  static PasskeyEventType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PasskeyEventTypeMixin = Object with _$PasskeyEventTypeMixin;

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verification_method.g.dart';

class VerificationMethod extends EnumClass {
  @BuiltValueEnumConst(wireName: r'email-link')
  static const VerificationMethod emailLink = _$emailLink;
  @BuiltValueEnumConst(wireName: r'email-otp')
  static const VerificationMethod emailOtp = _$emailOtp;
  @BuiltValueEnumConst(wireName: r'phone-otp', fallback: true)
  static const VerificationMethod phoneOtp = _$phoneOtp;

  static Serializer<VerificationMethod> get serializer =>
      _$verificationMethodSerializer;

  const VerificationMethod._(String name) : super(name);

  static BuiltSet<VerificationMethod> get values => _$values;
  static VerificationMethod valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class VerificationMethodMixin = Object with _$VerificationMethodMixin;

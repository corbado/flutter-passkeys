//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_identifier_type.g.dart';

class LoginIdentifierType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'email')
  static const LoginIdentifierType email = _$email;
  @BuiltValueEnumConst(wireName: r'phone')
  static const LoginIdentifierType phone = _$phone;
  @BuiltValueEnumConst(wireName: r'username', fallback: true)
  static const LoginIdentifierType username = _$username;

  static Serializer<LoginIdentifierType> get serializer =>
      _$loginIdentifierTypeSerializer;

  const LoginIdentifierType._(String name) : super(name);

  static BuiltSet<LoginIdentifierType> get values => _$values;
  static LoginIdentifierType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class LoginIdentifierTypeMixin = Object
    with _$LoginIdentifierTypeMixin;

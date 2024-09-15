//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_type.g.dart';

class AuthType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'signup')
  static const AuthType signup = _$signup;
  @BuiltValueEnumConst(wireName: r'login', fallback: true)
  static const AuthType login = _$login;

  static Serializer<AuthType> get serializer => _$authTypeSerializer;

  const AuthType._(String name) : super(name);

  static BuiltSet<AuthType> get values => _$values;
  static AuthType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AuthTypeMixin = Object with _$AuthTypeMixin;

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_provider_type.g.dart';

class SocialProviderType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'google')
  static const SocialProviderType google = _$google;
  @BuiltValueEnumConst(wireName: r'microsoft')
  static const SocialProviderType microsoft = _$microsoft;
  @BuiltValueEnumConst(wireName: r'github', fallback: true)
  static const SocialProviderType github = _$github;

  static Serializer<SocialProviderType> get serializer =>
      _$socialProviderTypeSerializer;

  const SocialProviderType._(String name) : super(name);

  static BuiltSet<SocialProviderType> get values => _$values;
  static SocialProviderType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SocialProviderTypeMixin = Object with _$SocialProviderTypeMixin;

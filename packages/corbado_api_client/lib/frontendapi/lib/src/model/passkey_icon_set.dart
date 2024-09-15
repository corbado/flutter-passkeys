//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_icon_set.g.dart';

class PasskeyIconSet extends EnumClass {
  @BuiltValueEnumConst(wireName: r'default')
  static const PasskeyIconSet default_ = _$default_;
  @BuiltValueEnumConst(wireName: r'apple')
  static const PasskeyIconSet apple = _$apple;
  @BuiltValueEnumConst(wireName: r'android')
  static const PasskeyIconSet android = _$android;
  @BuiltValueEnumConst(wireName: r'windows', fallback: true)
  static const PasskeyIconSet windows = _$windows;

  static Serializer<PasskeyIconSet> get serializer =>
      _$passkeyIconSetSerializer;

  const PasskeyIconSet._(String name) : super(name);

  static BuiltSet<PasskeyIconSet> get values => _$values;
  static PasskeyIconSet valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PasskeyIconSetMixin = Object with _$PasskeyIconSetMixin;

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'java_script_high_entropy.g.dart';

/// JavaScriptHighEntropy
///
/// Properties:
/// * [platform]
/// * [platformVersion]
/// * [mobile]
@BuiltValue()
abstract class JavaScriptHighEntropy
    implements Built<JavaScriptHighEntropy, JavaScriptHighEntropyBuilder> {
  @BuiltValueField(wireName: r'platform')
  String get platform;

  @BuiltValueField(wireName: r'platformVersion')
  String get platformVersion;

  @BuiltValueField(wireName: r'mobile')
  bool get mobile;

  JavaScriptHighEntropy._();

  factory JavaScriptHighEntropy(
      [void updates(JavaScriptHighEntropyBuilder b)]) = _$JavaScriptHighEntropy;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JavaScriptHighEntropyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JavaScriptHighEntropy> get serializer =>
      _$JavaScriptHighEntropySerializer();
}

class _$JavaScriptHighEntropySerializer
    implements PrimitiveSerializer<JavaScriptHighEntropy> {
  @override
  final Iterable<Type> types = const [
    JavaScriptHighEntropy,
    _$JavaScriptHighEntropy
  ];

  @override
  final String wireName = r'JavaScriptHighEntropy';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JavaScriptHighEntropy object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(String),
    );
    yield r'platformVersion';
    yield serializers.serialize(
      object.platformVersion,
      specifiedType: const FullType(String),
    );
    yield r'mobile';
    yield serializers.serialize(
      object.mobile,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JavaScriptHighEntropy object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JavaScriptHighEntropyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platform = valueDes;
          break;
        case r'platformVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platformVersion = valueDes;
          break;
        case r'mobile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.mobile = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JavaScriptHighEntropy deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JavaScriptHighEntropyBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

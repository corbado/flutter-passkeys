//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_common.g.dart';

/// ProcessCommon
///
/// Properties:
/// * [appName]
/// * [frontendApiUrl]
/// * [hideBadge]
@BuiltValue()
abstract class ProcessCommon
    implements Built<ProcessCommon, ProcessCommonBuilder> {
  @BuiltValueField(wireName: r'appName')
  String get appName;

  @BuiltValueField(wireName: r'frontendApiUrl')
  String get frontendApiUrl;

  @BuiltValueField(wireName: r'hideBadge')
  bool get hideBadge;

  ProcessCommon._();

  factory ProcessCommon([void updates(ProcessCommonBuilder b)]) =
      _$ProcessCommon;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessCommonBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessCommon> get serializer =>
      _$ProcessCommonSerializer();
}

class _$ProcessCommonSerializer implements PrimitiveSerializer<ProcessCommon> {
  @override
  final Iterable<Type> types = const [ProcessCommon, _$ProcessCommon];

  @override
  final String wireName = r'ProcessCommon';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessCommon object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'appName';
    yield serializers.serialize(
      object.appName,
      specifiedType: const FullType(String),
    );
    yield r'frontendApiUrl';
    yield serializers.serialize(
      object.frontendApiUrl,
      specifiedType: const FullType(String),
    );
    yield r'hideBadge';
    yield serializers.serialize(
      object.hideBadge,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessCommon object, {
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
    required ProcessCommonBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appName = valueDes;
          break;
        case r'frontendApiUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frontendApiUrl = valueDes;
          break;
        case r'hideBadge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hideBadge = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessCommon deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessCommonBuilder();
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

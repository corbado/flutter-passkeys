//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_static_info.g.dart';

/// ProcessStaticInfo
///
/// Properties:
/// * [token]
/// * [expiresAt]
@BuiltValue()
abstract class ProcessStaticInfo
    implements Built<ProcessStaticInfo, ProcessStaticInfoBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  ProcessStaticInfo._();

  factory ProcessStaticInfo([void updates(ProcessStaticInfoBuilder b)]) =
      _$ProcessStaticInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessStaticInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessStaticInfo> get serializer =>
      _$ProcessStaticInfoSerializer();
}

class _$ProcessStaticInfoSerializer
    implements PrimitiveSerializer<ProcessStaticInfo> {
  @override
  final Iterable<Type> types = const [ProcessStaticInfo, _$ProcessStaticInfo];

  @override
  final String wireName = r'ProcessStaticInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessStaticInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'expiresAt';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessStaticInfo object, {
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
    required ProcessStaticInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessStaticInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessStaticInfoBuilder();
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

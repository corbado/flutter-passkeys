//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_passkey_appended.g.dart';

/// GeneralBlockPasskeyAppended
///
/// Properties:
/// * [blockType]
@BuiltValue()
abstract class GeneralBlockPasskeyAppended
    implements
        Built<GeneralBlockPasskeyAppended, GeneralBlockPasskeyAppendedBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  GeneralBlockPasskeyAppended._();

  factory GeneralBlockPasskeyAppended(
          [void updates(GeneralBlockPasskeyAppendedBuilder b)]) =
      _$GeneralBlockPasskeyAppended;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockPasskeyAppendedBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockPasskeyAppended> get serializer =>
      _$GeneralBlockPasskeyAppendedSerializer();
}

class _$GeneralBlockPasskeyAppendedSerializer
    implements PrimitiveSerializer<GeneralBlockPasskeyAppended> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockPasskeyAppended,
    _$GeneralBlockPasskeyAppended
  ];

  @override
  final String wireName = r'GeneralBlockPasskeyAppended';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockPasskeyAppended object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockPasskeyAppended object, {
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
    required GeneralBlockPasskeyAppendedBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'blockType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.blockType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockPasskeyAppended deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockPasskeyAppendedBuilder();
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

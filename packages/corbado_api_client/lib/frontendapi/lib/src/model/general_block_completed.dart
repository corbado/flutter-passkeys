//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_block_completed.g.dart';

/// GeneralBlockCompleted
///
/// Properties:
/// * [blockType]
/// * [shortSession]
/// * [longSession] - Only given when project environment is dev 1
/// * [passkeyOperation]
@BuiltValue()
abstract class GeneralBlockCompleted
    implements Built<GeneralBlockCompleted, GeneralBlockCompletedBuilder> {
  @BuiltValueField(wireName: r'blockType')
  String get blockType;

  @BuiltValueField(wireName: r'shortSession')
  String get shortSession;

  /// Only given when project environment is dev 1
  @BuiltValueField(wireName: r'longSession')
  String? get longSession;

  @BuiltValueField(wireName: r'passkeyOperation')
  PasskeyOperation? get passkeyOperation;

  GeneralBlockCompleted._();

  factory GeneralBlockCompleted(
      [void updates(GeneralBlockCompletedBuilder b)]) = _$GeneralBlockCompleted;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralBlockCompletedBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralBlockCompleted> get serializer =>
      _$GeneralBlockCompletedSerializer();
}

class _$GeneralBlockCompletedSerializer
    implements PrimitiveSerializer<GeneralBlockCompleted> {
  @override
  final Iterable<Type> types = const [
    GeneralBlockCompleted,
    _$GeneralBlockCompleted
  ];

  @override
  final String wireName = r'GeneralBlockCompleted';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralBlockCompleted object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'blockType';
    yield serializers.serialize(
      object.blockType,
      specifiedType: const FullType(String),
    );
    yield r'shortSession';
    yield serializers.serialize(
      object.shortSession,
      specifiedType: const FullType(String),
    );
    if (object.longSession != null) {
      yield r'longSession';
      yield serializers.serialize(
        object.longSession,
        specifiedType: const FullType(String),
      );
    }
    if (object.passkeyOperation != null) {
      yield r'passkeyOperation';
      yield serializers.serialize(
        object.passkeyOperation,
        specifiedType: const FullType(PasskeyOperation),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralBlockCompleted object, {
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
    required GeneralBlockCompletedBuilder result,
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
        case r'shortSession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shortSession = valueDes;
          break;
        case r'longSession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.longSession = valueDes;
          break;
        case r'passkeyOperation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyOperation),
          ) as PasskeyOperation;
          result.passkeyOperation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralBlockCompleted deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralBlockCompletedBuilder();
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

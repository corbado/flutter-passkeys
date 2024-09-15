//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_append_finish_req.g.dart';

/// tbd.
///
/// Properties:
/// * [signedChallenge]
@BuiltValue()
abstract class PasskeyAppendFinishReq
    implements Built<PasskeyAppendFinishReq, PasskeyAppendFinishReqBuilder> {
  @BuiltValueField(wireName: r'signedChallenge')
  String get signedChallenge;

  PasskeyAppendFinishReq._();

  factory PasskeyAppendFinishReq(
          [void updates(PasskeyAppendFinishReqBuilder b)]) =
      _$PasskeyAppendFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyAppendFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyAppendFinishReq> get serializer =>
      _$PasskeyAppendFinishReqSerializer();
}

class _$PasskeyAppendFinishReqSerializer
    implements PrimitiveSerializer<PasskeyAppendFinishReq> {
  @override
  final Iterable<Type> types = const [
    PasskeyAppendFinishReq,
    _$PasskeyAppendFinishReq
  ];

  @override
  final String wireName = r'PasskeyAppendFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyAppendFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'signedChallenge';
    yield serializers.serialize(
      object.signedChallenge,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasskeyAppendFinishReq object, {
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
    required PasskeyAppendFinishReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'signedChallenge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.signedChallenge = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasskeyAppendFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyAppendFinishReqBuilder();
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

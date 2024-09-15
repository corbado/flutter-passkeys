//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_login_finish_req.g.dart';

/// tbd.
///
/// Properties:
/// * [signedChallenge]
@BuiltValue()
abstract class PasskeyLoginFinishReq
    implements Built<PasskeyLoginFinishReq, PasskeyLoginFinishReqBuilder> {
  @BuiltValueField(wireName: r'signedChallenge')
  String get signedChallenge;

  PasskeyLoginFinishReq._();

  factory PasskeyLoginFinishReq(
      [void updates(PasskeyLoginFinishReqBuilder b)]) = _$PasskeyLoginFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyLoginFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyLoginFinishReq> get serializer =>
      _$PasskeyLoginFinishReqSerializer();
}

class _$PasskeyLoginFinishReqSerializer
    implements PrimitiveSerializer<PasskeyLoginFinishReq> {
  @override
  final Iterable<Type> types = const [
    PasskeyLoginFinishReq,
    _$PasskeyLoginFinishReq
  ];

  @override
  final String wireName = r'PasskeyLoginFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyLoginFinishReq object, {
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
    PasskeyLoginFinishReq object, {
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
    required PasskeyLoginFinishReqBuilder result,
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
  PasskeyLoginFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyLoginFinishReqBuilder();
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

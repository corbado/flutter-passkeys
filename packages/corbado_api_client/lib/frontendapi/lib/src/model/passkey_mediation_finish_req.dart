//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey_mediation_finish_req.g.dart';

/// tbd.
///
/// Properties:
/// * [signedChallenge]
@BuiltValue()
abstract class PasskeyMediationFinishReq
    implements
        Built<PasskeyMediationFinishReq, PasskeyMediationFinishReqBuilder> {
  @BuiltValueField(wireName: r'signedChallenge')
  String get signedChallenge;

  PasskeyMediationFinishReq._();

  factory PasskeyMediationFinishReq(
          [void updates(PasskeyMediationFinishReqBuilder b)]) =
      _$PasskeyMediationFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyMediationFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasskeyMediationFinishReq> get serializer =>
      _$PasskeyMediationFinishReqSerializer();
}

class _$PasskeyMediationFinishReqSerializer
    implements PrimitiveSerializer<PasskeyMediationFinishReq> {
  @override
  final Iterable<Type> types = const [
    PasskeyMediationFinishReq,
    _$PasskeyMediationFinishReq
  ];

  @override
  final String wireName = r'PasskeyMediationFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasskeyMediationFinishReq object, {
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
    PasskeyMediationFinishReq object, {
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
    required PasskeyMediationFinishReqBuilder result,
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
  PasskeyMediationFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyMediationFinishReqBuilder();
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

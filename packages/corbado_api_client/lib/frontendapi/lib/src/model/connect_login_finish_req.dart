//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_finish_req.g.dart';

/// ConnectLoginFinishReq
///
/// Properties:
/// * [isConditionalUI]
/// * [assertionResponse]
@BuiltValue()
abstract class ConnectLoginFinishReq
    implements Built<ConnectLoginFinishReq, ConnectLoginFinishReqBuilder> {
  @BuiltValueField(wireName: r'isConditionalUI')
  bool get isConditionalUI;

  @BuiltValueField(wireName: r'assertionResponse')
  String get assertionResponse;

  ConnectLoginFinishReq._();

  factory ConnectLoginFinishReq(
      [void updates(ConnectLoginFinishReqBuilder b)]) = _$ConnectLoginFinishReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginFinishReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginFinishReq> get serializer =>
      _$ConnectLoginFinishReqSerializer();
}

class _$ConnectLoginFinishReqSerializer
    implements PrimitiveSerializer<ConnectLoginFinishReq> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginFinishReq,
    _$ConnectLoginFinishReq
  ];

  @override
  final String wireName = r'ConnectLoginFinishReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginFinishReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'isConditionalUI';
    yield serializers.serialize(
      object.isConditionalUI,
      specifiedType: const FullType(bool),
    );
    yield r'assertionResponse';
    yield serializers.serialize(
      object.assertionResponse,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectLoginFinishReq object, {
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
    required ConnectLoginFinishReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isConditionalUI':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isConditionalUI = valueDes;
          break;
        case r'assertionResponse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assertionResponse = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectLoginFinishReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginFinishReqBuilder();
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

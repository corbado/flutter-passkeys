//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_append_start_req.g.dart';

/// ConnectAppendStartReq
///
/// Properties:
/// * [appendTokenValue]
/// * [loadedMs]
/// * [forcePasskeyAppend]
@BuiltValue()
abstract class ConnectAppendStartReq
    implements Built<ConnectAppendStartReq, ConnectAppendStartReqBuilder> {
  @BuiltValueField(wireName: r'appendTokenValue')
  String get appendTokenValue;

  @BuiltValueField(wireName: r'loadedMs')
  int get loadedMs;

  @BuiltValueField(wireName: r'forcePasskeyAppend')
  bool? get forcePasskeyAppend;

  ConnectAppendStartReq._();

  factory ConnectAppendStartReq(
      [void updates(ConnectAppendStartReqBuilder b)]) = _$ConnectAppendStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectAppendStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectAppendStartReq> get serializer =>
      _$ConnectAppendStartReqSerializer();
}

class _$ConnectAppendStartReqSerializer
    implements PrimitiveSerializer<ConnectAppendStartReq> {
  @override
  final Iterable<Type> types = const [
    ConnectAppendStartReq,
    _$ConnectAppendStartReq
  ];

  @override
  final String wireName = r'ConnectAppendStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectAppendStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'appendTokenValue';
    yield serializers.serialize(
      object.appendTokenValue,
      specifiedType: const FullType(String),
    );
    yield r'loadedMs';
    yield serializers.serialize(
      object.loadedMs,
      specifiedType: const FullType(int),
    );
    if (object.forcePasskeyAppend != null) {
      yield r'forcePasskeyAppend';
      yield serializers.serialize(
        object.forcePasskeyAppend,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectAppendStartReq object, {
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
    required ConnectAppendStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appendTokenValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appendTokenValue = valueDes;
          break;
        case r'loadedMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.loadedMs = valueDes;
          break;
        case r'forcePasskeyAppend':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.forcePasskeyAppend = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectAppendStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectAppendStartReqBuilder();
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

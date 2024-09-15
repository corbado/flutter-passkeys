//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_start_rsp.g.dart';

/// ConnectLoginStartRsp
///
/// Properties:
/// * [assertionOptions]
/// * [isCDA]
@BuiltValue()
abstract class ConnectLoginStartRsp
    implements Built<ConnectLoginStartRsp, ConnectLoginStartRspBuilder> {
  @BuiltValueField(wireName: r'assertionOptions')
  String get assertionOptions;

  @BuiltValueField(wireName: r'isCDA')
  bool get isCDA;

  ConnectLoginStartRsp._();

  factory ConnectLoginStartRsp([void updates(ConnectLoginStartRspBuilder b)]) =
      _$ConnectLoginStartRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginStartRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginStartRsp> get serializer =>
      _$ConnectLoginStartRspSerializer();
}

class _$ConnectLoginStartRspSerializer
    implements PrimitiveSerializer<ConnectLoginStartRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginStartRsp,
    _$ConnectLoginStartRsp
  ];

  @override
  final String wireName = r'ConnectLoginStartRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginStartRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'assertionOptions';
    yield serializers.serialize(
      object.assertionOptions,
      specifiedType: const FullType(String),
    );
    yield r'isCDA';
    yield serializers.serialize(
      object.isCDA,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectLoginStartRsp object, {
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
    required ConnectLoginStartRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'assertionOptions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assertionOptions = valueDes;
          break;
        case r'isCDA':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isCDA = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectLoginStartRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginStartRspBuilder();
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

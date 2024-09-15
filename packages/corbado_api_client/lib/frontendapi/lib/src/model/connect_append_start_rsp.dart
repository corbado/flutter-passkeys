//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_append_start_rsp.g.dart';

/// ConnectAppendStartRsp
///
/// Properties:
/// * [attestationOptions]
/// * [variant]
@BuiltValue()
abstract class ConnectAppendStartRsp
    implements Built<ConnectAppendStartRsp, ConnectAppendStartRspBuilder> {
  @BuiltValueField(wireName: r'attestationOptions')
  String get attestationOptions;

  @BuiltValueField(wireName: r'variant')
  ConnectAppendStartRspVariantEnum get variant;
  // enum variantEnum {  default,  after-hybrid,  after-error,  };

  ConnectAppendStartRsp._();

  factory ConnectAppendStartRsp(
      [void updates(ConnectAppendStartRspBuilder b)]) = _$ConnectAppendStartRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectAppendStartRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectAppendStartRsp> get serializer =>
      _$ConnectAppendStartRspSerializer();
}

class _$ConnectAppendStartRspSerializer
    implements PrimitiveSerializer<ConnectAppendStartRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectAppendStartRsp,
    _$ConnectAppendStartRsp
  ];

  @override
  final String wireName = r'ConnectAppendStartRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectAppendStartRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attestationOptions';
    yield serializers.serialize(
      object.attestationOptions,
      specifiedType: const FullType(String),
    );
    yield r'variant';
    yield serializers.serialize(
      object.variant,
      specifiedType: const FullType(ConnectAppendStartRspVariantEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectAppendStartRsp object, {
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
    required ConnectAppendStartRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attestationOptions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attestationOptions = valueDes;
          break;
        case r'variant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConnectAppendStartRspVariantEnum),
          ) as ConnectAppendStartRspVariantEnum;
          result.variant = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectAppendStartRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectAppendStartRspBuilder();
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

class ConnectAppendStartRspVariantEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'default')
  static const ConnectAppendStartRspVariantEnum default_ =
      _$connectAppendStartRspVariantEnum_default_;
  @BuiltValueEnumConst(wireName: r'after-hybrid')
  static const ConnectAppendStartRspVariantEnum afterHybrid =
      _$connectAppendStartRspVariantEnum_afterHybrid;
  @BuiltValueEnumConst(wireName: r'after-error', fallback: true)
  static const ConnectAppendStartRspVariantEnum afterError =
      _$connectAppendStartRspVariantEnum_afterError;

  static Serializer<ConnectAppendStartRspVariantEnum> get serializer =>
      _$connectAppendStartRspVariantEnumSerializer;

  const ConnectAppendStartRspVariantEnum._(String name) : super(name);

  static BuiltSet<ConnectAppendStartRspVariantEnum> get values =>
      _$connectAppendStartRspVariantEnumValues;
  static ConnectAppendStartRspVariantEnum valueOf(String name) =>
      _$connectAppendStartRspVariantEnumValueOf(name);
}

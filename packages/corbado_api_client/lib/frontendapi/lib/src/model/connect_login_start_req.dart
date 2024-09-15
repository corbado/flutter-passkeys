//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_start_req.g.dart';

/// ConnectLoginStartReq
///
/// Properties:
/// * [identifier]
/// * [source_]
/// * [loadedMs]
@BuiltValue()
abstract class ConnectLoginStartReq
    implements Built<ConnectLoginStartReq, ConnectLoginStartReqBuilder> {
  @BuiltValueField(wireName: r'identifier')
  String get identifier;

  @BuiltValueField(wireName: r'source')
  ConnectLoginStartReqSource_Enum get source_;
  // enum source_Enum {  one-tap,  text-field,  error-soft,  error-hard,  };

  @BuiltValueField(wireName: r'loadedMs')
  int get loadedMs;

  ConnectLoginStartReq._();

  factory ConnectLoginStartReq([void updates(ConnectLoginStartReqBuilder b)]) =
      _$ConnectLoginStartReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginStartReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginStartReq> get serializer =>
      _$ConnectLoginStartReqSerializer();
}

class _$ConnectLoginStartReqSerializer
    implements PrimitiveSerializer<ConnectLoginStartReq> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginStartReq,
    _$ConnectLoginStartReq
  ];

  @override
  final String wireName = r'ConnectLoginStartReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginStartReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifier';
    yield serializers.serialize(
      object.identifier,
      specifiedType: const FullType(String),
    );
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(ConnectLoginStartReqSource_Enum),
    );
    yield r'loadedMs';
    yield serializers.serialize(
      object.loadedMs,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectLoginStartReq object, {
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
    required ConnectLoginStartReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifier = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConnectLoginStartReqSource_Enum),
          ) as ConnectLoginStartReqSource_Enum;
          result.source_ = valueDes;
          break;
        case r'loadedMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.loadedMs = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectLoginStartReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginStartReqBuilder();
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

class ConnectLoginStartReqSource_Enum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'one-tap')
  static const ConnectLoginStartReqSource_Enum oneTap =
      _$connectLoginStartReqSourceEnum_oneTap;
  @BuiltValueEnumConst(wireName: r'text-field')
  static const ConnectLoginStartReqSource_Enum textField =
      _$connectLoginStartReqSourceEnum_textField;
  @BuiltValueEnumConst(wireName: r'error-soft')
  static const ConnectLoginStartReqSource_Enum errorSoft =
      _$connectLoginStartReqSourceEnum_errorSoft;
  @BuiltValueEnumConst(wireName: r'error-hard', fallback: true)
  static const ConnectLoginStartReqSource_Enum errorHard =
      _$connectLoginStartReqSourceEnum_errorHard;

  static Serializer<ConnectLoginStartReqSource_Enum> get serializer =>
      _$connectLoginStartReqSourceEnumSerializer;

  const ConnectLoginStartReqSource_Enum._(String name) : super(name);

  static BuiltSet<ConnectLoginStartReqSource_Enum> get values =>
      _$connectLoginStartReqSourceEnumValues;
  static ConnectLoginStartReqSource_Enum valueOf(String name) =>
      _$connectLoginStartReqSourceEnumValueOf(name);
}

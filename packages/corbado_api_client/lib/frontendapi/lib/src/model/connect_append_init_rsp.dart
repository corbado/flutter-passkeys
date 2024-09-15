//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_append_init_rsp.g.dart';

/// ConnectAppendInitRsp
///
/// Properties:
/// * [processID]
/// * [expiresAt]
/// * [frontendApiUrl]
/// * [appendAllowed]
/// * [flags]
/// * [newClientEnvHandle]
@BuiltValue()
abstract class ConnectAppendInitRsp
    implements Built<ConnectAppendInitRsp, ConnectAppendInitRspBuilder> {
  @BuiltValueField(wireName: r'processID')
  String get processID;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  @BuiltValueField(wireName: r'frontendApiUrl')
  String get frontendApiUrl;

  @BuiltValueField(wireName: r'appendAllowed')
  bool get appendAllowed;

  @BuiltValueField(wireName: r'flags')
  BuiltMap<String, String> get flags;

  @BuiltValueField(wireName: r'newClientEnvHandle')
  String? get newClientEnvHandle;

  ConnectAppendInitRsp._();

  factory ConnectAppendInitRsp([void updates(ConnectAppendInitRspBuilder b)]) =
      _$ConnectAppendInitRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectAppendInitRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectAppendInitRsp> get serializer =>
      _$ConnectAppendInitRspSerializer();
}

class _$ConnectAppendInitRspSerializer
    implements PrimitiveSerializer<ConnectAppendInitRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectAppendInitRsp,
    _$ConnectAppendInitRsp
  ];

  @override
  final String wireName = r'ConnectAppendInitRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectAppendInitRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'processID';
    yield serializers.serialize(
      object.processID,
      specifiedType: const FullType(String),
    );
    yield r'expiresAt';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(int),
    );
    yield r'frontendApiUrl';
    yield serializers.serialize(
      object.frontendApiUrl,
      specifiedType: const FullType(String),
    );
    yield r'appendAllowed';
    yield serializers.serialize(
      object.appendAllowed,
      specifiedType: const FullType(bool),
    );
    yield r'flags';
    yield serializers.serialize(
      object.flags,
      specifiedType:
          const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
    if (object.newClientEnvHandle != null) {
      yield r'newClientEnvHandle';
      yield serializers.serialize(
        object.newClientEnvHandle,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectAppendInitRsp object, {
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
    required ConnectAppendInitRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'processID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.processID = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresAt = valueDes;
          break;
        case r'frontendApiUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frontendApiUrl = valueDes;
          break;
        case r'appendAllowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.appendAllowed = valueDes;
          break;
        case r'flags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.flags.replace(valueDes);
          break;
        case r'newClientEnvHandle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newClientEnvHandle = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectAppendInitRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectAppendInitRspBuilder();
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

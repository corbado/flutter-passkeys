//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_manage_init_rsp.g.dart';

/// ConnectManageInitRsp
///
/// Properties:
/// * [processID]
/// * [expiresAt]
/// * [frontendApiUrl]
/// * [manageAllowed]
/// * [flags]
/// * [newClientEnvHandle]
@BuiltValue()
abstract class ConnectManageInitRsp
    implements Built<ConnectManageInitRsp, ConnectManageInitRspBuilder> {
  @BuiltValueField(wireName: r'processID')
  String get processID;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  @BuiltValueField(wireName: r'frontendApiUrl')
  String get frontendApiUrl;

  @BuiltValueField(wireName: r'manageAllowed')
  bool get manageAllowed;

  @BuiltValueField(wireName: r'flags')
  BuiltMap<String, String> get flags;

  @BuiltValueField(wireName: r'newClientEnvHandle')
  String? get newClientEnvHandle;

  ConnectManageInitRsp._();

  factory ConnectManageInitRsp([void updates(ConnectManageInitRspBuilder b)]) =
      _$ConnectManageInitRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectManageInitRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectManageInitRsp> get serializer =>
      _$ConnectManageInitRspSerializer();
}

class _$ConnectManageInitRspSerializer
    implements PrimitiveSerializer<ConnectManageInitRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectManageInitRsp,
    _$ConnectManageInitRsp
  ];

  @override
  final String wireName = r'ConnectManageInitRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectManageInitRsp object, {
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
    yield r'manageAllowed';
    yield serializers.serialize(
      object.manageAllowed,
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
    ConnectManageInitRsp object, {
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
    required ConnectManageInitRspBuilder result,
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
        case r'manageAllowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.manageAllowed = valueDes;
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
  ConnectManageInitRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectManageInitRspBuilder();
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

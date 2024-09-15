//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_login_init_rsp.g.dart';

/// ConnectLoginInitRsp
///
/// Properties:
/// * [token]
/// * [expiresAt]
/// * [frontendApiUrl]
/// * [loginAllowed]
/// * [flags]
/// * [newClientEnvHandle]
/// * [conditionalUIChallenge]
@BuiltValue()
abstract class ConnectLoginInitRsp
    implements Built<ConnectLoginInitRsp, ConnectLoginInitRspBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  @BuiltValueField(wireName: r'frontendApiUrl')
  String get frontendApiUrl;

  @BuiltValueField(wireName: r'loginAllowed')
  bool get loginAllowed;

  @BuiltValueField(wireName: r'flags')
  BuiltMap<String, String> get flags;

  @BuiltValueField(wireName: r'newClientEnvHandle')
  String? get newClientEnvHandle;

  @BuiltValueField(wireName: r'conditionalUIChallenge')
  String? get conditionalUIChallenge;

  ConnectLoginInitRsp._();

  factory ConnectLoginInitRsp([void updates(ConnectLoginInitRspBuilder b)]) =
      _$ConnectLoginInitRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectLoginInitRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectLoginInitRsp> get serializer =>
      _$ConnectLoginInitRspSerializer();
}

class _$ConnectLoginInitRspSerializer
    implements PrimitiveSerializer<ConnectLoginInitRsp> {
  @override
  final Iterable<Type> types = const [
    ConnectLoginInitRsp,
    _$ConnectLoginInitRsp
  ];

  @override
  final String wireName = r'ConnectLoginInitRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectLoginInitRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
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
    yield r'loginAllowed';
    yield serializers.serialize(
      object.loginAllowed,
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
    if (object.conditionalUIChallenge != null) {
      yield r'conditionalUIChallenge';
      yield serializers.serialize(
        object.conditionalUIChallenge,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectLoginInitRsp object, {
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
    required ConnectLoginInitRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
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
        case r'loginAllowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.loginAllowed = valueDes;
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
        case r'conditionalUIChallenge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conditionalUIChallenge = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectLoginInitRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectLoginInitRspBuilder();
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

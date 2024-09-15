//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_capabilities.g.dart';

/// ClientCapabilities
///
/// Properties:
/// * [conditionalCreate]
/// * [conditionalMediation]
/// * [hybridTransport]
/// * [passkeyPlatformAuthenticator]
/// * [userVerifyingPlatformAuthenticator]
@BuiltValue()
abstract class ClientCapabilities
    implements Built<ClientCapabilities, ClientCapabilitiesBuilder> {
  @BuiltValueField(wireName: r'conditionalCreate')
  bool? get conditionalCreate;

  @BuiltValueField(wireName: r'conditionalMediation')
  bool? get conditionalMediation;

  @BuiltValueField(wireName: r'hybridTransport')
  bool? get hybridTransport;

  @BuiltValueField(wireName: r'passkeyPlatformAuthenticator')
  bool? get passkeyPlatformAuthenticator;

  @BuiltValueField(wireName: r'userVerifyingPlatformAuthenticator')
  bool? get userVerifyingPlatformAuthenticator;

  ClientCapabilities._();

  factory ClientCapabilities([void updates(ClientCapabilitiesBuilder b)]) =
      _$ClientCapabilities;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientCapabilitiesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientCapabilities> get serializer =>
      _$ClientCapabilitiesSerializer();
}

class _$ClientCapabilitiesSerializer
    implements PrimitiveSerializer<ClientCapabilities> {
  @override
  final Iterable<Type> types = const [ClientCapabilities, _$ClientCapabilities];

  @override
  final String wireName = r'ClientCapabilities';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientCapabilities object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.conditionalCreate != null) {
      yield r'conditionalCreate';
      yield serializers.serialize(
        object.conditionalCreate,
        specifiedType: const FullType(bool),
      );
    }
    if (object.conditionalMediation != null) {
      yield r'conditionalMediation';
      yield serializers.serialize(
        object.conditionalMediation,
        specifiedType: const FullType(bool),
      );
    }
    if (object.hybridTransport != null) {
      yield r'hybridTransport';
      yield serializers.serialize(
        object.hybridTransport,
        specifiedType: const FullType(bool),
      );
    }
    if (object.passkeyPlatformAuthenticator != null) {
      yield r'passkeyPlatformAuthenticator';
      yield serializers.serialize(
        object.passkeyPlatformAuthenticator,
        specifiedType: const FullType(bool),
      );
    }
    if (object.userVerifyingPlatformAuthenticator != null) {
      yield r'userVerifyingPlatformAuthenticator';
      yield serializers.serialize(
        object.userVerifyingPlatformAuthenticator,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientCapabilities object, {
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
    required ClientCapabilitiesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'conditionalCreate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.conditionalCreate = valueDes;
          break;
        case r'conditionalMediation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.conditionalMediation = valueDes;
          break;
        case r'hybridTransport':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hybridTransport = valueDes;
          break;
        case r'passkeyPlatformAuthenticator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.passkeyPlatformAuthenticator = valueDes;
          break;
        case r'userVerifyingPlatformAuthenticator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.userVerifyingPlatformAuthenticator = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientCapabilities deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientCapabilitiesBuilder();
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

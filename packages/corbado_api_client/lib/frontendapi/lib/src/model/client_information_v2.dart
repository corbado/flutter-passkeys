//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_capabilities.dart';
import 'package:corbado_frontend_api_client/src/model/java_script_high_entropy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_information_v2.g.dart';

/// ClientInformationV2
///
/// Properties:
/// * [bluetoothAvailable]
/// * [clientEnvHandle]
/// * [visitorId]
/// * [isUserVerifyingPlatformAuthenticatorAvailable]
/// * [isConditionalMediationAvailable]
/// * [clientCapabilities]
/// * [javaScriptHighEntropy]
@BuiltValue()
abstract class ClientInformationV2
    implements Built<ClientInformationV2, ClientInformationV2Builder> {
  @BuiltValueField(wireName: r'bluetoothAvailable')
  bool? get bluetoothAvailable;

  @BuiltValueField(wireName: r'clientEnvHandle')
  String? get clientEnvHandle;

  @BuiltValueField(wireName: r'visitorId')
  String? get visitorId;

  @BuiltValueField(wireName: r'isUserVerifyingPlatformAuthenticatorAvailable')
  bool? get isUserVerifyingPlatformAuthenticatorAvailable;

  @BuiltValueField(wireName: r'isConditionalMediationAvailable')
  bool? get isConditionalMediationAvailable;

  @BuiltValueField(wireName: r'clientCapabilities')
  ClientCapabilities? get clientCapabilities;

  @BuiltValueField(wireName: r'javaScriptHighEntropy')
  JavaScriptHighEntropy? get javaScriptHighEntropy;

  ClientInformationV2._();

  factory ClientInformationV2([void updates(ClientInformationV2Builder b)]) =
      _$ClientInformationV2;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientInformationV2Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientInformationV2> get serializer =>
      _$ClientInformationV2Serializer();
}

class _$ClientInformationV2Serializer
    implements PrimitiveSerializer<ClientInformationV2> {
  @override
  final Iterable<Type> types = const [
    ClientInformationV2,
    _$ClientInformationV2
  ];

  @override
  final String wireName = r'ClientInformationV2';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientInformationV2 object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bluetoothAvailable != null) {
      yield r'bluetoothAvailable';
      yield serializers.serialize(
        object.bluetoothAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.clientEnvHandle != null) {
      yield r'clientEnvHandle';
      yield serializers.serialize(
        object.clientEnvHandle,
        specifiedType: const FullType(String),
      );
    }
    if (object.visitorId != null) {
      yield r'visitorId';
      yield serializers.serialize(
        object.visitorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.isUserVerifyingPlatformAuthenticatorAvailable != null) {
      yield r'isUserVerifyingPlatformAuthenticatorAvailable';
      yield serializers.serialize(
        object.isUserVerifyingPlatformAuthenticatorAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isConditionalMediationAvailable != null) {
      yield r'isConditionalMediationAvailable';
      yield serializers.serialize(
        object.isConditionalMediationAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.clientCapabilities != null) {
      yield r'clientCapabilities';
      yield serializers.serialize(
        object.clientCapabilities,
        specifiedType: const FullType(ClientCapabilities),
      );
    }
    if (object.javaScriptHighEntropy != null) {
      yield r'javaScriptHighEntropy';
      yield serializers.serialize(
        object.javaScriptHighEntropy,
        specifiedType: const FullType(JavaScriptHighEntropy),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientInformationV2 object, {
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
    required ClientInformationV2Builder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'bluetoothAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.bluetoothAvailable = valueDes;
          break;
        case r'clientEnvHandle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientEnvHandle = valueDes;
          break;
        case r'visitorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.visitorId = valueDes;
          break;
        case r'isUserVerifyingPlatformAuthenticatorAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isUserVerifyingPlatformAuthenticatorAvailable = valueDes;
          break;
        case r'isConditionalMediationAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isConditionalMediationAvailable = valueDes;
          break;
        case r'clientCapabilities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClientCapabilities),
          ) as ClientCapabilities;
          result.clientCapabilities.replace(valueDes);
          break;
        case r'javaScriptHighEntropy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JavaScriptHighEntropy),
          ) as JavaScriptHighEntropy;
          result.javaScriptHighEntropy.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientInformationV2 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientInformationV2Builder();
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

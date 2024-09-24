//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/client_capabilities.dart';
import 'package:corbado_frontend_api_client/src/model/java_script_high_entropy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_information.g.dart';

/// ClientInformation
///
/// Properties:
/// * [bluetoothAvailable]
/// * [clientEnvHandle]
/// * [visitorId]
/// * [canUsePasskeys] - Deprecated, use isUserVerifyingPlatformAuthenticatorAvailable instead
/// * [isUserVerifyingPlatformAuthenticatorAvailable]
/// * [isConditionalMediationAvailable]
/// * [clientCapabilities]
/// * [javaScriptHighEntropy]
/// * [isNative]
@BuiltValue()
abstract class ClientInformation
    implements Built<ClientInformation, ClientInformationBuilder> {
  @BuiltValueField(wireName: r'bluetoothAvailable')
  bool? get bluetoothAvailable;

  @BuiltValueField(wireName: r'clientEnvHandle')
  String? get clientEnvHandle;

  @BuiltValueField(wireName: r'visitorId')
  String? get visitorId;

  /// Deprecated, use isUserVerifyingPlatformAuthenticatorAvailable instead
  @BuiltValueField(wireName: r'canUsePasskeys')
  bool? get canUsePasskeys;

  @BuiltValueField(wireName: r'isUserVerifyingPlatformAuthenticatorAvailable')
  bool? get isUserVerifyingPlatformAuthenticatorAvailable;

  @BuiltValueField(wireName: r'isConditionalMediationAvailable')
  bool? get isConditionalMediationAvailable;

  @BuiltValueField(wireName: r'clientCapabilities')
  ClientCapabilities? get clientCapabilities;

  @BuiltValueField(wireName: r'javaScriptHighEntropy')
  JavaScriptHighEntropy? get javaScriptHighEntropy;

  @BuiltValueField(wireName: r'isNative')
  bool? get isNative;

  ClientInformation._();

  factory ClientInformation([void updates(ClientInformationBuilder b)]) =
      _$ClientInformation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientInformationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientInformation> get serializer =>
      _$ClientInformationSerializer();
}

class _$ClientInformationSerializer
    implements PrimitiveSerializer<ClientInformation> {
  @override
  final Iterable<Type> types = const [ClientInformation, _$ClientInformation];

  @override
  final String wireName = r'ClientInformation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientInformation object, {
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
    if (object.canUsePasskeys != null) {
      yield r'canUsePasskeys';
      yield serializers.serialize(
        object.canUsePasskeys,
        specifiedType: const FullType(bool),
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
    if (object.isNative != null) {
      yield r'isNative';
      yield serializers.serialize(
        object.isNative,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientInformation object, {
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
    required ClientInformationBuilder result,
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
        case r'canUsePasskeys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canUsePasskeys = valueDes;
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
        case r'isNative':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isNative = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientInformation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientInformationBuilder();
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

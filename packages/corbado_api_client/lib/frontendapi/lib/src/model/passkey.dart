//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'passkey.g.dart';

/// Passkey
///
/// Properties:
/// * [id]
/// * [credentialID]
/// * [attestationType]
/// * [transport]
/// * [backupEligible]
/// * [backupState]
/// * [authenticatorAAGUID]
/// * [sourceOS]
/// * [sourceBrowser]
/// * [lastUsed] - Timestamp of when the passkey was last used in yyyy-MM-dd'T'HH:mm:ss format
/// * [created] - Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
/// * [status] - Status
@BuiltValue()
abstract class Passkey implements Built<Passkey, PasskeyBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'credentialID')
  String get credentialID;

  @BuiltValueField(wireName: r'attestationType')
  String get attestationType;

  @BuiltValueField(wireName: r'transport')
  BuiltList<PasskeyTransportEnum> get transport;
  // enum transportEnum {  usb,  nfc,  ble,  internal,  hybrid,  smart-card,  };

  @BuiltValueField(wireName: r'backupEligible')
  bool get backupEligible;

  @BuiltValueField(wireName: r'backupState')
  bool get backupState;

  @BuiltValueField(wireName: r'authenticatorAAGUID')
  String get authenticatorAAGUID;

  @BuiltValueField(wireName: r'sourceOS')
  String get sourceOS;

  @BuiltValueField(wireName: r'sourceBrowser')
  String get sourceBrowser;

  /// Timestamp of when the passkey was last used in yyyy-MM-dd'T'HH:mm:ss format
  @BuiltValueField(wireName: r'lastUsed')
  String get lastUsed;

  /// Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format
  @BuiltValueField(wireName: r'created')
  String get created;

  /// Status
  @BuiltValueField(wireName: r'status')
  PasskeyStatusEnum get status;
  // enum statusEnum {  pending,  active,  };

  Passkey._();

  factory Passkey([void updates(PasskeyBuilder b)]) = _$Passkey;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasskeyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Passkey> get serializer => _$PasskeySerializer();
}

class _$PasskeySerializer implements PrimitiveSerializer<Passkey> {
  @override
  final Iterable<Type> types = const [Passkey, _$Passkey];

  @override
  final String wireName = r'Passkey';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Passkey object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'credentialID';
    yield serializers.serialize(
      object.credentialID,
      specifiedType: const FullType(String),
    );
    yield r'attestationType';
    yield serializers.serialize(
      object.attestationType,
      specifiedType: const FullType(String),
    );
    yield r'transport';
    yield serializers.serialize(
      object.transport,
      specifiedType:
          const FullType(BuiltList, [FullType(PasskeyTransportEnum)]),
    );
    yield r'backupEligible';
    yield serializers.serialize(
      object.backupEligible,
      specifiedType: const FullType(bool),
    );
    yield r'backupState';
    yield serializers.serialize(
      object.backupState,
      specifiedType: const FullType(bool),
    );
    yield r'authenticatorAAGUID';
    yield serializers.serialize(
      object.authenticatorAAGUID,
      specifiedType: const FullType(String),
    );
    yield r'sourceOS';
    yield serializers.serialize(
      object.sourceOS,
      specifiedType: const FullType(String),
    );
    yield r'sourceBrowser';
    yield serializers.serialize(
      object.sourceBrowser,
      specifiedType: const FullType(String),
    );
    yield r'lastUsed';
    yield serializers.serialize(
      object.lastUsed,
      specifiedType: const FullType(String),
    );
    yield r'created';
    yield serializers.serialize(
      object.created,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(PasskeyStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Passkey object, {
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
    required PasskeyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'credentialID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.credentialID = valueDes;
          break;
        case r'attestationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attestationType = valueDes;
          break;
        case r'transport':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(PasskeyTransportEnum)]),
          ) as BuiltList<PasskeyTransportEnum>;
          result.transport.replace(valueDes);
          break;
        case r'backupEligible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.backupEligible = valueDes;
          break;
        case r'backupState':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.backupState = valueDes;
          break;
        case r'authenticatorAAGUID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.authenticatorAAGUID = valueDes;
          break;
        case r'sourceOS':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceOS = valueDes;
          break;
        case r'sourceBrowser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceBrowser = valueDes;
          break;
        case r'lastUsed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastUsed = valueDes;
          break;
        case r'created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.created = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyStatusEnum),
          ) as PasskeyStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Passkey deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasskeyBuilder();
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

class PasskeyTransportEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'usb')
  static const PasskeyTransportEnum usb = _$passkeyTransportEnum_usb;
  @BuiltValueEnumConst(wireName: r'nfc')
  static const PasskeyTransportEnum nfc = _$passkeyTransportEnum_nfc;
  @BuiltValueEnumConst(wireName: r'ble')
  static const PasskeyTransportEnum ble = _$passkeyTransportEnum_ble;
  @BuiltValueEnumConst(wireName: r'internal')
  static const PasskeyTransportEnum internal = _$passkeyTransportEnum_internal;
  @BuiltValueEnumConst(wireName: r'hybrid')
  static const PasskeyTransportEnum hybrid = _$passkeyTransportEnum_hybrid;
  @BuiltValueEnumConst(wireName: r'smart-card', fallback: true)
  static const PasskeyTransportEnum smartCard =
      _$passkeyTransportEnum_smartCard;

  static Serializer<PasskeyTransportEnum> get serializer =>
      _$passkeyTransportEnumSerializer;

  const PasskeyTransportEnum._(String name) : super(name);

  static BuiltSet<PasskeyTransportEnum> get values =>
      _$passkeyTransportEnumValues;
  static PasskeyTransportEnum valueOf(String name) =>
      _$passkeyTransportEnumValueOf(name);
}

class PasskeyStatusEnum extends EnumClass {
  /// Status
  @BuiltValueEnumConst(wireName: r'pending')
  static const PasskeyStatusEnum pending = _$passkeyStatusEnum_pending;

  /// Status
  @BuiltValueEnumConst(wireName: r'active', fallback: true)
  static const PasskeyStatusEnum active = _$passkeyStatusEnum_active;

  static Serializer<PasskeyStatusEnum> get serializer =>
      _$passkeyStatusEnumSerializer;

  const PasskeyStatusEnum._(String name) : super(name);

  static BuiltSet<PasskeyStatusEnum> get values => _$passkeyStatusEnumValues;
  static PasskeyStatusEnum valueOf(String name) =>
      _$passkeyStatusEnumValueOf(name);
}

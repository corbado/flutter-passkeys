//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_passkeys_append_start_rsp.g.dart';

/// MePasskeysAppendStartRsp
///
/// Properties:
/// * [attestationOptions]
/// * [newClientEnvHandle]
/// * [appendNotAllowedReason]
@BuiltValue()
abstract class MePasskeysAppendStartRsp
    implements
        Built<MePasskeysAppendStartRsp, MePasskeysAppendStartRspBuilder> {
  @BuiltValueField(wireName: r'attestationOptions')
  String get attestationOptions;

  @BuiltValueField(wireName: r'newClientEnvHandle')
  String? get newClientEnvHandle;

  @BuiltValueField(wireName: r'appendNotAllowedReason')
  MePasskeysAppendStartRspAppendNotAllowedReasonEnum?
      get appendNotAllowedReason;
  // enum appendNotAllowedReasonEnum {  passkey_already_exists,  passkeys_not_supported,  };

  MePasskeysAppendStartRsp._();

  factory MePasskeysAppendStartRsp(
          [void updates(MePasskeysAppendStartRspBuilder b)]) =
      _$MePasskeysAppendStartRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MePasskeysAppendStartRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MePasskeysAppendStartRsp> get serializer =>
      _$MePasskeysAppendStartRspSerializer();
}

class _$MePasskeysAppendStartRspSerializer
    implements PrimitiveSerializer<MePasskeysAppendStartRsp> {
  @override
  final Iterable<Type> types = const [
    MePasskeysAppendStartRsp,
    _$MePasskeysAppendStartRsp
  ];

  @override
  final String wireName = r'MePasskeysAppendStartRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MePasskeysAppendStartRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attestationOptions';
    yield serializers.serialize(
      object.attestationOptions,
      specifiedType: const FullType(String),
    );
    if (object.newClientEnvHandle != null) {
      yield r'newClientEnvHandle';
      yield serializers.serialize(
        object.newClientEnvHandle,
        specifiedType: const FullType(String),
      );
    }
    if (object.appendNotAllowedReason != null) {
      yield r'appendNotAllowedReason';
      yield serializers.serialize(
        object.appendNotAllowedReason,
        specifiedType:
            const FullType(MePasskeysAppendStartRspAppendNotAllowedReasonEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MePasskeysAppendStartRsp object, {
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
    required MePasskeysAppendStartRspBuilder result,
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
        case r'newClientEnvHandle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newClientEnvHandle = valueDes;
          break;
        case r'appendNotAllowedReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                MePasskeysAppendStartRspAppendNotAllowedReasonEnum),
          ) as MePasskeysAppendStartRspAppendNotAllowedReasonEnum;
          result.appendNotAllowedReason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MePasskeysAppendStartRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MePasskeysAppendStartRspBuilder();
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

class MePasskeysAppendStartRspAppendNotAllowedReasonEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'passkey_already_exists')
  static const MePasskeysAppendStartRspAppendNotAllowedReasonEnum
      passkeyAlreadyExists =
      _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeyAlreadyExists;
  @BuiltValueEnumConst(wireName: r'passkeys_not_supported', fallback: true)
  static const MePasskeysAppendStartRspAppendNotAllowedReasonEnum
      passkeysNotSupported =
      _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeysNotSupported;

  static Serializer<MePasskeysAppendStartRspAppendNotAllowedReasonEnum>
      get serializer =>
          _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumSerializer;

  const MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(String name)
      : super(name);

  static BuiltSet<MePasskeysAppendStartRspAppendNotAllowedReasonEnum>
      get values => _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumValues;
  static MePasskeysAppendStartRspAppendNotAllowedReasonEnum valueOf(
          String name) =>
      _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumValueOf(name);
}

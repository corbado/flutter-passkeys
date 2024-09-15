//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'continue_on_other_device.g.dart';

/// ContinueOnOtherDevice
///
/// Properties:
/// * [reason]
@BuiltValue()
abstract class ContinueOnOtherDevice
    implements Built<ContinueOnOtherDevice, ContinueOnOtherDeviceBuilder> {
  @BuiltValueField(wireName: r'reason')
  ContinueOnOtherDeviceReasonEnum get reason;
  // enum reasonEnum {  email-link-verified,  process-already-completed,  };

  ContinueOnOtherDevice._();

  factory ContinueOnOtherDevice(
      [void updates(ContinueOnOtherDeviceBuilder b)]) = _$ContinueOnOtherDevice;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContinueOnOtherDeviceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContinueOnOtherDevice> get serializer =>
      _$ContinueOnOtherDeviceSerializer();
}

class _$ContinueOnOtherDeviceSerializer
    implements PrimitiveSerializer<ContinueOnOtherDevice> {
  @override
  final Iterable<Type> types = const [
    ContinueOnOtherDevice,
    _$ContinueOnOtherDevice
  ];

  @override
  final String wireName = r'ContinueOnOtherDevice';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContinueOnOtherDevice object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ContinueOnOtherDeviceReasonEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ContinueOnOtherDevice object, {
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
    required ContinueOnOtherDeviceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContinueOnOtherDeviceReasonEnum),
          ) as ContinueOnOtherDeviceReasonEnum;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContinueOnOtherDevice deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContinueOnOtherDeviceBuilder();
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

class ContinueOnOtherDeviceReasonEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'email-link-verified')
  static const ContinueOnOtherDeviceReasonEnum emailLinkVerified =
      _$continueOnOtherDeviceReasonEnum_emailLinkVerified;
  @BuiltValueEnumConst(wireName: r'process-already-completed', fallback: true)
  static const ContinueOnOtherDeviceReasonEnum processAlreadyCompleted =
      _$continueOnOtherDeviceReasonEnum_processAlreadyCompleted;

  static Serializer<ContinueOnOtherDeviceReasonEnum> get serializer =>
      _$continueOnOtherDeviceReasonEnumSerializer;

  const ContinueOnOtherDeviceReasonEnum._(String name) : super(name);

  static BuiltSet<ContinueOnOtherDeviceReasonEnum> get values =>
      _$continueOnOtherDeviceReasonEnumValues;
  static ContinueOnOtherDeviceReasonEnum valueOf(String name) =>
      _$continueOnOtherDeviceReasonEnumValueOf(name);
}

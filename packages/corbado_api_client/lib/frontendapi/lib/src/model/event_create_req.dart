//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_event_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_create_req.g.dart';

/// EventCreateReq
///
/// Properties:
/// * [eventType]
@BuiltValue()
abstract class EventCreateReq
    implements Built<EventCreateReq, EventCreateReqBuilder> {
  @BuiltValueField(wireName: r'eventType')
  PasskeyEventType get eventType;
  // enum eventTypeEnum {  login-explicit-abort,  login-error,  login-one-tap-switch,  user-append-after-cross-platform-blacklisted,  user-append-after-login-error-blacklisted,  append-credential-exists,  append-explicit-abort,  append-error,  };

  EventCreateReq._();

  factory EventCreateReq([void updates(EventCreateReqBuilder b)]) =
      _$EventCreateReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventCreateReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventCreateReq> get serializer =>
      _$EventCreateReqSerializer();
}

class _$EventCreateReqSerializer
    implements PrimitiveSerializer<EventCreateReq> {
  @override
  final Iterable<Type> types = const [EventCreateReq, _$EventCreateReq];

  @override
  final String wireName = r'EventCreateReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventCreateReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'eventType';
    yield serializers.serialize(
      object.eventType,
      specifiedType: const FullType(PasskeyEventType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventCreateReq object, {
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
    required EventCreateReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'eventType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyEventType),
          ) as PasskeyEventType;
          result.eventType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventCreateReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventCreateReqBuilder();
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

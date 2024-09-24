//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_event_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connect_event_create_req.g.dart';

/// ConnectEventCreateReq
///
/// Properties:
/// * [eventType]
@BuiltValue()
abstract class ConnectEventCreateReq
    implements Built<ConnectEventCreateReq, ConnectEventCreateReqBuilder> {
  @BuiltValueField(wireName: r'eventType')
  PasskeyEventType get eventType;
  // enum eventTypeEnum {  login-explicit-abort,  login-error,  login-error-untyped,  login-one-tap-switch,  user-append-after-cross-platform-blacklisted,  user-append-after-login-error-blacklisted,  append-credential-exists,  append-explicit-abort,  append-error,  };

  ConnectEventCreateReq._();

  factory ConnectEventCreateReq(
      [void updates(ConnectEventCreateReqBuilder b)]) = _$ConnectEventCreateReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectEventCreateReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectEventCreateReq> get serializer =>
      _$ConnectEventCreateReqSerializer();
}

class _$ConnectEventCreateReqSerializer
    implements PrimitiveSerializer<ConnectEventCreateReq> {
  @override
  final Iterable<Type> types = const [
    ConnectEventCreateReq,
    _$ConnectEventCreateReq
  ];

  @override
  final String wireName = r'ConnectEventCreateReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectEventCreateReq object, {
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
    ConnectEventCreateReq object, {
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
    required ConnectEventCreateReqBuilder result,
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
  ConnectEventCreateReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectEventCreateReqBuilder();
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

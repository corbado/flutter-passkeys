//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/short_session_cookie_config.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_config_rsp.g.dart';

/// SessionConfigRsp
///
/// Properties:
/// * [useSessionManagement]
/// * [shortSessionCookieConfig]
/// * [frontendApiUrl]
@BuiltValue()
abstract class SessionConfigRsp
    implements Built<SessionConfigRsp, SessionConfigRspBuilder> {
  @BuiltValueField(wireName: r'useSessionManagement')
  bool get useSessionManagement;

  @BuiltValueField(wireName: r'shortSessionCookieConfig')
  ShortSessionCookieConfig? get shortSessionCookieConfig;

  @BuiltValueField(wireName: r'frontendApiUrl')
  String? get frontendApiUrl;

  SessionConfigRsp._();

  factory SessionConfigRsp([void updates(SessionConfigRspBuilder b)]) =
      _$SessionConfigRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionConfigRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionConfigRsp> get serializer =>
      _$SessionConfigRspSerializer();
}

class _$SessionConfigRspSerializer
    implements PrimitiveSerializer<SessionConfigRsp> {
  @override
  final Iterable<Type> types = const [SessionConfigRsp, _$SessionConfigRsp];

  @override
  final String wireName = r'SessionConfigRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionConfigRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'useSessionManagement';
    yield serializers.serialize(
      object.useSessionManagement,
      specifiedType: const FullType(bool),
    );
    if (object.shortSessionCookieConfig != null) {
      yield r'shortSessionCookieConfig';
      yield serializers.serialize(
        object.shortSessionCookieConfig,
        specifiedType: const FullType(ShortSessionCookieConfig),
      );
    }
    if (object.frontendApiUrl != null) {
      yield r'frontendApiUrl';
      yield serializers.serialize(
        object.frontendApiUrl,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionConfigRsp object, {
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
    required SessionConfigRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'useSessionManagement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.useSessionManagement = valueDes;
          break;
        case r'shortSessionCookieConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ShortSessionCookieConfig),
          ) as ShortSessionCookieConfig;
          result.shortSessionCookieConfig.replace(valueDes);
          break;
        case r'frontendApiUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.frontendApiUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionConfigRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionConfigRspBuilder();
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

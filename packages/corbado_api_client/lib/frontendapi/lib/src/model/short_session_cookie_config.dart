//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'short_session_cookie_config.g.dart';

/// ShortSessionCookieConfig
///
/// Properties:
/// * [domain]
/// * [secure]
/// * [sameSite]
/// * [path]
/// * [lifetimeSeconds]
@BuiltValue()
abstract class ShortSessionCookieConfig
    implements
        Built<ShortSessionCookieConfig, ShortSessionCookieConfigBuilder> {
  @BuiltValueField(wireName: r'domain')
  String get domain;

  @BuiltValueField(wireName: r'secure')
  bool get secure;

  @BuiltValueField(wireName: r'sameSite')
  ShortSessionCookieConfigSameSiteEnum get sameSite;
  // enum sameSiteEnum {  lax,  strict,  none,  };

  @BuiltValueField(wireName: r'path')
  String get path;

  @BuiltValueField(wireName: r'lifetimeSeconds')
  int get lifetimeSeconds;

  ShortSessionCookieConfig._();

  factory ShortSessionCookieConfig(
          [void updates(ShortSessionCookieConfigBuilder b)]) =
      _$ShortSessionCookieConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShortSessionCookieConfigBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShortSessionCookieConfig> get serializer =>
      _$ShortSessionCookieConfigSerializer();
}

class _$ShortSessionCookieConfigSerializer
    implements PrimitiveSerializer<ShortSessionCookieConfig> {
  @override
  final Iterable<Type> types = const [
    ShortSessionCookieConfig,
    _$ShortSessionCookieConfig
  ];

  @override
  final String wireName = r'ShortSessionCookieConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShortSessionCookieConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'domain';
    yield serializers.serialize(
      object.domain,
      specifiedType: const FullType(String),
    );
    yield r'secure';
    yield serializers.serialize(
      object.secure,
      specifiedType: const FullType(bool),
    );
    yield r'sameSite';
    yield serializers.serialize(
      object.sameSite,
      specifiedType: const FullType(ShortSessionCookieConfigSameSiteEnum),
    );
    yield r'path';
    yield serializers.serialize(
      object.path,
      specifiedType: const FullType(String),
    );
    yield r'lifetimeSeconds';
    yield serializers.serialize(
      object.lifetimeSeconds,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ShortSessionCookieConfig object, {
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
    required ShortSessionCookieConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'domain':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.domain = valueDes;
          break;
        case r'secure':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.secure = valueDes;
          break;
        case r'sameSite':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ShortSessionCookieConfigSameSiteEnum),
          ) as ShortSessionCookieConfigSameSiteEnum;
          result.sameSite = valueDes;
          break;
        case r'path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.path = valueDes;
          break;
        case r'lifetimeSeconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.lifetimeSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShortSessionCookieConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShortSessionCookieConfigBuilder();
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

class ShortSessionCookieConfigSameSiteEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'lax')
  static const ShortSessionCookieConfigSameSiteEnum lax =
      _$shortSessionCookieConfigSameSiteEnum_lax;
  @BuiltValueEnumConst(wireName: r'strict')
  static const ShortSessionCookieConfigSameSiteEnum strict =
      _$shortSessionCookieConfigSameSiteEnum_strict;
  @BuiltValueEnumConst(wireName: r'none', fallback: true)
  static const ShortSessionCookieConfigSameSiteEnum none =
      _$shortSessionCookieConfigSameSiteEnum_none;

  static Serializer<ShortSessionCookieConfigSameSiteEnum> get serializer =>
      _$shortSessionCookieConfigSameSiteEnumSerializer;

  const ShortSessionCookieConfigSameSiteEnum._(String name) : super(name);

  static BuiltSet<ShortSessionCookieConfigSameSiteEnum> get values =>
      _$shortSessionCookieConfigSameSiteEnumValues;
  static ShortSessionCookieConfigSameSiteEnum valueOf(String name) =>
      _$shortSessionCookieConfigSameSiteEnumValueOf(name);
}

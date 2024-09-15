//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/social_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_data.g.dart';

/// SocialData
///
/// Properties:
/// * [providers]
/// * [status]
/// * [oauthUrl]
/// * [error]
@BuiltValue()
abstract class SocialData implements Built<SocialData, SocialDataBuilder> {
  @BuiltValueField(wireName: r'providers')
  BuiltList<SocialProviderType> get providers;

  @BuiltValueField(wireName: r'status')
  SocialDataStatusEnum get status;
  // enum statusEnum {  initial,  started,  finished,  };

  @BuiltValueField(wireName: r'oauthUrl')
  String? get oauthUrl;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  SocialData._();

  factory SocialData([void updates(SocialDataBuilder b)]) = _$SocialData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SocialDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SocialData> get serializer => _$SocialDataSerializer();
}

class _$SocialDataSerializer implements PrimitiveSerializer<SocialData> {
  @override
  final Iterable<Type> types = const [SocialData, _$SocialData];

  @override
  final String wireName = r'SocialData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SocialData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'providers';
    yield serializers.serialize(
      object.providers,
      specifiedType: const FullType(BuiltList, [FullType(SocialProviderType)]),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(SocialDataStatusEnum),
    );
    if (object.oauthUrl != null) {
      yield r'oauthUrl';
      yield serializers.serialize(
        object.oauthUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(RequestError),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SocialData object, {
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
    required SocialDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'providers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SocialProviderType)]),
          ) as BuiltList<SocialProviderType>;
          result.providers.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SocialDataStatusEnum),
          ) as SocialDataStatusEnum;
          result.status = valueDes;
          break;
        case r'oauthUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.oauthUrl = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RequestError),
          ) as RequestError;
          result.error.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SocialData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SocialDataBuilder();
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

class SocialDataStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'initial')
  static const SocialDataStatusEnum initial = _$socialDataStatusEnum_initial;
  @BuiltValueEnumConst(wireName: r'started')
  static const SocialDataStatusEnum started = _$socialDataStatusEnum_started;
  @BuiltValueEnumConst(wireName: r'finished', fallback: true)
  static const SocialDataStatusEnum finished = _$socialDataStatusEnum_finished;

  static Serializer<SocialDataStatusEnum> get serializer =>
      _$socialDataStatusEnumSerializer;

  const SocialDataStatusEnum._(String name) : super(name);

  static BuiltSet<SocialDataStatusEnum> get values =>
      _$socialDataStatusEnumValues;
  static SocialDataStatusEnum valueOf(String name) =>
      _$socialDataStatusEnumValueOf(name);
}

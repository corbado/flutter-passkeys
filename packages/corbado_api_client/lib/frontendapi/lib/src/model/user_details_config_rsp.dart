//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_config.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_details_config_rsp.g.dart';

/// UserDetailsConfigRsp
///
/// Properties:
/// * [fullNameRequired]
/// * [identifiers]
@BuiltValue()
abstract class UserDetailsConfigRsp
    implements Built<UserDetailsConfigRsp, UserDetailsConfigRspBuilder> {
  @BuiltValueField(wireName: r'fullNameRequired')
  bool get fullNameRequired;

  @BuiltValueField(wireName: r'identifiers')
  BuiltList<LoginIdentifierConfig> get identifiers;

  UserDetailsConfigRsp._();

  factory UserDetailsConfigRsp([void updates(UserDetailsConfigRspBuilder b)]) =
      _$UserDetailsConfigRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserDetailsConfigRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsConfigRsp> get serializer =>
      _$UserDetailsConfigRspSerializer();
}

class _$UserDetailsConfigRspSerializer
    implements PrimitiveSerializer<UserDetailsConfigRsp> {
  @override
  final Iterable<Type> types = const [
    UserDetailsConfigRsp,
    _$UserDetailsConfigRsp
  ];

  @override
  final String wireName = r'UserDetailsConfigRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserDetailsConfigRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'fullNameRequired';
    yield serializers.serialize(
      object.fullNameRequired,
      specifiedType: const FullType(bool),
    );
    yield r'identifiers';
    yield serializers.serialize(
      object.identifiers,
      specifiedType:
          const FullType(BuiltList, [FullType(LoginIdentifierConfig)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserDetailsConfigRsp object, {
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
    required UserDetailsConfigRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fullNameRequired':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.fullNameRequired = valueDes;
          break;
        case r'identifiers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(LoginIdentifierConfig)]),
          ) as BuiltList<LoginIdentifierConfig>;
          result.identifiers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserDetailsConfigRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsConfigRspBuilder();
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

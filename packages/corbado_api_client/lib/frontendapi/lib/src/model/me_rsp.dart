//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/identifier.dart';
import 'package:corbado_frontend_api_client/src/model/social_account.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_rsp.g.dart';

/// MeRsp
///
/// Properties:
/// * [id]
/// * [fullName]
/// * [identifiers]
/// * [socialAccounts]
@BuiltValue()
abstract class MeRsp implements Built<MeRsp, MeRspBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'fullName')
  String get fullName;

  @BuiltValueField(wireName: r'identifiers')
  BuiltList<Identifier> get identifiers;

  @BuiltValueField(wireName: r'socialAccounts')
  BuiltList<SocialAccount> get socialAccounts;

  MeRsp._();

  factory MeRsp([void updates(MeRspBuilder b)]) = _$MeRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeRsp> get serializer => _$MeRspSerializer();
}

class _$MeRspSerializer implements PrimitiveSerializer<MeRsp> {
  @override
  final Iterable<Type> types = const [MeRsp, _$MeRsp];

  @override
  final String wireName = r'MeRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'fullName';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'identifiers';
    yield serializers.serialize(
      object.identifiers,
      specifiedType: const FullType(BuiltList, [FullType(Identifier)]),
    );
    yield r'socialAccounts';
    yield serializers.serialize(
      object.socialAccounts,
      specifiedType: const FullType(BuiltList, [FullType(SocialAccount)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MeRsp object, {
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
    required MeRspBuilder result,
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
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'identifiers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Identifier)]),
          ) as BuiltList<Identifier>;
          result.identifiers.replace(valueDes);
          break;
        case r'socialAccounts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SocialAccount)]),
          ) as BuiltList<SocialAccount>;
          result.socialAccounts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MeRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeRspBuilder();
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

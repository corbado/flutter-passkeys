//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey.dart';
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/paging.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_passkey_rsp.g.dart';

/// MePasskeyRsp
///
/// Properties:
/// * [passkeys]
/// * [paging]
@BuiltValue()
abstract class MePasskeyRsp
    implements Built<MePasskeyRsp, MePasskeyRspBuilder> {
  @BuiltValueField(wireName: r'passkeys')
  BuiltList<Passkey> get passkeys;

  @BuiltValueField(wireName: r'paging')
  Paging get paging;

  MePasskeyRsp._();

  factory MePasskeyRsp([void updates(MePasskeyRspBuilder b)]) = _$MePasskeyRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MePasskeyRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MePasskeyRsp> get serializer => _$MePasskeyRspSerializer();
}

class _$MePasskeyRspSerializer implements PrimitiveSerializer<MePasskeyRsp> {
  @override
  final Iterable<Type> types = const [MePasskeyRsp, _$MePasskeyRsp];

  @override
  final String wireName = r'MePasskeyRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MePasskeyRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'passkeys';
    yield serializers.serialize(
      object.passkeys,
      specifiedType: const FullType(BuiltList, [FullType(Passkey)]),
    );
    yield r'paging';
    yield serializers.serialize(
      object.paging,
      specifiedType: const FullType(Paging),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MePasskeyRsp object, {
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
    required MePasskeyRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'passkeys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Passkey)]),
          ) as BuiltList<Passkey>;
          result.passkeys.replace(valueDes);
          break;
        case r'paging':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Paging),
          ) as Paging;
          result.paging.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MePasskeyRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MePasskeyRspBuilder();
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

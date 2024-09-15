//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_refresh_rsp.g.dart';

/// MeRefreshRsp
///
/// Properties:
/// * [shortSession]
@BuiltValue()
abstract class MeRefreshRsp
    implements Built<MeRefreshRsp, MeRefreshRspBuilder> {
  @BuiltValueField(wireName: r'shortSession')
  String get shortSession;

  MeRefreshRsp._();

  factory MeRefreshRsp([void updates(MeRefreshRspBuilder b)]) = _$MeRefreshRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeRefreshRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeRefreshRsp> get serializer => _$MeRefreshRspSerializer();
}

class _$MeRefreshRspSerializer implements PrimitiveSerializer<MeRefreshRsp> {
  @override
  final Iterable<Type> types = const [MeRefreshRsp, _$MeRefreshRsp];

  @override
  final String wireName = r'MeRefreshRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeRefreshRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'shortSession';
    yield serializers.serialize(
      object.shortSession,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MeRefreshRsp object, {
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
    required MeRefreshRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'shortSession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shortSession = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MeRefreshRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeRefreshRspBuilder();
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

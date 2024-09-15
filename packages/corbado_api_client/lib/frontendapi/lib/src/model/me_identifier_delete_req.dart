//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_identifier_delete_req.g.dart';

/// MeIdentifierDeleteReq
///
/// Properties:
/// * [identifierID]
@BuiltValue()
abstract class MeIdentifierDeleteReq
    implements Built<MeIdentifierDeleteReq, MeIdentifierDeleteReqBuilder> {
  @BuiltValueField(wireName: r'identifierID')
  String get identifierID;

  MeIdentifierDeleteReq._();

  factory MeIdentifierDeleteReq(
      [void updates(MeIdentifierDeleteReqBuilder b)]) = _$MeIdentifierDeleteReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeIdentifierDeleteReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeIdentifierDeleteReq> get serializer =>
      _$MeIdentifierDeleteReqSerializer();
}

class _$MeIdentifierDeleteReqSerializer
    implements PrimitiveSerializer<MeIdentifierDeleteReq> {
  @override
  final Iterable<Type> types = const [
    MeIdentifierDeleteReq,
    _$MeIdentifierDeleteReq
  ];

  @override
  final String wireName = r'MeIdentifierDeleteReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeIdentifierDeleteReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierID';
    yield serializers.serialize(
      object.identifierID,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MeIdentifierDeleteReq object, {
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
    required MeIdentifierDeleteReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifierID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierID = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MeIdentifierDeleteReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeIdentifierDeleteReqBuilder();
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

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'signup_init_req.g.dart';

/// tbd.
///
/// Properties:
/// * [identifiers]
/// * [fullName]
@BuiltValue()
abstract class SignupInitReq
    implements Built<SignupInitReq, SignupInitReqBuilder> {
  @BuiltValueField(wireName: r'identifiers')
  BuiltList<LoginIdentifier> get identifiers;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  SignupInitReq._();

  factory SignupInitReq([void updates(SignupInitReqBuilder b)]) =
      _$SignupInitReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SignupInitReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SignupInitReq> get serializer =>
      _$SignupInitReqSerializer();
}

class _$SignupInitReqSerializer implements PrimitiveSerializer<SignupInitReq> {
  @override
  final Iterable<Type> types = const [SignupInitReq, _$SignupInitReq];

  @override
  final String wireName = r'SignupInitReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SignupInitReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifiers';
    yield serializers.serialize(
      object.identifiers,
      specifiedType: const FullType(BuiltList, [FullType(LoginIdentifier)]),
    );
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SignupInitReq object, {
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
    required SignupInitReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifiers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(LoginIdentifier)]),
          ) as BuiltList<LoginIdentifier>;
          result.identifiers.replace(valueDes);
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SignupInitReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SignupInitReqBuilder();
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

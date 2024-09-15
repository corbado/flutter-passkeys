//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_init_req.g.dart';

/// tbd.
///
/// Properties:
/// * [identifierValue]
/// * [isPhone]
@BuiltValue()
abstract class LoginInitReq
    implements Built<LoginInitReq, LoginInitReqBuilder> {
  @BuiltValueField(wireName: r'identifierValue')
  String get identifierValue;

  @BuiltValueField(wireName: r'isPhone')
  bool get isPhone;

  LoginInitReq._();

  factory LoginInitReq([void updates(LoginInitReqBuilder b)]) = _$LoginInitReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginInitReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginInitReq> get serializer => _$LoginInitReqSerializer();
}

class _$LoginInitReqSerializer implements PrimitiveSerializer<LoginInitReq> {
  @override
  final Iterable<Type> types = const [LoginInitReq, _$LoginInitReq];

  @override
  final String wireName = r'LoginInitReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginInitReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'identifierValue';
    yield serializers.serialize(
      object.identifierValue,
      specifiedType: const FullType(String),
    );
    yield r'isPhone';
    yield serializers.serialize(
      object.isPhone,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginInitReq object, {
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
    required LoginInitReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'identifierValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identifierValue = valueDes;
          break;
        case r'isPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPhone = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginInitReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginInitReqBuilder();
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

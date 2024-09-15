//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'full_name_with_error.g.dart';

/// FullNameWithError
///
/// Properties:
/// * [fullName]
/// * [error]
@BuiltValue()
abstract class FullNameWithError
    implements Built<FullNameWithError, FullNameWithErrorBuilder> {
  @BuiltValueField(wireName: r'fullName')
  String get fullName;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  FullNameWithError._();

  factory FullNameWithError([void updates(FullNameWithErrorBuilder b)]) =
      _$FullNameWithError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FullNameWithErrorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FullNameWithError> get serializer =>
      _$FullNameWithErrorSerializer();
}

class _$FullNameWithErrorSerializer
    implements PrimitiveSerializer<FullNameWithError> {
  @override
  final Iterable<Type> types = const [FullNameWithError, _$FullNameWithError];

  @override
  final String wireName = r'FullNameWithError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FullNameWithError object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'fullName';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
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
    FullNameWithError object, {
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
    required FullNameWithErrorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
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
  FullNameWithError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FullNameWithErrorBuilder();
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

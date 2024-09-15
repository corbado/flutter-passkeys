//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'request_data.g.dart';

/// Data about the request itself, can be used for debugging
///
/// Properties:
/// * [requestID] - Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
/// * [link] - Link to dashboard with details about request
@BuiltValue()
abstract class RequestData implements Built<RequestData, RequestDataBuilder> {
  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  @BuiltValueField(wireName: r'requestID')
  String get requestID;

  /// Link to dashboard with details about request
  @BuiltValueField(wireName: r'link')
  String get link;

  RequestData._();

  factory RequestData([void updates(RequestDataBuilder b)]) = _$RequestData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RequestDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RequestData> get serializer => _$RequestDataSerializer();
}

class _$RequestDataSerializer implements PrimitiveSerializer<RequestData> {
  @override
  final Iterable<Type> types = const [RequestData, _$RequestData];

  @override
  final String wireName = r'RequestData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RequestData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'requestID';
    yield serializers.serialize(
      object.requestID,
      specifiedType: const FullType(String),
    );
    yield r'link';
    yield serializers.serialize(
      object.link,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RequestData object, {
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
    required RequestDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'requestID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestID = valueDes;
          break;
        case r'link':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.link = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RequestData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RequestDataBuilder();
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

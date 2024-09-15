//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/request_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_rsp.g.dart';

/// GenericRsp
///
/// Properties:
/// * [httpStatusCode] - HTTP status code of operation
/// * [message]
/// * [requestData]
/// * [runtime] - Runtime in seconds for this request
@BuiltValue()
abstract class GenericRsp implements Built<GenericRsp, GenericRspBuilder> {
  /// HTTP status code of operation
  @BuiltValueField(wireName: r'httpStatusCode')
  int get httpStatusCode;

  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'requestData')
  RequestData get requestData;

  /// Runtime in seconds for this request
  @BuiltValueField(wireName: r'runtime')
  double get runtime;

  GenericRsp._();

  factory GenericRsp([void updates(GenericRspBuilder b)]) = _$GenericRsp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericRspBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericRsp> get serializer => _$GenericRspSerializer();
}

class _$GenericRspSerializer implements PrimitiveSerializer<GenericRsp> {
  @override
  final Iterable<Type> types = const [GenericRsp, _$GenericRsp];

  @override
  final String wireName = r'GenericRsp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericRsp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'httpStatusCode';
    yield serializers.serialize(
      object.httpStatusCode,
      specifiedType: const FullType(int),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'requestData';
    yield serializers.serialize(
      object.requestData,
      specifiedType: const FullType(RequestData),
    );
    yield r'runtime';
    yield serializers.serialize(
      object.runtime,
      specifiedType: const FullType(double),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericRsp object, {
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
    required GenericRspBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'httpStatusCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.httpStatusCode = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'requestData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RequestData),
          ) as RequestData;
          result.requestData.replace(valueDes);
          break;
        case r'runtime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.runtime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenericRsp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericRspBuilder();
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

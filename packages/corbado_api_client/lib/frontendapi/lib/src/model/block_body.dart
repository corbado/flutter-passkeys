//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/continue_on_other_device.dart';
import 'package:corbado_frontend_api_client/src/model/auth_type.dart';
import 'package:corbado_frontend_api_client/src/model/block_body_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/block_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'block_body.g.dart';

/// BlockBody
///
/// Properties:
/// * [block]
/// * [authType]
/// * [data]
/// * [alternatives]
/// * [error]
/// * [continueOnOtherDevice]
@BuiltValue()
abstract class BlockBody implements Built<BlockBody, BlockBodyBuilder> {
  @BuiltValueField(wireName: r'block')
  BlockType get block;
  // enum blockEnum {  signup-init,  passkey-append,  phone-verify,  email-verify,  passkey-appended,  completed,  social-verify,  login-init,  passkey-verify,  conditional-ui-completed,  post-signup-email-verify,  passkey-append-after-hybrid,  };

  @BuiltValueField(wireName: r'authType')
  AuthType get authType;
  // enum authTypeEnum {  signup,  login,  };

  @BuiltValueField(wireName: r'data')
  BlockBodyData get data;

  @BuiltValueField(wireName: r'alternatives')
  BuiltList<BlockBody>? get alternatives;

  @BuiltValueField(wireName: r'error')
  RequestError? get error;

  @BuiltValueField(wireName: r'continueOnOtherDevice')
  ContinueOnOtherDevice? get continueOnOtherDevice;

  BlockBody._();

  factory BlockBody([void updates(BlockBodyBuilder b)]) = _$BlockBody;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BlockBodyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BlockBody> get serializer => _$BlockBodySerializer();
}

class _$BlockBodySerializer implements PrimitiveSerializer<BlockBody> {
  @override
  final Iterable<Type> types = const [BlockBody, _$BlockBody];

  @override
  final String wireName = r'BlockBody';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BlockBody object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'block';
    yield serializers.serialize(
      object.block,
      specifiedType: const FullType(BlockType),
    );
    yield r'authType';
    yield serializers.serialize(
      object.authType,
      specifiedType: const FullType(AuthType),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BlockBodyData),
    );
    if (object.alternatives != null) {
      yield r'alternatives';
      yield serializers.serialize(
        object.alternatives,
        specifiedType: const FullType(BuiltList, [FullType(BlockBody)]),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(RequestError),
      );
    }
    if (object.continueOnOtherDevice != null) {
      yield r'continueOnOtherDevice';
      yield serializers.serialize(
        object.continueOnOtherDevice,
        specifiedType: const FullType(ContinueOnOtherDevice),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BlockBody object, {
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
    required BlockBodyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'block':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockType),
          ) as BlockType;
          result.block = valueDes;
          break;
        case r'authType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AuthType),
          ) as AuthType;
          result.authType = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockBodyData),
          ) as BlockBodyData;
          result.data.replace(valueDes);
          break;
        case r'alternatives':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BlockBody)]),
          ) as BuiltList<BlockBody>;
          result.alternatives.replace(valueDes);
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RequestError),
          ) as RequestError;
          result.error.replace(valueDes);
          break;
        case r'continueOnOtherDevice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContinueOnOtherDevice),
          ) as ContinueOnOtherDevice;
          result.continueOnOtherDevice.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BlockBody deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BlockBodyBuilder();
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

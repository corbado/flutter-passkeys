//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/block_type.dart';
import 'package:corbado_frontend_api_client/src/model/client_information.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'process_init_req.g.dart';

/// tbd.
///
/// Properties:
/// * [clientInformation]
/// * [passkeyAppendShown]
/// * [optOutOfPasskeyAppendAfterHybrid] - deprecated
/// * [preferredBlock]
@BuiltValue()
abstract class ProcessInitReq
    implements Built<ProcessInitReq, ProcessInitReqBuilder> {
  @BuiltValueField(wireName: r'clientInformation')
  ClientInformation get clientInformation;

  @BuiltValueField(wireName: r'passkeyAppendShown')
  int? get passkeyAppendShown;

  /// deprecated
  @BuiltValueField(wireName: r'optOutOfPasskeyAppendAfterHybrid')
  bool? get optOutOfPasskeyAppendAfterHybrid;

  @BuiltValueField(wireName: r'preferredBlock')
  BlockType? get preferredBlock;
  // enum preferredBlockEnum {  signup-init,  passkey-append,  phone-verify,  email-verify,  passkey-appended,  completed,  social-verify,  login-init,  passkey-verify,  conditional-ui-completed,  post-signup-email-verify,  passkey-append-after-hybrid,  };

  ProcessInitReq._();

  factory ProcessInitReq([void updates(ProcessInitReqBuilder b)]) =
      _$ProcessInitReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProcessInitReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProcessInitReq> get serializer =>
      _$ProcessInitReqSerializer();
}

class _$ProcessInitReqSerializer
    implements PrimitiveSerializer<ProcessInitReq> {
  @override
  final Iterable<Type> types = const [ProcessInitReq, _$ProcessInitReq];

  @override
  final String wireName = r'ProcessInitReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProcessInitReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clientInformation';
    yield serializers.serialize(
      object.clientInformation,
      specifiedType: const FullType(ClientInformation),
    );
    if (object.passkeyAppendShown != null) {
      yield r'passkeyAppendShown';
      yield serializers.serialize(
        object.passkeyAppendShown,
        specifiedType: const FullType(int),
      );
    }
    if (object.optOutOfPasskeyAppendAfterHybrid != null) {
      yield r'optOutOfPasskeyAppendAfterHybrid';
      yield serializers.serialize(
        object.optOutOfPasskeyAppendAfterHybrid,
        specifiedType: const FullType(bool),
      );
    }
    if (object.preferredBlock != null) {
      yield r'preferredBlock';
      yield serializers.serialize(
        object.preferredBlock,
        specifiedType: const FullType(BlockType),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProcessInitReq object, {
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
    required ProcessInitReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clientInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClientInformation),
          ) as ClientInformation;
          result.clientInformation.replace(valueDes);
          break;
        case r'passkeyAppendShown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.passkeyAppendShown = valueDes;
          break;
        case r'optOutOfPasskeyAppendAfterHybrid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.optOutOfPasskeyAppendAfterHybrid = valueDes;
          break;
        case r'preferredBlock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockType),
          ) as BlockType;
          result.preferredBlock = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProcessInitReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProcessInitReqBuilder();
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

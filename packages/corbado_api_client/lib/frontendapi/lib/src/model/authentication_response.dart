//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authentication_response.g.dart';

/// AuthenticationResponse
///
/// Properties:
/// * [shortSession]
/// * [longSession] - Only given when project environment is dev
/// * [passkeyOperation]
@BuiltValue()
abstract class AuthenticationResponse
    implements Built<AuthenticationResponse, AuthenticationResponseBuilder> {
  @BuiltValueField(wireName: r'shortSession')
  String get shortSession;

  /// Only given when project environment is dev
  @BuiltValueField(wireName: r'longSession')
  String? get longSession;

  @BuiltValueField(wireName: r'passkeyOperation')
  PasskeyOperation? get passkeyOperation;

  AuthenticationResponse._();

  factory AuthenticationResponse(
          [void updates(AuthenticationResponseBuilder b)]) =
      _$AuthenticationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticationResponse> get serializer =>
      _$AuthenticationResponseSerializer();
}

class _$AuthenticationResponseSerializer
    implements PrimitiveSerializer<AuthenticationResponse> {
  @override
  final Iterable<Type> types = const [
    AuthenticationResponse,
    _$AuthenticationResponse
  ];

  @override
  final String wireName = r'AuthenticationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'shortSession';
    yield serializers.serialize(
      object.shortSession,
      specifiedType: const FullType(String),
    );
    if (object.longSession != null) {
      yield r'longSession';
      yield serializers.serialize(
        object.longSession,
        specifiedType: const FullType(String),
      );
    }
    if (object.passkeyOperation != null) {
      yield r'passkeyOperation';
      yield serializers.serialize(
        object.passkeyOperation,
        specifiedType: const FullType(PasskeyOperation),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthenticationResponse object, {
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
    required AuthenticationResponseBuilder result,
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
        case r'longSession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.longSession = valueDes;
          break;
        case r'passkeyOperation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PasskeyOperation),
          ) as PasskeyOperation;
          result.passkeyOperation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthenticationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticationResponseBuilder();
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

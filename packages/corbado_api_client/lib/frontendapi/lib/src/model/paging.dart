//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paging.g.dart';

/// Paging
///
/// Properties:
/// * [page] - current page returned in response
/// * [totalPages] - total number of pages available
/// * [totalItems] - total number of items available
@BuiltValue()
abstract class Paging implements Built<Paging, PagingBuilder> {
  /// current page returned in response
  @BuiltValueField(wireName: r'page')
  int get page;

  /// total number of pages available
  @BuiltValueField(wireName: r'totalPages')
  int get totalPages;

  /// total number of items available
  @BuiltValueField(wireName: r'totalItems')
  int get totalItems;

  Paging._();

  factory Paging([void updates(PagingBuilder b)]) = _$Paging;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PagingBuilder b) => b..page = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<Paging> get serializer => _$PagingSerializer();
}

class _$PagingSerializer implements PrimitiveSerializer<Paging> {
  @override
  final Iterable<Type> types = const [Paging, _$Paging];

  @override
  final String wireName = r'Paging';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Paging object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(int),
    );
    yield r'totalPages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(int),
    );
    yield r'totalItems';
    yield serializers.serialize(
      object.totalItems,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Paging object, {
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
    required PagingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.page = valueDes;
          break;
        case r'totalPages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalPages = valueDes;
          break;
        case r'totalItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalItems = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Paging deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PagingBuilder();
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

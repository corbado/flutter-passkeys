// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_body_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BlockBodyDataVariantEnum _$blockBodyDataVariantEnum_default_ =
    const BlockBodyDataVariantEnum._('default_');
const BlockBodyDataVariantEnum _$blockBodyDataVariantEnum_afterHybrid =
    const BlockBodyDataVariantEnum._('afterHybrid');
const BlockBodyDataVariantEnum _$blockBodyDataVariantEnum_afterError =
    const BlockBodyDataVariantEnum._('afterError');

BlockBodyDataVariantEnum _$blockBodyDataVariantEnumValueOf(String name) {
  switch (name) {
    case 'default_':
      return _$blockBodyDataVariantEnum_default_;
    case 'afterHybrid':
      return _$blockBodyDataVariantEnum_afterHybrid;
    case 'afterError':
      return _$blockBodyDataVariantEnum_afterError;
    default:
      return _$blockBodyDataVariantEnum_afterError;
  }
}

final BuiltSet<BlockBodyDataVariantEnum> _$blockBodyDataVariantEnumValues =
    new BuiltSet<BlockBodyDataVariantEnum>(const <BlockBodyDataVariantEnum>[
  _$blockBodyDataVariantEnum_default_,
  _$blockBodyDataVariantEnum_afterHybrid,
  _$blockBodyDataVariantEnum_afterError,
]);

const BlockBodyDataLoginHintEnum _$blockBodyDataLoginHintEnum_cda =
    const BlockBodyDataLoginHintEnum._('cda');

BlockBodyDataLoginHintEnum _$blockBodyDataLoginHintEnumValueOf(String name) {
  switch (name) {
    case 'cda':
      return _$blockBodyDataLoginHintEnum_cda;
    default:
      return _$blockBodyDataLoginHintEnum_cda;
  }
}

final BuiltSet<BlockBodyDataLoginHintEnum> _$blockBodyDataLoginHintEnumValues =
    new BuiltSet<BlockBodyDataLoginHintEnum>(const <BlockBodyDataLoginHintEnum>[
  _$blockBodyDataLoginHintEnum_cda,
]);

Serializer<BlockBodyDataVariantEnum> _$blockBodyDataVariantEnumSerializer =
    new _$BlockBodyDataVariantEnumSerializer();
Serializer<BlockBodyDataLoginHintEnum> _$blockBodyDataLoginHintEnumSerializer =
    new _$BlockBodyDataLoginHintEnumSerializer();

class _$BlockBodyDataVariantEnumSerializer
    implements PrimitiveSerializer<BlockBodyDataVariantEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'default_': 'default',
    'afterHybrid': 'after-hybrid',
    'afterError': 'after-error',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'default': 'default_',
    'after-hybrid': 'afterHybrid',
    'after-error': 'afterError',
  };

  @override
  final Iterable<Type> types = const <Type>[BlockBodyDataVariantEnum];
  @override
  final String wireName = 'BlockBodyDataVariantEnum';

  @override
  Object serialize(Serializers serializers, BlockBodyDataVariantEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BlockBodyDataVariantEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BlockBodyDataVariantEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$BlockBodyDataLoginHintEnumSerializer
    implements PrimitiveSerializer<BlockBodyDataLoginHintEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cda': 'cda',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'cda': 'cda',
  };

  @override
  final Iterable<Type> types = const <Type>[BlockBodyDataLoginHintEnum];
  @override
  final String wireName = 'BlockBodyDataLoginHintEnum';

  @override
  Object serialize(Serializers serializers, BlockBodyDataLoginHintEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BlockBodyDataLoginHintEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BlockBodyDataLoginHintEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$BlockBodyData extends BlockBodyData {
  @override
  final OneOf oneOf;

  factory _$BlockBodyData([void Function(BlockBodyDataBuilder)? updates]) =>
      (new BlockBodyDataBuilder()..update(updates))._build();

  _$BlockBodyData._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(oneOf, r'BlockBodyData', 'oneOf');
  }

  @override
  BlockBodyData rebuild(void Function(BlockBodyDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBodyDataBuilder toBuilder() => new BlockBodyDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlockBodyData && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BlockBodyData')..add('oneOf', oneOf))
        .toString();
  }
}

class BlockBodyDataBuilder
    implements Builder<BlockBodyData, BlockBodyDataBuilder> {
  _$BlockBodyData? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  BlockBodyDataBuilder() {
    BlockBodyData._defaults(this);
  }

  BlockBodyDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BlockBodyData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BlockBodyData;
  }

  @override
  void update(void Function(BlockBodyDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BlockBodyData build() => _build();

  _$BlockBodyData _build() {
    final _$result = _$v ??
        new _$BlockBodyData._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'BlockBodyData', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

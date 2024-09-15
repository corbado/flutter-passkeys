// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_start_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConnectAppendStartRspVariantEnum
    _$connectAppendStartRspVariantEnum_default_ =
    const ConnectAppendStartRspVariantEnum._('default_');
const ConnectAppendStartRspVariantEnum
    _$connectAppendStartRspVariantEnum_afterHybrid =
    const ConnectAppendStartRspVariantEnum._('afterHybrid');
const ConnectAppendStartRspVariantEnum
    _$connectAppendStartRspVariantEnum_afterError =
    const ConnectAppendStartRspVariantEnum._('afterError');

ConnectAppendStartRspVariantEnum _$connectAppendStartRspVariantEnumValueOf(
    String name) {
  switch (name) {
    case 'default_':
      return _$connectAppendStartRspVariantEnum_default_;
    case 'afterHybrid':
      return _$connectAppendStartRspVariantEnum_afterHybrid;
    case 'afterError':
      return _$connectAppendStartRspVariantEnum_afterError;
    default:
      return _$connectAppendStartRspVariantEnum_afterError;
  }
}

final BuiltSet<ConnectAppendStartRspVariantEnum>
    _$connectAppendStartRspVariantEnumValues = new BuiltSet<
        ConnectAppendStartRspVariantEnum>(const <ConnectAppendStartRspVariantEnum>[
  _$connectAppendStartRspVariantEnum_default_,
  _$connectAppendStartRspVariantEnum_afterHybrid,
  _$connectAppendStartRspVariantEnum_afterError,
]);

Serializer<ConnectAppendStartRspVariantEnum>
    _$connectAppendStartRspVariantEnumSerializer =
    new _$ConnectAppendStartRspVariantEnumSerializer();

class _$ConnectAppendStartRspVariantEnumSerializer
    implements PrimitiveSerializer<ConnectAppendStartRspVariantEnum> {
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
  final Iterable<Type> types = const <Type>[ConnectAppendStartRspVariantEnum];
  @override
  final String wireName = 'ConnectAppendStartRspVariantEnum';

  @override
  Object serialize(
          Serializers serializers, ConnectAppendStartRspVariantEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ConnectAppendStartRspVariantEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ConnectAppendStartRspVariantEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ConnectAppendStartRsp extends ConnectAppendStartRsp {
  @override
  final String attestationOptions;
  @override
  final ConnectAppendStartRspVariantEnum variant;

  factory _$ConnectAppendStartRsp(
          [void Function(ConnectAppendStartRspBuilder)? updates]) =>
      (new ConnectAppendStartRspBuilder()..update(updates))._build();

  _$ConnectAppendStartRsp._(
      {required this.attestationOptions, required this.variant})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        attestationOptions, r'ConnectAppendStartRsp', 'attestationOptions');
    BuiltValueNullFieldError.checkNotNull(
        variant, r'ConnectAppendStartRsp', 'variant');
  }

  @override
  ConnectAppendStartRsp rebuild(
          void Function(ConnectAppendStartRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendStartRspBuilder toBuilder() =>
      new ConnectAppendStartRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendStartRsp &&
        attestationOptions == other.attestationOptions &&
        variant == other.variant;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attestationOptions.hashCode);
    _$hash = $jc(_$hash, variant.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendStartRsp')
          ..add('attestationOptions', attestationOptions)
          ..add('variant', variant))
        .toString();
  }
}

class ConnectAppendStartRspBuilder
    implements Builder<ConnectAppendStartRsp, ConnectAppendStartRspBuilder> {
  _$ConnectAppendStartRsp? _$v;

  String? _attestationOptions;
  String? get attestationOptions => _$this._attestationOptions;
  set attestationOptions(String? attestationOptions) =>
      _$this._attestationOptions = attestationOptions;

  ConnectAppendStartRspVariantEnum? _variant;
  ConnectAppendStartRspVariantEnum? get variant => _$this._variant;
  set variant(ConnectAppendStartRspVariantEnum? variant) =>
      _$this._variant = variant;

  ConnectAppendStartRspBuilder() {
    ConnectAppendStartRsp._defaults(this);
  }

  ConnectAppendStartRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attestationOptions = $v.attestationOptions;
      _variant = $v.variant;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendStartRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendStartRsp;
  }

  @override
  void update(void Function(ConnectAppendStartRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendStartRsp build() => _build();

  _$ConnectAppendStartRsp _build() {
    final _$result = _$v ??
        new _$ConnectAppendStartRsp._(
            attestationOptions: BuiltValueNullFieldError.checkNotNull(
                attestationOptions,
                r'ConnectAppendStartRsp',
                'attestationOptions'),
            variant: BuiltValueNullFieldError.checkNotNull(
                variant, r'ConnectAppendStartRsp', 'variant'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

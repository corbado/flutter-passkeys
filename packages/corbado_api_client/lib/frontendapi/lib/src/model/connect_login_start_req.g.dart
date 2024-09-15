// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConnectLoginStartReqSource_Enum _$connectLoginStartReqSourceEnum_oneTap =
    const ConnectLoginStartReqSource_Enum._('oneTap');
const ConnectLoginStartReqSource_Enum
    _$connectLoginStartReqSourceEnum_textField =
    const ConnectLoginStartReqSource_Enum._('textField');
const ConnectLoginStartReqSource_Enum
    _$connectLoginStartReqSourceEnum_errorSoft =
    const ConnectLoginStartReqSource_Enum._('errorSoft');
const ConnectLoginStartReqSource_Enum
    _$connectLoginStartReqSourceEnum_errorHard =
    const ConnectLoginStartReqSource_Enum._('errorHard');

ConnectLoginStartReqSource_Enum _$connectLoginStartReqSourceEnumValueOf(
    String name) {
  switch (name) {
    case 'oneTap':
      return _$connectLoginStartReqSourceEnum_oneTap;
    case 'textField':
      return _$connectLoginStartReqSourceEnum_textField;
    case 'errorSoft':
      return _$connectLoginStartReqSourceEnum_errorSoft;
    case 'errorHard':
      return _$connectLoginStartReqSourceEnum_errorHard;
    default:
      return _$connectLoginStartReqSourceEnum_errorHard;
  }
}

final BuiltSet<ConnectLoginStartReqSource_Enum>
    _$connectLoginStartReqSourceEnumValues = new BuiltSet<
        ConnectLoginStartReqSource_Enum>(const <ConnectLoginStartReqSource_Enum>[
  _$connectLoginStartReqSourceEnum_oneTap,
  _$connectLoginStartReqSourceEnum_textField,
  _$connectLoginStartReqSourceEnum_errorSoft,
  _$connectLoginStartReqSourceEnum_errorHard,
]);

Serializer<ConnectLoginStartReqSource_Enum>
    _$connectLoginStartReqSourceEnumSerializer =
    new _$ConnectLoginStartReqSource_EnumSerializer();

class _$ConnectLoginStartReqSource_EnumSerializer
    implements PrimitiveSerializer<ConnectLoginStartReqSource_Enum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'oneTap': 'one-tap',
    'textField': 'text-field',
    'errorSoft': 'error-soft',
    'errorHard': 'error-hard',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'one-tap': 'oneTap',
    'text-field': 'textField',
    'error-soft': 'errorSoft',
    'error-hard': 'errorHard',
  };

  @override
  final Iterable<Type> types = const <Type>[ConnectLoginStartReqSource_Enum];
  @override
  final String wireName = 'ConnectLoginStartReqSource_Enum';

  @override
  Object serialize(
          Serializers serializers, ConnectLoginStartReqSource_Enum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ConnectLoginStartReqSource_Enum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ConnectLoginStartReqSource_Enum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ConnectLoginStartReq extends ConnectLoginStartReq {
  @override
  final String identifier;
  @override
  final ConnectLoginStartReqSource_Enum source_;
  @override
  final int loadedMs;

  factory _$ConnectLoginStartReq(
          [void Function(ConnectLoginStartReqBuilder)? updates]) =>
      (new ConnectLoginStartReqBuilder()..update(updates))._build();

  _$ConnectLoginStartReq._(
      {required this.identifier, required this.source_, required this.loadedMs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifier, r'ConnectLoginStartReq', 'identifier');
    BuiltValueNullFieldError.checkNotNull(
        source_, r'ConnectLoginStartReq', 'source_');
    BuiltValueNullFieldError.checkNotNull(
        loadedMs, r'ConnectLoginStartReq', 'loadedMs');
  }

  @override
  ConnectLoginStartReq rebuild(
          void Function(ConnectLoginStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginStartReqBuilder toBuilder() =>
      new ConnectLoginStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginStartReq &&
        identifier == other.identifier &&
        source_ == other.source_ &&
        loadedMs == other.loadedMs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, loadedMs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginStartReq')
          ..add('identifier', identifier)
          ..add('source_', source_)
          ..add('loadedMs', loadedMs))
        .toString();
  }
}

class ConnectLoginStartReqBuilder
    implements Builder<ConnectLoginStartReq, ConnectLoginStartReqBuilder> {
  _$ConnectLoginStartReq? _$v;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  ConnectLoginStartReqSource_Enum? _source_;
  ConnectLoginStartReqSource_Enum? get source_ => _$this._source_;
  set source_(ConnectLoginStartReqSource_Enum? source_) =>
      _$this._source_ = source_;

  int? _loadedMs;
  int? get loadedMs => _$this._loadedMs;
  set loadedMs(int? loadedMs) => _$this._loadedMs = loadedMs;

  ConnectLoginStartReqBuilder() {
    ConnectLoginStartReq._defaults(this);
  }

  ConnectLoginStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifier = $v.identifier;
      _source_ = $v.source_;
      _loadedMs = $v.loadedMs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginStartReq;
  }

  @override
  void update(void Function(ConnectLoginStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginStartReq build() => _build();

  _$ConnectLoginStartReq _build() {
    final _$result = _$v ??
        new _$ConnectLoginStartReq._(
            identifier: BuiltValueNullFieldError.checkNotNull(
                identifier, r'ConnectLoginStartReq', 'identifier'),
            source_: BuiltValueNullFieldError.checkNotNull(
                source_, r'ConnectLoginStartReq', 'source_'),
            loadedMs: BuiltValueNullFieldError.checkNotNull(
                loadedMs, r'ConnectLoginStartReq', 'loadedMs'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

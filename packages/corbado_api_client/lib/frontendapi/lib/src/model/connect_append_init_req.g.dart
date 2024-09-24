// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectAppendInitReq extends ConnectAppendInitReq {
  @override
  final ClientInformation clientInformation;
  @override
  final BuiltMap<String, String> flags;

  factory _$ConnectAppendInitReq(
          [void Function(ConnectAppendInitReqBuilder)? updates]) =>
      (new ConnectAppendInitReqBuilder()..update(updates))._build();

  _$ConnectAppendInitReq._(
      {required this.clientInformation, required this.flags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'ConnectAppendInitReq', 'clientInformation');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectAppendInitReq', 'flags');
  }

  @override
  ConnectAppendInitReq rebuild(
          void Function(ConnectAppendInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendInitReqBuilder toBuilder() =>
      new ConnectAppendInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendInitReq &&
        clientInformation == other.clientInformation &&
        flags == other.flags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendInitReq')
          ..add('clientInformation', clientInformation)
          ..add('flags', flags))
        .toString();
  }
}

class ConnectAppendInitReqBuilder
    implements Builder<ConnectAppendInitReq, ConnectAppendInitReqBuilder> {
  _$ConnectAppendInitReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  ConnectAppendInitReqBuilder() {
    ConnectAppendInitReq._defaults(this);
  }

  ConnectAppendInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation.toBuilder();
      _flags = $v.flags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendInitReq;
  }

  @override
  void update(void Function(ConnectAppendInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendInitReq build() => _build();

  _$ConnectAppendInitReq _build() {
    _$ConnectAppendInitReq _$result;
    try {
      _$result = _$v ??
          new _$ConnectAppendInitReq._(
              clientInformation: clientInformation.build(),
              flags: flags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
        _$failedField = 'flags';
        flags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectAppendInitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

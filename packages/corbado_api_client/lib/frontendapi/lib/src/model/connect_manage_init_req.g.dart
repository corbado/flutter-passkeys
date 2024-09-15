// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageInitReq extends ConnectManageInitReq {
  @override
  final ClientInformationV2 clientInformation;
  @override
  final BuiltMap<String, String> flags;

  factory _$ConnectManageInitReq(
          [void Function(ConnectManageInitReqBuilder)? updates]) =>
      (new ConnectManageInitReqBuilder()..update(updates))._build();

  _$ConnectManageInitReq._(
      {required this.clientInformation, required this.flags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'ConnectManageInitReq', 'clientInformation');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectManageInitReq', 'flags');
  }

  @override
  ConnectManageInitReq rebuild(
          void Function(ConnectManageInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageInitReqBuilder toBuilder() =>
      new ConnectManageInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageInitReq &&
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
    return (newBuiltValueToStringHelper(r'ConnectManageInitReq')
          ..add('clientInformation', clientInformation)
          ..add('flags', flags))
        .toString();
  }
}

class ConnectManageInitReqBuilder
    implements Builder<ConnectManageInitReq, ConnectManageInitReqBuilder> {
  _$ConnectManageInitReq? _$v;

  ClientInformationV2Builder? _clientInformation;
  ClientInformationV2Builder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationV2Builder();
  set clientInformation(ClientInformationV2Builder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  ConnectManageInitReqBuilder() {
    ConnectManageInitReq._defaults(this);
  }

  ConnectManageInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation.toBuilder();
      _flags = $v.flags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageInitReq;
  }

  @override
  void update(void Function(ConnectManageInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageInitReq build() => _build();

  _$ConnectManageInitReq _build() {
    _$ConnectManageInitReq _$result;
    try {
      _$result = _$v ??
          new _$ConnectManageInitReq._(
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
            r'ConnectManageInitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

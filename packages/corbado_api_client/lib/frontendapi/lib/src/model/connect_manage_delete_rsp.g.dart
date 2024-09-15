// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_delete_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageDeleteRsp extends ConnectManageDeleteRsp {
  @override
  final String credentialID;

  factory _$ConnectManageDeleteRsp(
          [void Function(ConnectManageDeleteRspBuilder)? updates]) =>
      (new ConnectManageDeleteRspBuilder()..update(updates))._build();

  _$ConnectManageDeleteRsp._({required this.credentialID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        credentialID, r'ConnectManageDeleteRsp', 'credentialID');
  }

  @override
  ConnectManageDeleteRsp rebuild(
          void Function(ConnectManageDeleteRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageDeleteRspBuilder toBuilder() =>
      new ConnectManageDeleteRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageDeleteRsp &&
        credentialID == other.credentialID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, credentialID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectManageDeleteRsp')
          ..add('credentialID', credentialID))
        .toString();
  }
}

class ConnectManageDeleteRspBuilder
    implements Builder<ConnectManageDeleteRsp, ConnectManageDeleteRspBuilder> {
  _$ConnectManageDeleteRsp? _$v;

  String? _credentialID;
  String? get credentialID => _$this._credentialID;
  set credentialID(String? credentialID) => _$this._credentialID = credentialID;

  ConnectManageDeleteRspBuilder() {
    ConnectManageDeleteRsp._defaults(this);
  }

  ConnectManageDeleteRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _credentialID = $v.credentialID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageDeleteRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageDeleteRsp;
  }

  @override
  void update(void Function(ConnectManageDeleteRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageDeleteRsp build() => _build();

  _$ConnectManageDeleteRsp _build() {
    final _$result = _$v ??
        new _$ConnectManageDeleteRsp._(
            credentialID: BuiltValueNullFieldError.checkNotNull(
                credentialID, r'ConnectManageDeleteRsp', 'credentialID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
